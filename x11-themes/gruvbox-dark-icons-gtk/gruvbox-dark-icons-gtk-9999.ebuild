# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 xdg-utils

DESCRIPTION="Icons for x11-themes/gruvbox-dark-gtk"
HOMEPAGE="https://github.com/jmattheis/gruvbox-dark-gtk"

EGIT_REPO_URI="https://github.com/jmattheis/gruvbox-dark-icons-gtk"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND="
	dev-util/gtk-update-icon-cache
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	true
}

src_install() {
	dodir /usr/share/icons/gruvbox-dark
	insinto /usr/share/icons/gruvbox-dark
	doins -r ./
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
