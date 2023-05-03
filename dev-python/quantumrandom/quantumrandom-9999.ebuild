# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )

DISTUTILS_USE_PEP517=setuptools

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
IUSE=""

BDEPEND="
	${PYTHON_DEPS}
	test? ( dev-python/mock )
"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/disable-tests.patch
	# Fixes randint returning floats
	"${FILESDIR}"/python3-fix.patch
	# Make it similar to random.randint
	"${FILESDIR}"/fix-randint.patch
)
