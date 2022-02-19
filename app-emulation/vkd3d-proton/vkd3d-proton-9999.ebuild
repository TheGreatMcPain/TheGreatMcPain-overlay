# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LTO_ENABLE_FLAGOMATIC="yes"

inherit flag-o-matic meson mingw64 multilib-minimal ninja-utils git-r3

DESCRIPTION="Fork of VKD3D. Development branches for Proton's Direct3D 12 implementation."
HOMEPAGE="https://github.com/HansKristian-Work/vkd3d-proton"
EGIT_REPO_URI="https://github.com/HansKristian-Work/vkd3d-proton.git"

if [[ ${PV} == "9999" ]] ; then
	EGIT_BRANCH="master"
else
	EGIT_COMMIT="v${PV}"
	KEYWORDS="-* ~amd64"
fi

LICENSE="LGPL-2"
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
	S="${WORKDIR}/vkd3d-proton-${PV}"
fi

PATCHES=()

bits() {
	[[ ${ABI} = "amd64" ]] && echo 64
	[[ ${ABI} = "x86" ]]   && echo 32
}
altbits() {
	[[ ${ABI} = "amd64" ]] && echo 64
	[[ ${ABI} = "x86" ]] && echo 86
}

pkg_pretend() {
	mingw64_check_requirements "6.0.0" "8.0.0"
}

pkg_setup() {
	mingw64_check_requirements "6.0.0" "8.0.0"
}

src_prepare() {
	# From bobwya's dxvk ebuild.
	filter-flags "-Wl,--hash-style*"
	[[ "$(is-flag "-march=*")" == "true" ]] && append-flags "-mno-avx"

	replace-flags "-O3" "-O3 -fno-stack-protector"

	default

	# Rename final setup script in README.md
	# sed -i -e "s|./setup_vkd3d_proton.sh|${PV}-setup|g" "${S}/README.md" \
	# 	|| die "sed failed"
	sed -i -e "s#basedir=.*#basedir=\"${EPREFIX}/usr\"#" "${S}/setup_vkd3d_proton.sh" \
		|| die "sed failed"

	# From bobwya's dxvk ebuild.
	# Delete installation instructions for unused ABIs.
	if use abi_x86_32; then
		sed -i '\|installFile "$win32_sys_path"|d' "${S}/setup_vkd3d_proton.sh" \
			|| die "sed failed"
	fi
	if use abi_x86_64; then
		sed -i '\|installFile "$win64_sys_path"|d' "${S}/setup_vkd3d_proton.sh" \
			|| die "sed failed"
	fi

	bootstrap_vkd3d() {
		# Set VKD3D location for each ABI
		sed -e "s#x$(altbits)#$(get_libdir)/${PN}#" -i "${S}/setup_vkd3d_proton.sh" \
			|| die "sed failed"
	}

	multilib_foreach_abi bootstrap_vkd3d
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
			-Dc_link_args="${LDFLAGS} -static -static-libgcc"
			-Dcpp_link_args="${LDFLAGS} -static -static-libgcc -static-libstdc++"
		)
	else
		emesonargs+=(
			-Dc_link_args="-static -static-libgcc"
			-Dcpp_link_args="-static -static-libgcc -static-libstdc++"
		)
	fi

	# if ver_test -le "1.7.4"; then
	# 	if use custom-cflags; then
	# 		emesonargs+=(
	# 			-Dc_link_args="${LDFLAGS} -static -static-libgcc"
	# 			-Dcpp_link_args="${LDFLAGS} -static -static-libgcc -static-libstdc++"
	# 		)
	# 	else
	# 		emesonargs+=(
	# 			-Dc_link_args="-static -static-libgcc"
	# 			-Dcpp_link_args="-static -static-libgcc -static-libstdc++"
	# 		)
	# 	fi
	# else
	# 	if use custom-cflags; then
	# 		emesonargs+=(
	# 			-Dc_link_args="${LDFLAGS}"
	# 			-Dcpp_link_args="${LDFLAGS}"
	# 		)
	# 	fi
	# fi

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

	newbin "setup_vkd3d_proton.sh" "${PN}-setup"

	einstalldocs
}

pkg_postinst() {
	elog ""
	elog "vkd3d-proton installed, but not activated. You have to install the DLLs to a WINEPREFIX."
	elog "To do this you just need to set WINEPREFIX: $ export WINEPREFIX=/path/to/prefix"
	elog "then run: $ ${PN}-setup install --symlink"
	elog ""
}
