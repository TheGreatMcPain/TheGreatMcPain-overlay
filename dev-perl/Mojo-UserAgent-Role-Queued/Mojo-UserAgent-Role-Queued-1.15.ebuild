# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="DOTAN"
inherit perl-module

DESCRIPTION="Non-blocking recent tracks information from Last.FM"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-perl/Class-Method-Modifiers
	dev-perl/Role-Tiny
	dev-perl/Mojolicious
"
BDEPEND="
	dev-perl/Module-Build-Tiny
"
