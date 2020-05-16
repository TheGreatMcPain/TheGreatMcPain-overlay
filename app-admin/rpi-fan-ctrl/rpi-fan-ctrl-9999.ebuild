# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Simple fan controller for Raspberry PI using the pigpio library"
HOMEPAGE="https://gitlab.com/TheGreatMcPain/rpi-fan-ctrl"

if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/TheGreatMcPain/rpi-fan-ctrl.git"
	SRC_URI=""
	KEYWORDS=""
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/pigpio
"
RDEPEND="${DEPEND}"

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}
