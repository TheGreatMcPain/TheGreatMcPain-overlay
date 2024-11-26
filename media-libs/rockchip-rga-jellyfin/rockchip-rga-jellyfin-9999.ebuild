# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="Rockchip Raster Graphic Acceleration Unit library (jellyfin fork)"
HOMEPAGE="https://github.com/nyanmisaka/rk-mirrors/tree/jellyfin-rga"
EGIT_REPO_URI="https://github.com/nyanmisaka/rk-mirrors.git"
EGIT_BRANCH="jellyfin-rga"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="demo"

src_configure() {
	local emesonargs=(
		-Dcpp_args=-fpermissive
		-Dlibdrm=false
		$(meson_use demo librga_demo)
	)
	meson_src_configure
}
