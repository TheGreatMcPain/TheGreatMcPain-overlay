# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="GTK+2.0 integration plugins for Qt6"
HOMEPAGE="https://github.com/trialuser02/qt6gtk2"
SRC_URI="https://github.com/trialuser02/qt6gtk2/releases/download/${PV}/${P/-kde/}.tar.xz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

# uses Qt private APIs wrt :=
DEPEND="dev-qt/qtbase:6=[gui,widgets]"
RDEPEND="
	${DEPEND}
	x11-libs/gtk+:2
"

src_configure() {
	eqmake6
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
