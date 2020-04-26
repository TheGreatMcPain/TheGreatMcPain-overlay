# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MULTILIB_COMPAT=( abi_x86_{32,64} )

inherit meson multilib-minimal flag-o-matic

DESCRIPTION="dxvk_config.dll library from Valve's Proton (winelib)"
HOMEPAGE="https://github.com/ValveSoftware/dxvk"

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

RESTRICT="test"

RDEPEND="
	|| (
		>=app-emulation/wine-vanilla-3.14:*[${MULTILIB_USEDEP},vulkan]
		>=app-emulation/wine-staging-3.14:*[${MULTILIB_USEDEP},vulkan]
	)"
DEPEND="${RDEPEND}
	dev-util/glslang"

if [[ ${PV} != "9999" ]] ; then
	S="${WORKDIR}/dxvk-${PV}"
fi

# Convert PV to not doted integer
PVINT=$(echo "${PV//./}")
# Restore winelib builds that were removed after 1.6.1.
PATCHES=()
if [[ "${PVINT}" -gt "161" ]]; then
	PATCHES+=("${FILESDIR}/dxvk-restore-winelib.patch")
fi
PATCHES+=(
	"${FILESDIR}/flags.patch"
	"${FILESDIR}/add-dxvk_config-library.patch"
)

bits() { [[ ${ABI} = amd64 ]] && echo 64 || echo 32; }

src_prepare() {
	default

	# For some reason avx is causing issues,
	# so disable it if '-march' is used.
	if [ $(is-flag "-march=*") = "true" ]; then
		append-flags "-mno-avx"
	fi

	replace-flags "-O3" "-O3 -fno-stack-protector"

	# Create versioned setup script
	cp "setup_dxvk.sh" "dxvk-config-setup"
	sed \
		-e "s#with_dxgi=1#with_dxgi=0#" \
		-e "s#\$action d3d1.*##" \
		-e "s#basedir=.*#basedir=\"${EPREFIX}/usr\"#" -i "dxvk-config-setup" || die

	bootstrap_dxvk() {
		# Set DXVK location for each ABI
		sed -e "s#x$(bits)#$(get_libdir)/dxvk-config#" -i "${S}/dxvk-config-setup" || die

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
		-i "dxvk-config-setup" || die
}

multilib_src_configure() {
	local emesonargs=(
		--cross-file="${S}/build-wine$(bits).txt"
		--libdir="$(get_libdir)/dxvk-config"
		--bindir="$(get_libdir)/dxvk-config/bin"
		-Denable_tests=false
		-Denable_dxgi=false
		-Denable_d3d9=false
		-Denable_d3d10=false
		-Denable_d3d11=false
	)
	meson_src_configure
}

multilib_src_install() {
	meson_src_install
}

multilib_src_install_all() {
	# create combined setup helper
	exeinto /usr/bin
	doexe "${S}/dxvk-config-setup"

	dodoc "${S}/dxvk.conf"

	einstalldocs
}
