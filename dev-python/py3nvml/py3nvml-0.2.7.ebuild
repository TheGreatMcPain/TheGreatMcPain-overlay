# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..14} )

inherit distutils-r1

DESCRIPTION="Python 3 bindings for the NVIDIA Management Library"
HOMEPAGE="https://github.com/fbcotter/py3nvml"
SRC_URI="https://github.com/fbcotter/py3nvml/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

distutils_enable_sphinx docs

python_install_all() {
	distutils-r1_python_install_all
}
