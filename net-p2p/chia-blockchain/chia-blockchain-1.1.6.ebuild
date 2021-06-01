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

PATCHES=(
	"${FILESDIR}/fix-dependencies.patch"
)

# colorlog and miniupnpc don't have arm64 keywords
DEPEND="
	~dev-python/blspy-1.0.2[${PYTHON_USEDEP}]
	~dev-python/chiapos-1.0.2[${PYTHON_USEDEP}]
	~dev-python/chiavdf-1.0.1[${PYTHON_USEDEP}]
	~dev-python/chiabip158-1.0[${PYTHON_USEDEP}]
	~dev-python/clvm-0.9.6[${PYTHON_USEDEP}]
	~dev-python/clvm-rs-0.1.7[${PYTHON_USEDEP}]
	~dev-python/clvm-tools-0.4.3[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	~dev-python/aiosqlite-0.17.0[${PYTHON_USEDEP}]
	~dev-python/bitstring-3.1.7[${PYTHON_USEDEP}]
	~dev-python/colorlog-5.0.1[${PYTHON_USEDEP}]
	~dev-python/concurrent-log-handler-0.9.19[${PYTHON_USEDEP}]
	~dev-python/cryptography-3.4.7[${PYTHON_USEDEP}]
	~dev-python/keyring-23.0.1[${PYTHON_USEDEP}]
	~dev-python/keyrings-cryptfile-1.3.4[${PYTHON_USEDEP}]
	~dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
	~dev-python/setproctitle-1.2.2[${PYTHON_USEDEP}]
	~dev-python/sortedcontainers-2.3.0[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
	~dev-python/click-7.1.2[${PYTHON_USEDEP}]
	~dev-python/dnspython-2.1.0[${PYTHON_USEDEP}]
	dev-python/miniupnpc[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
