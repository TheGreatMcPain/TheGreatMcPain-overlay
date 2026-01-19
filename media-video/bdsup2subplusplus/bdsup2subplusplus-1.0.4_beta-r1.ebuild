# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Port of the original BDSup2Sub to C++ and Qt. (captainayy fork)"
HOMEPAGE="https://github.com/captainayy/BDSup2SubPlusPlus"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/captainayy/BDSup2SubPlusPlus.git"
	SRC_URI=""
	KEYWORDS=""
else
	MY_PV="${PV/_beta/}"
	SRC_URI="https://github.com/captainayy/BDSup2SubPlusPlus/archive/${MY_PV}.tar.gz"
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

PATCHES="
	${FILESDIR}/0001-Make-compatible-with-Qt6.patch
	${FILESDIR}/0001-index-fix.patch
"

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
