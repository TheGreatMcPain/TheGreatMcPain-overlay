# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The theme from libadwaita ported to GTK-3"
HOMEPAGE="https://github.com/lassekongo83/adw-gtk3"
SRC_URI="https://github.com/lassekongo83/adw-gtk3/releases/download/v${PV}/adw-gtk3v${PV}.tar.xz -> ${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""

S="${WORKDIR}"

src_install() {
	insinto "/usr/share/themes"
	doins -r ./*
}
