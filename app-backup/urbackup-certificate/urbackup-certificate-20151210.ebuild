# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Urbackup client/server ECDSA signing key"
HOMEPAGE="https://github.com/uroni/urbackup_backend"
SRC_URI=""

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	mkdir "${S}"
}

src_install() {
	insinto /usr/share/urbackup
	doins "${FILESDIR}/urbackup_ecdsa409k1.pub"
}
