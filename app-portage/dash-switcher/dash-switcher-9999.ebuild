# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Automatically switch /bin/sh for certain ebuilds that don't like 'dash'."
HOMEPAGE="https://gitlab.com/TheGreatMcPain/dash-switcher"
EGIT_REPO_URI="https://gitlab.com/TheGreatMcPain/dash-switcher.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	exeinto "/usr/libexec"
	doexe dash-switcher

	insinto "/etc/portage"
	doins package.dash
}

pkg_postinst() {
	einfo
	einfo "Some known ebuilds that don't like dash"
	einfo "have been added to '/etc/portage/package.dash'"
	einfo
	einfo "In order for dash-switcher to take effect"
	einfo "please add this to your '/etc/portage/bashrc'"
	einfo
	einfo "'source /usr/libexec/dash-switcher'"
	einfo
}
