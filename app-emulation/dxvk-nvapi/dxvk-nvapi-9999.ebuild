# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LTO_ENABLE_FLAGOMATIC="yes"

inherit flag-o-matic meson mingw64 multilib-minimal ninja-utils

DESCRIPTION="Alternative NVAPI implementation on top of DXVK"
HOMEPAGE="https://github.com/jp7677/dxvk-nvapi"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/jp7677/dxvk-nvapi.git"
	EGIT_BRANCH="master"
	inherit git-r3
	SRC_URI=""
else
	EGIT_REPO_URI="https://github.com/jp7677/dxvk-nvapi.git"
	EGIT_COMMIT="v${PV}"
	inherit git-r3
	SRC_URI=""
	KEYWORDS="-* ~amd64"
fi

LICENSE="MIT"
SLOT=0
IUSE="custom-cflags debug video_cards_nvidia"
REQUIRED_USE="|| ( abi_x86_32 abi_x86_64 )"

RESTRICT="test"

RDEPEND="
	|| (
		video_cards_nvidia? ( >=x11-drivers/nvidia-drivers-440.31 )
		>=media-libs/mesa-19.2
	)
	|| (
		>=app-emulation/wine-vanilla-4.5:*[${MULTILIB_USEDEP},vulkan]
		>=app-emulation/wine-staging-4.5:*[${MULTILIB_USEDEP},vulkan]
	)"

DEPEND="${RDEPEND}
	dev-util/glslang
	dev-util/vulkan-headers"

BDEPEND="
	>=dev-util/meson-0.46"

if [[ ${PV} != "9999" ]] ; then
	S="${WORKDIR}/dxvk-nvapi-${PV}"
fi

PATCHES=()

bits() {
	[[ ${ABI} = "amd64" ]] && echo 64
	[[ ${ABI} = "x86" ]]   && echo 32
}

pkg_pretend() {
	# Requres mingw64-runtime-9.0.0
	mingw64_check_requirements "9.0.0" "8.0.0"
}

pkg_setup() {
	mingw64_check_requirements "9.0.0" "8.0.0"
}

src_prepare() {
	# From bobwya's dxvk ebuild.
	filter-flags "-Wl,--hash-style*"
	[[ "$(is-flag "-march=*")" == "true" ]] && append-flags "-mno-avx"

	replace-flags "-O3" "-O3 -fno-stack-protector"

	default
}

multilib_src_configure() {
	# If we use portage's strip FEATURE it will
	# try to use the native strip program, so let meson
	# do the stripping.
	local emesonargs=(
		--cross-file="${S}/build-win$(bits).txt"
		--libdir="$(get_libdir)/${PN}"
		--bindir="$(get_libdir)/${PN}"
		"$(usex debug '' '--strip')"
		-Denable_tests=false
	)

	if use custom-cflags; then
		emesonargs+=(
			-Dc_args="${CFLAGS}"
			-Dcpp_args="${CXXFLAGS}"
		)
	fi

	if use custom-cflags; then
		emesonargs+=(
			-Dc_link_args="${LDFLAGS}"
			-Dcpp_link_args="${LDFLAGS}"
		)
	fi

	meson_src_configure
}

multilib_src_compile() {
	meson_src_compile
}

multilib_src_install() {
	meson_src_install
}

multilib_src_install_all() {
	find "${D}" -name '*.a' -delete -print

	einstalldocs
}

pkg_postinst() {
	elog
	elog "For now this ebuild doesn't have a installation script for dxvk-nvapi."
	elog
	elog "The libraries are stored in the following directories..."
	elog "/lib64/dxvk-nvpi for 64bit and /lib/dxvk-nvapi for 32bit"
	elog
	elog "To install to a wine prefix simply copy the nvapi(64).dll (from /lib(64)/dxvk-nvapi)"
	elog "and place them into your wine prefix's syswow64/system32 directories."
	elog "Then use winecfg to set nvapi and nvapi64 to native."
	elog
}
