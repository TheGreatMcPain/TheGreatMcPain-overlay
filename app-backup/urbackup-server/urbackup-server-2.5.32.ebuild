# copyright © 2016 slated.org
# Distributed under the terms of the AGPLv3+
# $Header: $

EAPI=7
inherit systemd

DESCRIPTION="Fast and easily configured backup server"
HOMEPAGE="https://www.urbackup.org"
SRC_URI="https://hndl.urbackup.org/Server/${PV}/${P}.tar.gz"
S=${WORKDIR}/${P}

SLOT="0"
LICENSE="AGPL-3"
KEYWORDS="~amd64 ~x86"
IUSE="crypt hardened fuse mail zlib"

RDEPEND="
	acct-user/urbackup
	acct-group/urbackup
	app-backup/urbackup-certificate
	crypt? ( >=dev-libs/crypto++-5.1 )
	dev-db/sqlite
	app-arch/zstd
	fuse? ( sys-fs/fuse:* )
	mail? ( >=net-misc/curl-7.2 )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}"

#PATCHES=(
#	"${FILESDIR}/${P}-autoupdate-config.patch"
#	"${FILESDIR}/${P}-autoupdate-datafiles.patch"
#	"${FILESDIR}/${P}-gcc-fortify.patch"
#	"${FILESDIR}/${P}-gentoo-prefix.patch"
#	"${FILESDIR}/${P}-manpage.patch"
#)

src_configure() {
	econf \
	$(use_with crypt crypto) \
	$(use_enable hardened fortify) \
	$(use_with fuse mountvhd) \
	$(use_with mail) \
	$(use_with zlib) \
	--enable-packaging
}

src_install() {
	dodir /usr/share/man/man1
	emake DESTDIR="${D}" install
	insinto /etc/logrotate.d
	newins logrotate_urbackupsrv urbackupsrv
	newconfd defaults_server urbackupsrv
	doinitd "${FILESDIR}"/urbackupsrv
	systemd_dounit "${FILESDIR}"/urbackup-server.service
	fowners -R urbackup:urbackup "/var/lib/urbackup"
	fowners -R urbackup:urbackup "/usr/share/urbackup/www"

	# Installed by urbackup-certificate
	rm "${ED}/usr/share/urbackup/urbackup_ecdsa409k1.pub"
}
