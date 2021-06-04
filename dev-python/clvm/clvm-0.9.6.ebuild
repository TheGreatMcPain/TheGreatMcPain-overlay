# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1 git-r3

DESCRIPTION="[Contract Language|Chia Lisp] Virtual Machine"
HOMEPAGE="https://github.com/Chia-Network/clvm"
EGIT_REPO_URI="https://github.com/Chia-Network/clvm.git"
EGIT_COMMIT="${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	dev-python/blspy[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
