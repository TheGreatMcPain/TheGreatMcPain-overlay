# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1 git-r3

DESCRIPTION="Chia VDF utilities"
HOMEPAGE="https://github.com/Chia-Network/chiavdf"
EGIT_REPO_URI="https://github.com/Chia-Network/chiavdf.git"
EGIT_COMMIT="${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="network-sandbox" # TODO: prevent downloading
IUSE="+client bench"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# Force gmp detection
PATCHES=(
	"${FILESDIR}/gmp-workaround.patch"
)

src_prepare() {
	export BUILD_VDF_CLIENT="$(usex client Y N)"
	export BUILD_VDF_BENCH="$(usex bench Y N)"
	distutils-r1_src_prepare
}
