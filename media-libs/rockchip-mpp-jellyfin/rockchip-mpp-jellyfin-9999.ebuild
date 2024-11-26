# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="Rockchip Media Process Platform (MPP) module (jellyfin fork)"
HOMEPAGE="https://github.com/nyanmisaka/mpp"
EGIT_REPO_URI="https://github.com/nyanmisaka/mpp.git"
EGIT_BRANCH="jellyfin-mpp"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS=""

DEPEND="
	x11-libs/libdrm
"
RDEPEND="${DEPEND}"
