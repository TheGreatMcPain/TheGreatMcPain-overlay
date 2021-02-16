# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cuda cmake toolchain-funcs flag-o-matic

DESCRIPTION="CUDA Plugin for xmrig"
HOMEPAGE="https://github.com/xmrig/xmrig-cuda"

if ver_test -eq "9999"; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/xmrig/xmrig-cuda.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/xmrig/xmrig-cuda/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-util/nvidia-cuda-toolkit
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/nvidia-cuda-toolkit
"

src_configure() {
	# Doesn't like LTO
	filter-flags -flto*

	# Force a GCC binary that CUDA supports (pulled from tensorflow)
	#
	# I'd like to find a ccache friendly solution, but I guess this
	# will have to do.
	export GCC_HOST_COMPILER_PATH="(cuda_gccdir)/$(tc-getCC)"

	cmake_src_configure
}

src_compile() {
	# We only need the shared object
	cmake_src_compile libxmrig-cuda.so
}

src_install() {
	# It appears that there's no install target.
	dolib.so "${BUILD_DIR}/libxmrig-cuda.so"
}

pkg_postinst() {
	einfo
	einfo "You should be able to enable CUDA for xmrig by"
	einfo "adding this to config.json:"
	einfo
	einfo ' "cuda": {'
	einfo '     "enable": true,'
	einfo "     \"loader\": \"/usr/lib64/libxmrig-cuda.so\","
	einfo ' }'
	einfo
}
