# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MULTILIB_COMPAT=( abi_x86_{32,64} )

inherit meson multilib-minimal flag-o-matic

DESCRIPTION="A Vulkan-based translation layer for Direct3D 10/11"
HOMEPAGE="https://github.com/doitsujin/dxvk"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/doitsujin/dxvk.git"
	inherit git-r3
	SRC_URI=""
else
	SRC_URI="https://github.com/doitsujin/dxvk/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="-* ~amd64"
fi

LICENSE="ZLIB"
SLOT=0
IUSE="custom-cflags dxvk-config"
RESTRICT="test"

RDEPEND="
	|| (
		>=app-emulation/wine-vanilla-3.14:*[${MULTILIB_USEDEP},vulkan]
		>=app-emulation/wine-staging-3.14:*[${MULTILIB_USEDEP},vulkan]
	)"
DEPEND="${RDEPEND}
	dev-util/glslang"

# Convert PV to not doted integer
PVINT=$(echo "${PV//./}")
# Restore winelib builds that were removed after 1.6.1.
PATCHES=()
if [[ "${PVINT}" -gt "161" ]]; then
	PATCHES+=(
		"${FILESDIR}/dxvk-restore-winelib.patch"
		"${FILESDIR}/dxvk-restore-spec-files.patch"
	)
fi

bits() { [[ ${ABI} = amd64 ]] && echo 64 || echo 32; }

src_prepare() {
	if use dxvk-config; then
		PATCHES+=(
			"${FILESDIR}/add-dxvk_config-winelib-library.patch"
			"${FILESDIR}/add-dxvk_config-to-setup.patch"
		)
	fi
	if use custom-cflags; then
		PATCHES+=("${FILESDIR}/flags.patch")
	fi
	default

	# For some reason avx is causing issues,
	# so disable it if '-march' is used.
	if [ $(is-flag "-march=*") = "true" ]; then
		append-flags "-mno-avx"
	fi

	replace-flags "-O3" "-O3 -fno-stack-protector"

	# Create versioned setup script
	cp "setup_dxvk.sh" "dxvk-setup"
	sed -e "s#basedir=.*#basedir=\"${EPREFIX}/usr\"#" -i "dxvk-setup" || die

	bootstrap_dxvk() {
		# Set DXVK location for each ABI
		sed -e "s#x$(bits)#$(get_libdir)/dxvk#" -i "${S}/dxvk-setup" || die

		# Add *FLAGS to cross-file
		sed -i \
			-e "s!@CFLAGS@!$(_meson_env_array "${CFLAGS}" -fpermissive)!" \
			-e "s!@CXXFLAGS@!$(_meson_env_array "${CXXFLAGS}" -fpermissive)!" \
			-e "s!@LDFLAGS@!$(_meson_env_array "${LDFLAGS}")!" \
			build-wine$(bits).txt || die
	}

	multilib_foreach_abi bootstrap_dxvk

	# Clean missed ABI in setup script
	sed -e "s#.*x32.*##" -e "s#.*x64.*##" \
		-i "dxvk-setup" || die
}

multilib_src_configure() {
	local emesonargs=(
		--cross-file="${S}/build-wine$(bits).txt"
		--libdir="$(get_libdir)/dxvk"
		--bindir="$(get_libdir)/dxvk/bin"
		-Denable_tests=false
	)
	meson_src_configure
}

multilib_src_install() {
	meson_src_install
}

multilib_src_install_all() {
	# create combined setup helper
	exeinto /usr/bin
	doexe "${S}/dxvk-setup"

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
	elog ""
	elog "dxvk installed, but not activated. You have to install the DLLs to a WINEPREFIX."
	elog "To do this you just need to set WINEPREFIX: $ export WINEPREFIX=/path/to/prefix"
	elog "then run: $ ${PN}-setup install --symlink"
	elog ""
}
