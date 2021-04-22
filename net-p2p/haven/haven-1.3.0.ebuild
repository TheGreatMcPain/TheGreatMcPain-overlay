# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 systemd

DESCRIPTION="The secure, private, untraceable cryptocurrency"
HOMEPAGE="https://havenprotocol.org
		https://github.com/haven-protocol-org/haven-offshore"

SRC_URI=""
EGIT_REPO_URI="https://github.com/haven-protocol-org/haven-offshore.git"
EGIT_COMMIT="v${PV}c"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+daemon hw-wallet libressl readline tools +wallet-cli +wallet-rpc"
REQUIRED_USE="|| ( daemon tools wallet-cli wallet-rpc )"

DEPEND="
	acct-group/haven
	acct-user/haven
	dev-libs/boost:=[nls,threads]
	dev-libs/libsodium:=
	net-dns/unbound:=[threads]
	net-libs/czmq:=
	hw-wallet? (
		dev-libs/hidapi
		dev-libs/protobuf:=
		virtual/libusb:1
	)
	!libressl? ( dev-libs/openssl:= )
	libressl? ( dev-libs/libressl:= )
	readline? ( sys-libs/readline:0= )"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_unpack() {
	git-r3_src_unpack

	# Grab the monero sources
	git-r3_fetch "https://github.com/monero-project/monero.git" \
		"refs/heads/release-v0.16"
	git-r3_checkout "https://github.com/monero-project/monero.git" \
		"${P}/monero"
}

src_prepare() {
	# cmake_src_prepare will try to apply patches in PATCHES
	eapply "${FILESDIR}/${PN}-1.3.0-linkjobs.patch"
	eapply "${FILESDIR}/strip-haven-build.patch"
	eapply_user

	# Run the stripped down build script to patch the monero sources.
	./build-haven.sh || die "Monero patches failed"

	# Set $S
	S="${S}/monero"

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		# Haven's liblmdb conflicts with the system liblmdb :(
		-DBUILD_SHARED_LIBS=OFF
		-DMANUAL_SUBMODULES=ON
		-DMONERO_PARALLEL_LINK_JOBS=1
	)

	cmake_src_configure
}

src_compile() {
	local targets=()
	use daemon && targets+=(daemon)
	use tools && targets+=(blockchain_{ancestry,blackball,db,depth,export,import,prune,prune_known_spent_data,stats,usage})
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
		dodoc "${FILESDIR}/havend-1.3.0.havend.conf"

		# data-dir
		keepdir /var/lib/haven
		fowners haven:haven /var/lib/haven
		fperms 0755 /var/lib/haven

		# log-file dir
		keepdir /var/log/haven
		fowners haven:haven /var/log/haven
		fperms 0755 /var/log/haven

		# /etc/haven/havend.conf
		insinto /etc/haven
		newins "${FILESDIR}/havend-1.3.0.havend.conf" havend.conf

		# OpenRC
		newconfd "${FILESDIR}/havend-1.3.0.confd" havend
		newinitd "${FILESDIR}/havend-1.3.0.initd" havend

		# systemd
		systemd_newunit "${FILESDIR}/havend-1.3.0.service" havend.service
	fi
}

pkg_postinst() {
	if use daemon; then
		einfo "Start the Haven P2P daemon as a system service with"
		einfo "'rc-service havend start'. Enable it at startup with"
		einfo "'rc-update add havend default'."
		einfo
		einfo "Run havend status as any user to get sync status and other stats."
		einfo
		einfo "The Haven blockchain can take up a lot of space (80 GiB) and is stored"
		einfo "in /var/lib/haven by default. You may want to enable pruning by adding"
		einfo "'prune-blockchain=1' to /etc/haven/havend.conf to prune the blockchain"
		einfo "or move the data directory to another disk."
	fi
}
