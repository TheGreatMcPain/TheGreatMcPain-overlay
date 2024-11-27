# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="Rockchip Userspace Mali GPU Driver (jellyfin fork)"
HOMEPAGE="https://github.com/tsukumijima/libmali-rockchip"
EGIT_REPO_URI="https://github.com/tsukumijima/libmali-rockchip"

LICENSE="ARM-MALI-EULA"
SLOT="0"
KEYWORDS=""

DEPEND="
	x11-libs/libdrm
"
RDEPEND="${DEPEND}"

# TODO Allow useflags for different gpus and platforms
# for now I'm sticking with the default.

pkg_pretend() {
	if [ ${EGIT_CLONE_TYPE} != "shallow" ]; then
		ewarn
		ewarn "This git repo is rather large."
		ewarn "consider setting 'EGIT_CLONE_TYPE' to 'shallow' in your package.env"
		ewarn
	fi
}
