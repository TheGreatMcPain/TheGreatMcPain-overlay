# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Adds title bars to Hyprland windows"
HOMEPAGE="https://github.com/hyprwm/hyprland-plugins"

EGIT_REPO_URI="https://github.com/hyprwm/hyprland-plugins"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

DEPEND="
	gui-wm/hyprland[source]
	gui-libs/wlroots
"
RDEPEND="${DEPEND}"
BDEPEND=""

export S="${WORKDIR}/${P}/hyprbars"

src_compile() {
	export HYPRLAND_HEADERS="/usr/share/hyprland/src"

	emake all
}

src_install() {
	insinto "/usr/share/hyprland/plugins"

	doins hyprbars.so
}

pkg_postinst() {
	einfo
	einfo "Plugin is located in /usr/share/hyprland/plugins/hyprbars.so"
	einfo
	einfo "To load just run: hyprctl plugin load /usr/share/hyprland/plugins/hyprbars.so"
	einfo
}
