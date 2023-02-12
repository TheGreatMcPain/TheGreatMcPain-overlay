# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="TESMITH"
inherit perl-module

DESCRIPTION="Non-blocking recent tracks information from Last.FM"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	virtual/perl-Carp
	dev-perl/Mojolicious
	dev-perl/Role-Tiny
	dev-perl/Moo
	dev-perl/namespace-clean
	dev-perl/strictures
	virtual/perl-Scalar-List-Utils
"
DEPEND="${RDEPEND}"
