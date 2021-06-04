# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="Chia VDF utilities"
HOMEPAGE="https://github.com/Chia-Network/chiavdf"
SRC_URI="
	https://github.com/Chia-Network/chiavdf/archive/${PV}.tar.gz -> ${P}.tar.gz
"
export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
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
