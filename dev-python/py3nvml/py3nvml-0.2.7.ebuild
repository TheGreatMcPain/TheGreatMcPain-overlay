# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1

DESCRIPTION="Python 3 bindings for the NVIDIA Management Library"
HOMEPAGE="https://github.com/fbcotter/py3nvml"
SRC_URI="https://github.com/fbcotter/py3nvml/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-linux"

distutils_enable_sphinx docs
#distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
}
