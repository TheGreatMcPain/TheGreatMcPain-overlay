# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd git-r3

DESCRIPTION="i3lock wrapper with multi-monitor support"
HOMEPAGE="https://github.com/jeffmhubbard/multilockscreen"
EGIT_REPO_URI="https://github.com/jeffmhubbard/multilockscreen"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=x11-misc/i3lock-color-2.11
	media-gfx/imagemagick
	x11-apps/xdpyinfo
	x11-apps/xrandr
	sys-devel/bc
	media-gfx/feh
"

DEPEND="${RDEPEND}"

src_install() {
	dobin ${PN}
	dodoc README.md
	dodoc -r examples

	systemd_dounit system/${PN}@.service
}
