# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs autotools

MY_PV=$(ver_cut 1-2).c.$(ver_cut 3)

DESCRIPTION="Simple screen locker"
HOMEPAGE="https://i3wm.org/i3lock/"
SRC_URI="https://github.com/Raymo111/i3lock-color/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

RDEPEND="
	>=x11-libs/libxkbcommon-0.5.0[X]
	media-libs/libjpeg-turbo
	dev-libs/libev
	sys-libs/pam
	x11-libs/cairo[X,xcb(+)]
	x11-libs/libxcb[xkb]
	x11-libs/xcb-util
	x11-libs/xcb-util-image
	x11-libs/xcb-util-xrm
	!x11-misc/i3lock
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"
DOCS=( CHANGELOG README.md )

S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	default
	eautoreconf
	sed -i -e 's:login:system-auth:g' pam/i3lock || die
}

src_configure() {
	tc-export CC
	default
}

src_install() {
	default
	doman i3lock.1
}
