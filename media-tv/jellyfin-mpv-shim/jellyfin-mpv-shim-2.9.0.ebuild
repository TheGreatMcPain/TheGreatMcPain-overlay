# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Cast media from Jellyfin to MPV"
HOMEPAGE="https://github.com/jellyfin/jellyfin-mpv-shim"

SHADERS_PV="2.1.0"

SRC_URI="
	https://github.com/jellyfin/jellyfin-mpv-shim/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/iwalton3/default-shader-pack/archive/v${SHADERS_PV}.tar.gz -> ${P}-shaders.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systray display-mirroring discord"

DEPEND="
	media-video/mpv[libmpv]
	dev-python/python-mpv[${PYTHON_USEDEP}]
	dev-python/python-mpv-jsonipc[${PYTHON_USEDEP}]
	dev-python/jellyfin-apiclient-python[${PYTHON_USEDEP}]
	dev-lang/python:*[tk]
	systray? ( dev-python/pystray[${PYTHON_USEDEP}] )
	display-mirroring? (
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/pywebview[${PYTHON_USEDEP}]
	)
	discord? ( dev-python/pypresence[${PYTHON_USEDEP}] )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default

	mv "${WORKDIR}/default-shader-pack-${SHADERS_PV}" \
		"${S}/jellyfin_mpv_shim/default_shader_pack"
}
