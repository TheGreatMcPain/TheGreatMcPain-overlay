# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Ebuild also allows to download .iso file with given host software for Windows.

EAPI=7

MY_PN="LookingGlass"
MY_PV="${PV//1_beta/B}"
MY_PV="${MY_PV//_/-}"

inherit cmake tmpfiles

DESCRIPTION="A low latency KVM FrameRelay implementation for guests with VGA PCI Passthrough"
HOMEPAGE="https://looking-glass.io"
SRC_URI="https://looking-glass.io/artifact/${MY_PV}/source -> ${PN}-${MY_PV}.tar.gz
	host? ( https://looking-glass.io/artifact/${MY_PV}/host -> ${PN}-${MY_PV}-host.zip )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+host wayland X"

RDEPEND="dev-libs/libconfig:0=
	dev-libs/nettle:=[gmp]
	media-libs/freetype:2
	media-libs/fontconfig:1.0
	media-libs/libsdl2
	media-libs/sdl2-ttf
	virtual/glu
	X? (
		x11-libs/libX11
		x11-libs/libXfixes
		x11-libs/libXi
		x11-libs/libXScrnSaver
		x11-libs/libXpresent
	)
	wayland? (
		dev-libs/wayland
	)"
DEPEND="${RDEPEND}
	app-emulation/spice-protocol
	dev-libs/wayland-protocols"
BDEPEND="virtual/pkgconfig
	host? ( app-arch/unzip )
	host? ( app-cdr/cdrtools )"

S="${WORKDIR}/${PN}"

CMAKE_USE_DIR="${S}"/client

src_unpack() {

	for FILE in ${A}; do
		if [[ "${FILE}" == *".tar.gz" ]]; then
			# unpack source files
			unpack "${FILE}"
			mv "${WORKDIR}/${PN}-${MY_PV}" "${WORKDIR}/${PN}"
		fi

		if [[ "${FILE}" == *".zip" ]]; then
	                # Extract the host exe file
	                mkdir "${PN}-host"
	                cd "${PN}-host"
	                unpack "${FILE}"
                fi
	done

}

src_prepare() {
	default

	if use host ; then
		# Host file comes as zip but we need it to be .iso in order to mount it in QEMU"
		mkisofs -lJR -iso-level 4 -o "${PN}-host-${MY_PV}.iso" "${WORKDIR}/${PN}-host"
		rm -R "${WORKDIR}/${PN}-host"
	fi

	cmake_src_prepare
}

src_configure() {
	if ! use X ; then
		local mycmakeargs+=(
			-DENABLE_X11=no
		)
	fi

	if ! use wayland ; then
		local mycmakeargs+=(
			-DENABLE_WAYLAND=no
		)
	fi

	cmake_src_configure
}

src_install() {
	einstalldocs

	dobin "${BUILD_DIR}"/looking-glass-client
	newtmpfiles "${FILESDIR}"/${PN}-tmpfiles.d ${PN}.conf

	dodir /etc/env.d
	echo "CONFIG_PROTECT=/usr/lib/tmpfiles.d/looking-glass.conf" >> "${ED}"/etc/env.d/99looking-glass || die

	if use host ; then
		insinto /usr/share/drivers/windows
		doins "${PN}-host-${MY_PV}.iso"
		dosym "${PN}-host-${MY_PV}.iso" "/usr/share/drivers/windows/${PN}-host.iso"
	fi
}
