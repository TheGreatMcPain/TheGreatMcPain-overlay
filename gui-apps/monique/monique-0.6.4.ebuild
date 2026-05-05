# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

DISTUTILS_USE_PEP517="setuptools"

inherit distutils-r1

DESCRIPTION="Graphical monitor configurator for Hyprland and Sway"
HOMEPAGE="https://github.com/ToRvaLDz/monique"
SRC_URI="https://github.com/ToRvaLDz/monique/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/pyudev[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
