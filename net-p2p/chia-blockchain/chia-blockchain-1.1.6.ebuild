# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1 git-r3

DESCRIPTION="Chia blockchain python implementation"
HOMEPAGE="https://github.com/Chia-Network/chia-blockchain"
EGIT_REPO_URI="https://github.com/Chia-Network/chia-blockchain"
EGIT_COMMIT="${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# TODO: make ebuild for clvm_rs and add IUSE
# colorlog and miniupnpc don't have arm64 keywords
DEPEND="
	dev-python/blspy[${PYTHON_USEDEP}]
	dev-python/chiapos[${PYTHON_USEDEP}]
	dev-python/chiavdf[${PYTHON_USEDEP}]
	dev-python/chiabip158[${PYTHON_USEDEP}]
	dev-python/clvm[${PYTHON_USEDEP}]
	dev-python/clvm-tools[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiosqlite[${PYTHON_USEDEP}]
	dev-python/bitstring[${PYTHON_USEDEP}]
	dev-python/colorlog[${PYTHON_USEDEP}]
	dev-python/concurrent-log-handler[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	~dev-python/keyrings-cryptfile-1.3.4[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/setproctitle[${PYTHON_USEDEP}]
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/miniupnpc[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
