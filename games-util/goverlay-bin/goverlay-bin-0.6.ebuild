# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg-utils

DESCRIPTION="GOverlay is a Graphical UI to help manage Linux overlays. (binary version)"
HOMEPAGE="https://github.com/benjamimgois/goverlay"

SRC_URI="https://github.com/benjamimgois/goverlay/releases/download/0.6/goverlay_0_6.tar.xz -> ${P}.tar.xz"
KEYWORDS="~amd64"

LICENSE="GPL-3"
SLOT="0"
IUSE="opengl vulkan"

DEPEND="
	!games-util/goverlay
	opengl? (
		x11-apps/mesa-progs
	)
	vulkan? (
		dev-util/vulkan-tools
	)
"

RDEPEND="${DEPEND}"

BDEPEND="
	dev-libs/qt5pas
"

S="${WORKDIR}"

src_install() {
	dobin "goverlay"
	domenu "${FILESDIR}/io.github.benjamimgois.goverlay.desktop"
	insinto "/usr/share/metainfo"
	doins "${FILESDIR}/io.github.benjamimgois.goverlay.metainfo.xml"
	doman "${FILESDIR}/goverlay.1"
	doicon "${FILESDIR}/goverlay.png"
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update

	einfo ""
	einfo "Goverlay is a GUI program for configuring MangoHUD, and vkBasalt."
	einfo ""
	einfo "MangoHUD can be installed via the pkg <games-util/mangohud>."
	einfo "vkBasalt can be installed via the pkg <games-util/vkbasalt>."
	einfo ""
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
