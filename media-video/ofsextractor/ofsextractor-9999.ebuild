# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="3D Plane extractor for 3D Bluray MVC streams."
HOMEPAGE="https://gitlab.com/TheGreatMcPain/OFSExtractor"

if [ "9999" == "${PV}" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/TheGreatMcPain/OFSExtractor.git"
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="MIT"
SLOT="0"
IUSE=""
