# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hyprland GUI utilities"
HOMEPAGE="https://github.com/hyprwm/hyprland-guiutils"
SRC_URI="https://github.com/hyprwm/${PN}/archive/refs/tags/v${PV}/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	gui-libs/hyprutils:=
	gui-libs/hyprtoolkit:=
	dev-libs/hyprlang:=
	x11-libs/pixman
	x11-libs/libxkbcommon
	x11-libs/libdrm
"

DEPEND="${RDEPEND}"
