# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lmacken/quantumrandom.git"
	KEYWORDS=""
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="${PV}"
	SRC_URI="https://github.com/lmacken/quantumrandom/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A Python interface to the ANU Quantum Random Numbers Server"
HOMEPAGE="https://github.com/lmacken/quantumrandom"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
  dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
"
DEPEND="
  ${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}"/disable-tests.patch
	# Fixes randint returning floats
	"${FILESDIR}"/python3-fix.patch
	# Make it similar to random.randint
	"${FILESDIR}"/fix-randint.patch
)
