# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 xdg-utils

DESCRIPTION="Gruvbox Material theme for GTK"
HOMEPAGE="https://github.com/sainnhe/gruvbox-material-gtk"

EGIT_REPO_URI="https://github.com/sainnhe/gruvbox-material-gtk.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+gtk2 +icons"

DEPEND="
	x11-libs/gtk+:3
	gtk2? ( x11-themes/gtk-engines-murrine )
	icons? ( dev-util/gtk-update-icon-cache )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	true
}

src_install() {
	insinto /usr/share/themes
	doins -r themes/Gruvbox-Material-Dark

	if use icons; then
		insinto /usr/share/icons
		doins -r icons/Gruvbox-Material-Dark
	fi
}

pkg_postinst() {
	if use icons; then
		xdg_icon_cache_update
	fi
}

pkg_postrm() {
	if use icons; then
		xdg_icon_cache_update
	fi
}
