# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop

DESCRIPTION="An Electron app designed to provide an offline experience for VIA."
HOMEPAGE="https://github.com/cebby2420/via-desktop"
SRC_URI="https://github.com/cebby2420/via-desktop/releases/download/v${PV}/via-desktop_${PV}_amd64.deb -> ${P}.deb"

S="${WORKDIR}/usr"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

## FROM app-misc/via::guru ##
# Except for sys-libs/zlib, these dependencies were extracted from the shared
# libraries required by the via-nativia executable; it's not clear whether
# these are all _actually_ required, or whether the list is extensive because
# the executable is an Electron app.
RDEPEND="
	app-accessibility/at-spi2-core
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/mesa
	net-print/cups
	sys-apps/dbus
	sys-libs/zlib
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libdrm
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/pango
"

src_install() {
	insinto /usr/lib/via-desktop
	doins -r "lib/via-desktop"/*

	exeinto /usr/lib/via-desktop
	doexe "lib/via-desktop/chrome-sandbox"
	doexe "lib/via-desktop/chrome_crashpad_handler"
	doexe "lib/via-desktop/libEGL.so"
	doexe "lib/via-desktop/libffmpeg.so"
	doexe "lib/via-desktop/libGLESv2.so"
	doexe "lib/via-desktop/libvk_swiftshader.so"
	doexe "lib/via-desktop/libvulkan.so.1"
	doexe "lib/via-desktop/via-desktop"

	dosym -r "/usr/lib/via-desktop/via-desktop" "/usr/bin/via-desktop"

	domenu "share/applications/via-desktop.desktop"
	doicon "share/pixmaps/via-desktop.png"
	dodoc "share/doc/via-desktop/copyright"
}
