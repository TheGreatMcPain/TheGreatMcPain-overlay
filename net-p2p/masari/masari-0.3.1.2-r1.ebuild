# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 systemd flag-o-matic

DESCRIPTION="Masari: simple, scalable, and private cryptocurrency"
HOMEPAGE="https://www.getmasari.org https://github.com/masari-project/masari"
SRC_URI=""
EGIT_REPO_URI="https://github.com/masari-project/masari.git"
EGIT_SUBMODULES=()
EGIT_COMMIT="v${PV}"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+daemon hw-wallet readline tools +wallet-cli +wallet-rpc"
REQUIRED_USE="|| ( daemon tools wallet-cli wallet-rpc )"

DEPEND="
	acct-group/masari
	acct-user/masari
	dev-libs/boost:=[nls,threads]
	dev-libs/libsodium:=
	net-dns/unbound:=[threads]
	net-libs/czmq:=
	net-libs/cppzmq:=
	hw-wallet? (
		dev-libs/hidapi
		dev-libs/protobuf:=
		virtual/libusb:1
	)
	dev-libs/openssl:=
	readline? ( sys-libs/readline:0= )"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

# They really need to update their stuff.
PATCHES=(
		"${FILESDIR}/${PN}-0.3.1.2-linkjobs.patch"
		"${FILESDIR}/${PN}-0.3.1.2-cmake-fixes.patch"
		"${FILESDIR}/${PN}-0.3.1.2-boost-1.73.patch"
		"${FILESDIR}/${PN}-0.3.1.2-boost-1.74.patch"
		"${FILESDIR}/${PN}-0.3.1.2-boost-timer.patch"
		"${FILESDIR}/${PN}-0.3.1.2-boost-endian.patch"
		"${FILESDIR}/${PN}-0.3.1.2-size_t.patch"
)

src_configure() {
	filter-flags -fipa-pta

	local mycmakeargs=(
		# masari's liblmdb conflicts with the system liblmdb :(
		-DBUILD_SHARED_LIBS=OFF
		-DMANUAL_SUBMODULES=ON
		-DMASARI_PARALLEL_LINK_JOBS=1
	)

	cmake_src_configure
}

src_compile() {
	local targets=()
	use daemon && targets+=(daemon)
	# use tools && targets+=(blockchain_{ancestry,blackball,db,depth,export,import,prune,prune_known_spent_data,stats,usage})
	use tools && targets+=(blockchain_{blackball,db,export,import,usage})
	use wallet-cli && targets+=(simplewallet)
	use wallet-rpc && targets+=(wallet_rpc_server)
	cmake_build ${targets[@]}
}

src_install() {
	# Install all binaries.
	find "${BUILD_DIR}/bin/" -type f -executable -print0 |
		while IFS= read -r -d '' line; do
			dobin "$line"
		done

	if use daemon; then
		dodoc utils/conf/masarid.conf

		# data-dir
		keepdir /var/lib/masari
		fowners masari:masari /var/lib/masari
		fperms 0755 /var/lib/masari

		# log-file dir
		keepdir /var/log/masari
		fowners masari:masari /var/log/masari
		fperms 0755 /var/log/masari

		# /etc/masari/masarid.conf
		insinto /etc/masari
		newins "${FILESDIR}/masarid-0.3.1.2.masarid.conf" masarid.conf

		# OpenRC
		newconfd "${FILESDIR}/masarid-0.3.1.2.confd" masarid
		newinitd "${FILESDIR}/masarid-0.3.1.2.initd" masarid

		# systemd
		systemd_newunit "${FILESDIR}/masarid-0.3.1.2.service" masarid.service
	fi
}

pkg_postinst() {
	if use daemon; then
		einfo "Start the masari P2P daemon as a system service with"
		einfo "'rc-service masarid start'. Enable it at startup with"
		einfo "'rc-update add masarid default'."
		einfo
		einfo "Run masarid status as any user to get sync status and other stats."
		einfo
		einfo "The masari blockchain can take up a lot of space (80 GiB) and is stored"
		einfo "in /var/lib/masari by default. You may want to enable pruning by adding"
		einfo "'prune-blockchain=1' to /etc/masari/masarid.conf to prune the blockchain"
		einfo "or move the data directory to another disk."
	fi
}
