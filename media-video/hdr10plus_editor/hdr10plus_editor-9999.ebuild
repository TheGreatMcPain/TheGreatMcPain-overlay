# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..10} )

inherit git-r3 distutils-r1

DESCRIPTION="A simple editor for editing scenes in a HDR10+ JSON"
HOMEPAGE="https://github.com/MiM-MiM/HDR10Plus_Editor"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/MiM-MiM/HDR10Plus_Editor.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/pyjson[${PYTHON_USEDEP}]
	dev-python/pyio[${PYTHON_USEDEP}]
"
