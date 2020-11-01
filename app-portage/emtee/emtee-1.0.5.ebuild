# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KEYWORDS="~amd64 ~arm ~arm64 ~ppc"

DESCRIPTION="A faster-startup emerge -DuU --with-bdeps=y --keep-going @world"
BASE_SERVER_URI="https://github.com/sakaki-"
HOMEPAGE="${BASE_SERVER_URI}/${PN}"
SRC_URI="${BASE_SERVER_URI}/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}
	>=app-shells/bash-4.4"

src_install() {
	dobin "${PN}"
	doman "${PN}.1"
}
