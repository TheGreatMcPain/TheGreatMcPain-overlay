# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1 git-r3

DESCRIPTION="BLS signatures in Python"
HOMEPAGE="https://github.com/Chia-Network/bls-signatures"

EGIT_COMMIT="${PV}"
EGIT_REPO_URI="https://github.com/Chia-Network/bls-signatures.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# for some reason the build system doesn't like the
# shared version of libsodium
DEPEND="
	dev-libs/gmp
	dev-libs/libsodium[static-libs]
	dev-util/cmake
	dev-python/wheel[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
RESTRICT="network-sandbox" # TODO: prevent needing to download relic sources.

# S="${WORKDIR}/bls-signatures-${PV}"

# TODO: Use cmake.eclass
