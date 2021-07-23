# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MULTILIB_COMPAT=( abi_x86_{32,64} )

inherit flag-o-matic meson multilib-minimal ninja-utils

DESCRIPTION="A Vulkan-based translation layer for Direct3D 10/11"
HOMEPAGE="https://github.com/doitsujin/dxvk"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/doitsujin/dxvk.git"
	EGIT_BRANCH="master"
	inherit git-r3
	SRC_URI=""
else
	SRC_URI="https://github.com/doitsujin/dxvk/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="-* ~amd64"
fi

LICENSE="ZLIB"
SLOT=0
IUSE="async-patch custom-cflags dxvk-config video_cards_nvidia"
REQUIRED_USE="|| ( abi_x86_32 abi_x86_64 )"

RESTRICT="test"

RDEPEND="
	|| (
		video_cards_nvidia? ( >=x11-drivers/nvidia-drivers-440.41 )
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

PATCHES=()
if ver_test -gt "1.6.1"; then
	# Restore winelib builds that were removed after 1.6.1.
	PATCHES+=(
		"${FILESDIR}/dxvk-restore-winelib-${PV}.patch"
		"${FILESDIR}/dxvk-restore-spec-files.patch"
		"${FILESDIR}/dxvk-revert-remove-vulkanfn.patch"
		"${FILESDIR}/double-define-r2.patch"
	)

	# Adds missing functions for winelib.
	if ver_test -gt "1.7.3"; then
		PATCHES+=("${FILESDIR}/dxvk-wineopenxr.patch")
	fi

	# The non-ascii fix breaks winelib. (TODO: find out why it doesn't work)
	if ver_test -ne "1.7.1"; then
		PATCHES+=("${FILESDIR}/dxvk-revert-handle-non-ascii.patch")
	fi
fi

if [[ ${PV} != "9999" ]] ; then
	S="${WORKDIR}/dxvk-${PV}"
fi

bits() {
	[[ ${ABI} = "amd64" ]] && echo 64
	[[ ${ABI} = "x86" ]]   && echo 32
}

# Return latest winegcc that's below 6.6.
setup_winegcc() {
	equery f $1 | grep /usr/bin | grep $2 | tail -n1
}

pkg_setup() {
	# Get the latest installed version of winegcc and wineg++.
	if $(has_version ">=app-emulation/wine-staging-5.9"); then
		WINEGPP=$(setup_winegcc "<app-emulation/wine-staging-6.6" "wineg++")
		WINEGCC=$(setup_winegcc "<app-emulation/wine-staging-6.6" "winegcc")
	elif $(has_version ">=app-emulation/wine-vanilla-5.9"); then
		WINEGPP=$(setup_winegcc "<app-emulation/wine-vanilla-6.6" "wineg++")
		WINEGCC=$(setup_winegcc "<app-emulation/wine-vanilla-6.6" "winegcc")
	else
		die "${P} requires a wine version newer than 5.9 to build."
	fi

	WINEGPP=${WINEGPP/"/usr/bin/"/}
	WINEGCC=${WINEGCC/"/usr/bin/"/}
}

src_prepare() {
	if use dxvk-config; then
		if ver_test -gt "1.8.1"; then
			PATCHES+=("${FILESDIR}/add-dxvk_config-winelib-library-1.8.2.patch")
		else
			PATCHES+=("${FILESDIR}/add-dxvk_config-winelib-library.patch")
		fi

		PATCHES+=("${FILESDIR}/add-dxvk_config-to-setup.patch")
	fi
	if use async-patch; then
		PATCHES+=("${FILESDIR}/dxvk-async.patch")
	fi

	# From bobwya's dxvk ebuild.
	filter-flags "-Wl,--hash-style*"
	[[ "$(is-flag "-march=*")" == "true" ]] && append-flags "-mno-avx"

	replace-flags "-O3" "-O3 -fno-stack-protector"

	# winelib doesn't like lto.
	filter-flags "-flto*"

	# -fcommon
	append-flags "-fcommon"

	default

	# Rename final setup script in README.md
	sed -i -e "s|./setup_dxvk.sh|${PV}-setup|g" "${S}/README.md" \
		|| die "sed failed"
	sed -i -e "s#basedir=.*#basedir=\"${EPREFIX}/usr\"#" "${S}/setup_dxvk.sh" \
		|| die "sed failed"

	# From bobwya's dxvk ebuild.
	# Delete installation instructions for unused ABIs.
	if use abi_x86_32; then
		sed -i '\|installFile "$win32_sys_path"|d' "${S}/setup_dxvk.sh" \
			|| die "sed failed"
	fi
	if use abi_x86_64; then
		sed -i '\|installFile "$win64_sys_path"|d' "${S}/setup_dxvk.sh" \
			|| die "sed failed"
	fi

	bootstrap_dxvk() {
		# Set DXVK location for each ABI
		sed -e "s#x$(bits)#$(get_libdir)/${PN}#" -i "${S}/setup_dxvk.sh" \
			|| die "sed failed"

		# Newer dxvk versions need winegcc 5.9 to build,
		# so I'll use the latest version of winegcc.
		sed -i \
			-e "s!winegcc!$WINEGCC!" \
			-e "s!wineg++!$WINEGPP!" \
			build-wine$(bits).txt \
			|| die "sed failed"
	}

	multilib_foreach_abi bootstrap_dxvk
}

multilib_src_configure() {
	local emesonargs=(
		--cross-file="${S}/build-wine$(bits).txt"
		--libdir="$(get_libdir)/${PN}"
		--bindir="$(get_libdir)/${PN}/bin"
		-Denable_tests=false
	)

	if ver_test -le "1.7.4"; then
		if use custom-cflags; then
			emesonargs+=(
				-Dc_args="${CFLAGS} -m$(bits) -fvisibility=hidden"
				-Dcpp_args="${CXXFLAGS} -m$(bits) -fvisibility=hidden -fvisibility-inlines-hidden -D__WIDL_objidl_generated_name_0000000C="
				-Dc_link_args="${LDFLAGS} -m$(bits) -mwindows -lpthread"
				-Dcpp_link_args="${LDFLAGS} -m$(bits) -mwindows -lpthread"
			)
		else
			emesonargs+=(
				-Dc_args="-m$(bits) -fvisibility=hidden"
				-Dcpp_args="-m$(bits) -fvisibility=hidden -fvisibility-inlines-hidden -D__WIDL_objidl_generated_name_0000000C="
				-Dc_link_args="-m$(bits) -mwindows -lpthread"
				-Dcpp_link_args="-m$(bits) -mwindows -lpthread"
			)
		fi
	else
		if use custom-cflags; then
			emesonargs+=(
				-Dc_args="${CFLAGS}"
				-Dcpp_args="${CXXFLAGS}"
				-Dc_link_args="${LDFLAGS} -lpthread"
				-Dcpp_link_args="${LDFLAGS} -lpthread"
			)
		fi
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
	newbin "setup_dxvk.sh" "${PN}-setup"

	dodoc "${S}/dxvk.conf"

	einstalldocs
}

pkg_postinst() {
	ewarn ""
	ewarn "This is the winelib version of dxvk."
	ewarn "As of versions greater than 1.6.1 winelib has been completely"
	ewarn "removed from upstream, and is no longer supported."
	ewarn ""
	ewarn "This ebuild restores winelib builds after 1.6.1."
	ewarn "So, if you run into any build related problems"
	ewarn "DO NOT REPORT THEM TO UPSTREAM."
	ewarn ""
	ewarn "You may report winelib build issues to my gentoo overlay at:"
	ewarn "<https://gitlab.com/TheGreatMcPain/thegreatmcpain-overlay>"
	ewarn ""
	if use async-patch; then
		elog ""
		elog "You have enabled the 'async-patch' useflag."
		elog "Keep in mind that this patch is unsupported, but may yeld"
		elog "a more stutter-free experience."
		elog ""
		elog "To use it just set the environment variable DXVK_ASYNC=1."
		elog ""
		elog "More information can be found here: https://github.com/Sporif/dxvk-async"
	fi
	elog ""
	elog "dxvk installed, but not activated. You have to install the DLLs to a WINEPREFIX."
	elog "To do this you just need to set WINEPREFIX: $ export WINEPREFIX=/path/to/prefix"
	elog "then run: $ ${PN}-setup install --symlink"
	elog ""
}
