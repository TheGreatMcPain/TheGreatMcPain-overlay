# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_13 python3_14 )

DISTUTILS_USE_PEP517="setuptools"
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1 git-r3

DESCRIPTION="My personal mkv converter for my media server."

HOMEPAGE="https://gitlab.com/TheGreatMcPain/McPainMKV"
EGIT_REPO_URI="https://gitlab.com/TheGreatMcPain/McPainMKV.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS=""

# Does need media-libs/vapoursynth from vapoursynth overlay
RDEPEND="
	$(python_gen_cond_dep '
		>=media-sound/ffmpeg-normalize-1.37.3[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.2.2[${PYTHON_USEDEP}]
		>=dev-python/subtitle-filter-1.5.0[${PYTHON_USEDEP}]
	')
"
