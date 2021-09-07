# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

LAZ_COMMIT="1159b4327b97e0283fed38d091b057172123a291"
LAZ_DIRECTORY="lcl/interfaces/qt5/cbindings"
LAZ_UNPACKED_DIR="lazarus-${LAZ_COMMIT}-${LAZ_DIRECTORY//\//-}"

DESCRIPTION="Free Pascal Qt5 bindings library updated by lazarus IDE."
HOMEPAGE="https://svn.freepascal.org/svn/lazarus/trunk/lcl/interfaces/qt5/cbindings"
SRC_URI="
	https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/${LAZ_COMMIT}/lazarus-main.tar.gz?path=${LAZ_DIRECTORY} -> ${P}.tar.gz
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtx11extras:5
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default

	mv "${WORKDIR}/${LAZ_UNPACKED_DIR}/${LAZ_DIRECTORY}" "${WORKDIR}/${P}"
}

src_configure() {
	eqmake5 "QT += x11extras" Qt5Pas.pro
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
