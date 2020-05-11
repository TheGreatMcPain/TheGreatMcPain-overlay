# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson multilib-minimal

DESCRIPTION="A custom shader language called ReShade FX"
HOMEPAGE="https://github.com/crosire/reshade"
SRC_URI="https://github.com/crosire/reshade/archive/v${PV}.tar.gz -> reshade-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"

DEPEND=">=dev-util/spirv-headers-1.5.1"
RDEPEND=""
BDEPEND="${DEPEND}"

S="${WORKDIR}/reshade-${PV}"

multilib_src_configure() {
	cp "${FILESDIR}/meson.build" "${S}"/

	meson_src_configure
}

multilib_src_compile() {
	meson_src_compile
}

multilib_src_install() {
	meson_src_install
}
