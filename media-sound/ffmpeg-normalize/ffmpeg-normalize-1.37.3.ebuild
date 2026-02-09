# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_13 python3_14 )

DISTUTILS_USE_PEP517="uv-build"

inherit distutils-r1 pypi

DESCRIPTION="Normalize audio via ffmpeg"

HOMEPAGE="https://github.com/slhck/ffmpeg-normalize"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	media-video/ffmpeg
	>=dev-python/tqdm-4.64.1[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/ffmpeg-progress-yield-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/colorlog-6.7.0[${PYTHON_USEDEP}]
	>=media-libs/mutagen-1.47.0[${PYTHON_USEDEP}]
"
