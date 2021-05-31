# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1 git-r3

DESCRIPTION="Chia Proof of Space library"
HOMEPAGE="https://github.com/Chia-Network/chiapos"
EGIT_REPO_URI="https://github.com/Chia-Network/chiapos.git"
EGIT_COMMIT="${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="network-sandbox" # TODO: prevent downloading

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
