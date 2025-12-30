# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A GUI Pipewire control center built on hyprtoolkit."

HOMEPAGE="https://github.com/hyprwm/hyprpwcenter"
SRC_URI="
	https://github.com/hyprwm/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	media-video/pipewire
	gui-libs/hyprtoolkit
	x11-libs/pixman
	x11-libs/libdrm
	gui-libs/hyprutils
"
RDEPEND="${DEPEND}"
