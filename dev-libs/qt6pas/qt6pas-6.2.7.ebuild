# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

LAZ_TAG=3_0
LAZ_VERSION=3.0.0
LAZ_DIRECTORY="lcl/interfaces/qt6/cbindings"
LAZ_UNPACKED_DIR="lazarus-lazarus_${LAZ_TAG}-${LAZ_DIRECTORY//\//-}"

DESCRIPTION="Free Pascal Qt5 bindings library updated by lazarus IDE."
HOMEPAGE="https://svn.freepascal.org/svn/lazarus/trunk/lcl/interfaces/qt5/cbindings"
SRC_URI="
	https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${LAZ_TAG}/lazarus-lazarus_${LAZ_TAG}.tar.gz?path=${LAZ_DIRECTORY} -> ${P}.tar.gz
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-qt/qtbase:6
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES="${FILESDIR}/qt-6.7.patch"

src_unpack() {
	default

	mv "${WORKDIR}/${LAZ_UNPACKED_DIR}/${LAZ_DIRECTORY}" "${WORKDIR}/${P}"
}

src_configure() {
	eqmake6 Qt6Pas.pro
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
