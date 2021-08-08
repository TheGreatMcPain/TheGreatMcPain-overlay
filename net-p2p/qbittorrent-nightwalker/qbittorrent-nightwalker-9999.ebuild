# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Dark theme for qbittorrent webui"
HOMEPAGE="https://github.com/repslet/nightwalker"
EGIT_REPO_URI="https://github.com/repslet/nightwalker.git"

# The repository doesn't have a LICENSE.
# I'm just gonna put MIT here for now.
LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodir "/usr/share/nightwalker-qbt-theme"

	insinto "/usr/share/nightwalker-qbt-theme"
	doins -r "${S}"/*
}

pkg_postinst() {
	einfo
	einfo "Theme as been installed in: /usr/share/nightwalker-qbt-theme"
	einfo
}
