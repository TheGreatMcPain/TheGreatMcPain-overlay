# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )

inherit distutils-r1

DESCRIPTION="Cross-platform CLI and Python drivers for AIO liquid coolers and other devices"
HOMEPAGE="https://gitlab.com/leinardi/gwe"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/jonasmalacofilho/liquidctl.git"
	EGIT_SUBMODULES=('-*')
	EGIT_BRANCH="master"
	inherit git-r3
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/jonasmalacofilho/liquidctl/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}

	dev-python/pyusb[${PYTHON_USEDEP}]
	dev-python/hidapi[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	sys-apps/i2c-tools[python,${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"
