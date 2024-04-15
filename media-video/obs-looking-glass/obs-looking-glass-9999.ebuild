# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_PV="${PV/1_beta/B}"

DESCRIPTION="Plugin for OBS Studio to stream directly from Looking Glass"
HOMEPAGE="https://looking-glass.io https://github.com/gnif/LookingGlass"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gnif/LookingGlass.git"
else
	# We can reuse sources file from app-emulation/looking-glass
	SRC_URI="https://looking-glass.io/artifact/${MY_PV}/source -> ${PN/obs-/}-${PV}.tar.gz"
	S="${WORKDIR}/${PN/obs-/}-${MY_PV}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	media-video/obs-studio
"
DEPEND="${RDEPEND}"

CMAKE_USE_DIR="${S}"/obs

src_install() {
	exeinto "/usr/$(get_libdir)/obs-plugins"
	doexe "${BUILD_DIR}"/liblooking-glass-obs.so
}
