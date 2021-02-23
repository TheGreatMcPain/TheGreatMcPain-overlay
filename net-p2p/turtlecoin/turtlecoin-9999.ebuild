# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake flag-o-matic

DESCRIPTION="Decentralized Peer-2-Peer open source electronic currency."
HOMEPAGE="https://turtlecoin.lol/"

if ver_test -eq "9999"; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/turtlecoin/turtlecoin.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/turtlecoin/turtlecoin/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

# TODO Probably needs more deps
DEPEND="
	acct-group/turtlecoin
	acct-user/turtlecoin
	dev-libs/boost[threads,nls]
"
RDEPEND="${DEPEND}"
BDEPEND=""

# Errors with ninja
export CMAKE_MAKEFILE_GENERATOR=emake

src_prepare() {
	default

	# For some reason they insist on building static binaries,
	# but we can still build with shared boost by removing these lines.
	sed -i "s|set(Boost_USE_STATIC_LIBS ON)||" CMakeLists.txt || die
	sed -i "s|set(Boost_USE_STATIC_RUNTIME ON)||" CMakeLists.txt || die

	cmake_src_prepare
}

src_configure() {
	append-cppflags -DNDEBUG

	cmake_src_configure
}

src_install() {
	# There's no install target, so we have to do it manually.
	newbin "${BUILD_DIR}/src/miner" trtl-miner
	dobin "${BUILD_DIR}/src/TurtleCoind"
	newbin "${BUILD_DIR}/src/zedwallet" trtl-zedwallet
	newbin "${BUILD_DIR}/src/wallet-api" trtl-wallet-api

	# Setup folders
	keepdir /var/lib/turtlecoin
	fowners turtlecoin:turtlecoin /var/lib/turtlecoin
	fperms 0755 /var/lib/turtlecoin

	keepdir /var/log/turtlecoin
	fowners turtlecoin:turtlecoin /var/log/turtlecoin
	fperms 0755 /var/log/turtlecoin

	# Install config
	insinto /etc/turtlecoin
	newins "${FILESDIR}/turtlecoind.json" turtlecoind.json

	# Setup openrc daemon
	newconfd "${FILESDIR}/turtlecoind.confd" turtlecoind
	newinitd "${FILESDIR}/turtlecoind.initd" turtlecoind
}

pkg_postinst() {
	einfo
	einfo "The following binaries have been renamed to avoid conflicts with"
	einfo "other crypto programs."
	einfo
	einfo "miner       -> trtl-miner"
	einfo "TurtleCoind -> (unchanged)"
	einfo "zedwallet   -> trtl-zedwallet"
	einfo "wallet-api  -> trtl-wallet-api"
	einfo
	einfo "This ebuild provides an openrc service along with"
	einfo "a basic config file located in '/etc/turtlecoin/turtlecoind.json'"
	einfo
	einfo "You can run 'TurtleCoind --dump-config' to view the default"
	einfo "config options."
	einfo
}
