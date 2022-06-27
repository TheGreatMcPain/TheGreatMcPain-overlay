# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..11} )
inherit distutils-r1

DESCRIPTION="A complete Discord IPC and Rich Presence wapper library in Python!"
HOMEPAGE="https://github.com/qwertyquerty/pypresence"

SRC_URI="
	https://github.com/qwertyquerty/pypresence/archive/${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""