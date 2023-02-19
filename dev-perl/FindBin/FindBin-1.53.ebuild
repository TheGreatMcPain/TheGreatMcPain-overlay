# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="TODDR"
inherit perl-module

DESCRIPTION="FindBin - Locate directory of original perl script"

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	virtual/perl-Carp
	dev-perl/PathTools
	virtual/perl-Exporter
	virtual/perl-File-Spec
"
DEPEND="${RDEPEND}"
