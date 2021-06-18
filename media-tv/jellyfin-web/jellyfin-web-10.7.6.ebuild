# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Web interface for Jellyfin"
HOMEPAGE="https://github.com/jellyfin/jellyfin-web"

SRC_URI="https://github.com/jellyfin/jellyfin-web/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

# Since we are using yarn we need networking.
RESTRICT="network-sandbox"

DEPEND="
	sys-apps/yarn
"
RDEPEND="${DEPEND}"

src_compile() {
	yarn install
}

src_install() {
	insinto "usr/share/jellyfin/web"
	doins -r "dist"/*
}
