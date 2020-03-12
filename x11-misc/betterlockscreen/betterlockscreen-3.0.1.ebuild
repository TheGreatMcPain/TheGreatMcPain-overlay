# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="sweet looking lockscreen for linux system"
HOMEPAGE="https://github.com/pavanjadhaw/betterlockscreen"
SRC_URI="https://github.com/pavanjadhaw/betterlockscreen/archive/${PV}.tar.gz"

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

	systemd_dounit ${PN}@.service
}
