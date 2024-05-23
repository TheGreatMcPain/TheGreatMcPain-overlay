# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1 pypi

DESCRIPTION="ReactiveX for Python"
HOMEPAGE="http://reactivex.io/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-linux"

distutils_enable_sphinx docs

RDEPEND="
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
