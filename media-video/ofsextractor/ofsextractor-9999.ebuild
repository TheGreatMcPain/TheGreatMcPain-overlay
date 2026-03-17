# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo

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

if [ "9999" == "${PV}" ]; then
	src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack
	}

	src_configure() {
		cargo_src_configure --frozen
	}
fi
