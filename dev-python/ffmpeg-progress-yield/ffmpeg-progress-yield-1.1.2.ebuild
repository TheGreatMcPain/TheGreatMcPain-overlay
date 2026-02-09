# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_13 python3_14 )

DISTUTILS_USE_PEP517="uv-build"

inherit distutils-r1 pypi

DESCRIPTION="Run an ffmpeg command with progress"

HOMEPAGE="https://github.com/slhck/ffmpeg-progress-yield"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/tqdm-4.38.0[${PYTHON_USEDEP}]
"
