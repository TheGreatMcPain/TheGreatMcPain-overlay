# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION=""
HOMEPAGE="https://github.com/justdan96/tsMuxer"

inherit git-r3
EGIT_REPO_URI="https://github.com/justdan96/tsMuxer.git"
SRC_URI=""
KEYWORDS=""

LICENSE="Apache-2.0"
SLOT="0"
IUSE="qt5"

DEPEND="
	media-libs/freetype
	sys-libs/zlib
	qt5? (
		dev-qt/qtbase:5=
		dev-qt/qtdeclarative:5=
		dev-qt/qtmultimedia:5=[widgets]
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DTSMUXER_GUI=$(usex qt5)
	)
	cmake_src_configure
}
