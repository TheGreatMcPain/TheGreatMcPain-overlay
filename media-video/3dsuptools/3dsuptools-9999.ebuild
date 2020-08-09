# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="WIP 2D to 3D BDSUP subtitle converter (based on BD3D2MK3D)."
HOMEPAGE="https://gitlab.com/TheGreatMcPain/3Dsuptools"

if [ "9999" == "${PV}" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/TheGreatMcPain/3Dsuptools.git"
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	media-gfx/imagemagick[cxx]
	dev-libs/tinyxml2"
