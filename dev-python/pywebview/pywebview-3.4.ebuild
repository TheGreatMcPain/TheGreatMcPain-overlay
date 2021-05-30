# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

DESCRIPTION="Build GUI for Python with JS, HTML, and CSS"
HOMEPAGE="https://github.com/r0x0r/pywebview"
SRC_URI="
	https://github.com/r0x0r/pywebview/archive/${PV}.tar.gz -> ${P}.tar.gz
"

IUSE="qt5 gtk"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	gtk? (
		dev-python/pygobject[${PYTHON_USEDEP}]
		dev-python/pycairo[${PYTHON_USEDEP}]
		net-libs/webkit-gtk
	)
	qt5? ( dev-python/PyQtWebEngine[${PYTHON_USEDEP}] )
"
RDEPEND="${DEPEND}"
BDEPEND=""
