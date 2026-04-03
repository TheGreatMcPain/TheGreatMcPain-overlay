# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="The theme from libadwaita ported to GTK-3"
HOMEPAGE="https://github.com/lassekongo83/adw-gtk3"
EGIT_REPO_URI="https://github.com/lassekongo83/adw-gtk3.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-ruby/sass
"

PATCHES="${FILESDIR}/ruby-sass.patch"
