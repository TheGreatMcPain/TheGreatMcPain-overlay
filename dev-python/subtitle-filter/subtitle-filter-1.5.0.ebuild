# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13} )

inherit distutils-r1 pypi

DESCRIPTION="Filter Subtitles to remove SDH entries"
HOMEPAGE="
	https://pypi.org/project/subtitle-filter/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
