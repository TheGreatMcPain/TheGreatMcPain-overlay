# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="ReactiveX for Python"
HOMEPAGE="http://reactivex.io/"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~x86-linux"
IUSE=""

RDEPEND="
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/poetry-core[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
