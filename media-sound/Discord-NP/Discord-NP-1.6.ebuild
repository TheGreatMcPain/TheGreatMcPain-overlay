# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="TESMITH"
inherit perl-module

DESCRIPTION="Last.FM Now Playing info in your Discord status message"
HOMEPAGE="https://github.com/vsTerminus/Discord-NP"
SRC_URI="https://github.com/vsTerminus/Discord-NP/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-perl/Moo
	dev-perl/strictures
	dev-perl/Mojolicious
	dev-perl/Mojo-Discord
	dev-perl/Mojo-UserAgent-Role-Queued
	dev-perl/IO-Socket-SSL
	dev-perl/Config-Tiny
	virtual/perl-Getopt-Long
	virtual/perl-Data-Dumper
	dev-perl/namespace-clean
	dev-perl/FindBin
	virtual/perl-File-Spec
	dev-perl/Mojo-WebService-LastFM
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	perl-module_src_prepare

	# Skip compile (not required)
	rm Makefile
}

src_install() {
	perl-module_src_install

	pushd lib/Discord
	perl_domodule -C Discord -r .
	popd

	dodoc config.ini.example

	dobin discordnp.pl
}

pkg_postinst() {
	einfo
	einfo "Please see: https://github.com/vsTerminus/Discord-NP for configuration."
	einfo
	einfo "You can place the config.ini anywhere and launch 'discordnp.pl --config <config.ini>'"
	einfo
}
