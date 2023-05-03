# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=setuptools

PYTHON_COMPAT=( python3_{6..11} )

inherit distutils-r1

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jotyGill/openpyn-nordvpn.git"
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
	EGIT_COMMIT="${PV}"
	SRC_URI="https://github.com/jotyGill/openpyn-nordvpn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Easily connect to and switch between, OpenVPN servers hosted by NordVPN on Linux"
HOMEPAGE="https://github.com/jotyGill/openpyn-nordvpn"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
RESTRICT="test"

RDEPEND="
	net-vpn/openvpn
	app-arch/unzip
	net-misc/wget
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	>=dev-python/verboselogs-1.7[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}"/skip-tests.patch
)

src_prepare() {
	default
}
