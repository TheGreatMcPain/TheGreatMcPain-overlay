# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="vsTerminus"
inherit perl-module

DESCRIPTION="Perl Modules that implement parts of the Discord API."

SRC_URI="https://github.com/vsTerminus/Mojo-Discord/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-perl/strictures
	dev-perl/namespace-clean
	dev-perl/Mojolicious
	dev-perl/JSON-MaybeXS
	virtual/perl-IO-Compress
	virtual/perl-Encode
	dev-perl/Moo
	virtual/perl-Data-Dumper
	dev-perl/IO-Socket-SSL
	dev-perl/Role-EventEmitter
	dev-perl/Time-Duration
	dev-perl/URI
"
DEPEND="${RDEPEND}"

src_install() {
	perl-module_src_install

	pushd lib/Mojo
	perl_domodule -C Mojo -r .
	popd
}
