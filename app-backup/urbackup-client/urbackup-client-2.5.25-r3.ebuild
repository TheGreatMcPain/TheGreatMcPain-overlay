# copyright © 2016 slated.org
# Distributed under the terms of the AGPLv3+
# $Header: $

EAPI=8
PLOCALES="cs da de es fa fr it nl pl pt_BR ru sk uk zh_CN zh_TW"
PLOCALE_BACKUP="en"
WX_GTK_VER=3.2-gtk3

inherit wxwidgets systemd

DESCRIPTION="Client for UrBackup server"
HOMEPAGE="https://www.urbackup.org"
SRC_URI="https://www.urbackup.org/downloads/Client/${PV}/${P}.tar.gz"
S=${WORKDIR}/${P}.0

SLOT="0"
LICENSE="AGPL-3"
KEYWORDS="~amd64 ~x86"
IUSE="hardened X zlib"

RDEPEND="
	acct-user/urbackup
	acct-group/urbackup
	app-backup/urbackup-certificate
	dev-db/sqlite
	dev-libs/crypto++
	X? ( x11-libs/wxGTK:* )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/0001-Fix-compile-with-GCC13.patch"
)

src_configure() {
	econf \
	$(use_enable hardened fortify) \
	$(use_enable !X headless) \
	$(use_with zlib) \
	--disable-clientupdate
}

src_install() {
	dodir /usr/share/man/man1
	emake DESTDIR="${D}" install
	insinto /etc/logrotate.d
	newins "${FILESDIR}"/logrotate_urbackupclient urbackupclient
	newconfd defaults_client urbackupclient
	doinitd "${FILESDIR}"/urbackupclient
	systemd_dounit "${FILESDIR}"/urbackup-client.service
	insinto /etc/urbackup
	dodir /etc/urbackup
	doins "${FILESDIR}"/snapshot.cfg
	insinto /usr/share/urbackup/scripts
	insopts -m0700
	doins "${FILESDIR}"/linux_snapshot/*

	# Already installed by urbackup-certificate
	rm "${ED}/usr/share/urbackup/urbackup_ecdsa409k1.pub"

	keepdir /var/lib/urbackup/data
}
