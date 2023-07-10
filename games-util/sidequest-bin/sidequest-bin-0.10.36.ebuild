# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils

DESCRIPTION="An open app store for VR devices such as the Oculus Quest 2"
HOMEPAGE="https://sidequestvr.com/"
SRC_URI="https://github.com/SideQuestVR/SideQuest/releases/download/v${PV}/SideQuest-${PV}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Taking from net-im/discord (Since both are electron applications.)
RDEPEND="
	|| (
		>=app-accessibility/at-spi2-core-2.46.0:2
		( app-accessibility/at-spi2-atk dev-libs/atk )
	)
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	dev-util/android-tools
	media-libs/alsa-lib
	media-libs/mesa[gbm(+)]
	net-print/cups
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libdrm
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/libxshmfence
	x11-libs/pango
"

S="${WORKDIR}/SideQuest-${PV}"

src_install() {
	dodir "/opt/${PN/-bin/}"

	# doins doesn't preserve executable bits, so we're using cp
	cp -r "${S}"/* "${ED}/opt/${PN/-bin/}"

	dosym "/opt/${PN/-bin/}/${PN/-bin/}" "/usr/bin/${PN/-bin/}"

	for res in 256 16 32 48 128 24 64 512; do
		newicon --size ${res} "${S}/resources/app.asar.unpacked/build/icons/${res}x${res}.png" ${PN/-bin/}.png
	done

	domenu "${FILESDIR}/SideQuest.desktop"

	dodoc LICENSE*
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
