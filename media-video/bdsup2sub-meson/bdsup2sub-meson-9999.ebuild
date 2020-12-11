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
	einfo "This fork of bdsup2sub++ has been modified, so that it can"
	einfo "be used as a subproject incase a C++ project wanted to use"
	einfo "bdsup2sub++ without needing to run it as a seperate executable."
	einfo
	einfo "An example of this can be found in my 3Dsuptools project"
	einfo "which is located here: https://gitlab.com/TheGreatMcPain/3dsuptools"
	einfo
}
