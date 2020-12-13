# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Gruvbox Dark theme for GTK made in oomox"
HOMEPAGE="https://github.com/jmattheis/gruvbox-dark-gtk"

EGIT_REPO_URI="https://github.com/jmattheis/gruvbox-dark-gtk"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+gtk2 +icons"

DEPEND="
	x11-libs/gtk+:3
	gtk2? ( x11-themes/gtk-engines-murrine )
	icons? ( x11-themes/gruvbox-dark-icons-gtk )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	true
}

src_install() {
	dodir /usr/share/themes/gruvbox-dark
	insinto /usr/share/themes/gruvbox-dark
	doins -r ./
}
