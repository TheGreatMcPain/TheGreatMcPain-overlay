# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Port of the original BDSup2Sub to C++ and Qt. (Fork that uses the meson buildsystem.)"
HOMEPAGE="https://github.com/TheGreatMcPain/BDSup2SubPlusPlus"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/TheGreatMcPain/BDSup2SubPlusPlus.git"
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
"

RDEPEND="${DEPEND}"
BDEPEND=""

pkg_postinst() {
	einfo
	einfo "This package includes the libbdsup2sub++ library."
	einfo
	einfo "This allows you to include bdsup2sub++ in a cpp project"
	einfo "without having to start a bdsup2sub++ process."
	einfo
	einfo "For an example usage just go to this project's homepage,"
	einfo "look at src/main.cpp"
	einfo
}
