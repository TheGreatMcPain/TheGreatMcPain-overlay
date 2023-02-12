# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="DBOOK"
inherit perl-module

DESCRIPTION="Role::EventEmitter - Event emitter role"

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	virtual/perl-Carp
	dev-perl/Role-Tiny
	virtual/perl-Scalar-List-Utils
"
DEPEND="${RDEPEND}"
