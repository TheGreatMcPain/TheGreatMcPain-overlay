# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Port of the original BDSup2Sub to C++ and Qt. (TheGreatMcPain fork)"
HOMEPAGE="https://github.com/TheGreatMcPain/BDSup2SubPlusPlus"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/TheGreatMcPain/BDSup2SubPlusPlus.git"
	SRC_URI=""
	KEYWORDS=""
else
	MY_PV="${PV/_beta/c}"
	SRC_URI="https://github.com/TheGreatMcPain/BDSup2SubPlusPlus/archive/${MY_PV}.tar.gz
		-> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="
	dev-qt/qtbase:6[widgets,xml]
"

RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/BDSup2SubPlusPlus-${MY_PV}"

src_compile() {
	pushd src
	eqmake6
	emake
	popd
}

src_install() {
	dobin src/bdsup2sub++
}
