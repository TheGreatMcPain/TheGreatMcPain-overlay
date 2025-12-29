# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A modern C++ Wayland-native GUI toolkit"
HOMEPAGE="https://github.com/hyprwm/hyprtoolkit"

if [[ "${PV}" = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hyprwm/${PN}.git"
else
	SRC_URI="https://github.com/hyprwm/${PN}/archive/refs/tags/v${PV}/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	S="${WORKDIR}/${PN}-${PV}"

	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0/$(ver_cut 1-2)"

DEPEND="
	x11-libs/pixman
	dev-util/hyprwayland-scanner
	dev-libs/wayland
	dev-libs/wayland-protocols
	gui-libs/egl-gbm
	>=gui-libs/hyprutils-0.11.0
	>=dev-libs/hyprlang-0.6.0
	x11-libs/pixman
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-libs/cairo
	dev-libs/iniparser
	>=dev-libs/hyprgraphics-0.3.0
	>=gui-libs/aquamarine-0.10.0
"
RDEPEND="${DEPEND}"
