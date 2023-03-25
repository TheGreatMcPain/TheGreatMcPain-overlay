# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A Hyprland plugin to provide awesome-like workspace behavior"
HOMEPAGE="https://github.com/Duckonaut/split-monitor-workspaces"

EGIT_REPO_URI="https://github.com/Duckonaut/split-monitor-workspaces"

# Upstream needs to pick a LICENSE
LICENSE="BSD"
SLOT="0"
KEYWORDS=""

DEPEND="
	gui-wm/hyprland[source]
	gui-libs/wlroots
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	export HYPRLAND_HEADERS="/usr/share/hyprland/src"

	emake all
}

src_install() {
	insinto "/usr/share/hyprland/plugins"

	doins split-monitor-workspaces.so
}

pkg_postinst() {
	einfo
	einfo "Plugin is located in /usr/share/hyprland/plugins/split-monitor-workspaces.so"
	einfo
	einfo "To load just run: hyprctl plugin load /usr/share/hyprland/plugins/split-monitor-workspaces.so"
	einfo
}
