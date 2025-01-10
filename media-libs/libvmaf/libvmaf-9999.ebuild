# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cuda meson-multilib flag-o-matic toolchain-funcs

DESCRIPTION="C libary for Netflix's Perceptual video quality assessment"
HOMEPAGE="https://github.com/Netflix/vmaf"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Netflix/vmaf.git"
else
	SRC_URI="
		https://github.com/Netflix/vmaf/archive/v${PV}.tar.gz -> ${P}.tar.gz
	"
	KEYWORDS="~amd64 ~loong ~riscv ~x86"
fi

LICENSE="BSD-2-with-patent"
SLOT="0/3"
IUSE="cuda +embed-models test"

RESTRICT="!test? ( test )"

BDEPEND="
	dev-lang/nasm
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	embed-models? ( app-editors/vim-core )
"

RDEPEND="${BDEPEND}"

if [[ ${PV} == "9999" ]]; then
	S="${WORKDIR}/libvmaf-${PV}"
else
	S="${WORKDIR}/vmaf-${PV}"
fi

src_prepare() {
	default

	# Workaround for https://bugs.gentoo.org/837221
	# The paths in the tests are hard coded to look for the model folder as "../../model"
	sed -i "s|\"../../model|\"../vmaf-${PV}/model|g" "${S}"/libvmaf/test/* || die

	# CUDA include path is hardcoded for some reason.
	sed -i "s|/usr/local/cuda/include|/opt/cuda/include/|g" "${S}"/libvmaf/src/meson.build || die

	# Buildsystem directly calls nvcc here, we need to add --compiler-bindir
	sed -i "s|\[nvcc_exe|\[nvcc_exe, '--compiler-bindir', '$(cuda_gccdir)'|" "${S}"/libvmaf/src/meson.build || die

	cuda_src_prepare
}

multilib_src_configure() {
	export CUDA_PATH="/opt/cuda"
	elog ${NVCCFLAGS}
	local emesonargs=(
		-Dcpp_args="-Wno-error -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-implicit-function-declaration"
		-Dc_args="-Wno-error -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-implicit-function-declaration"
		-Dwarning_level=0
		$(meson_use embed-models built_in_models)
		$(meson_use test enable_tests)
		$(meson_native_use_bool cuda enable_cuda)
	)

	if use cuda; then
		emesonargs+=(
			-Dcuda_ccbindir=$(cuda_gccdir)
		)
	fi

	EMESON_SOURCE="${S}/libvmaf"
	build_base="$(basename ${BUILD_DIR})"
	export BUILD_DIR="${EMESON_SOURCE}/${build_base}"
	filter-lto
	meson_src_configure
}

multilib_src_compile() {
	build_base="$(basename ${BUILD_DIR})"
	export BUILD_DIR="${EMESON_SOURCE}/${build_base}"
	meson_src_compile
}

multilib_src_install() {
	meson_src_install
	find "${D}" -name '*.la' -delete -o -name '*.a' -delete || die
}

multilib_src_install_all() {
	einstalldocs

	insinto "/usr/share/vmaf"
	doins -r "${S}/model"
}
