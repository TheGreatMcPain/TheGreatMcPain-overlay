# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
UNIPATCH_STRICTORDER="yes"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_NOUSEPR="yes"
K_SECURITY_UNSUPPORTED="1"
K_EXP_GENPATCHES_NOUSE="1"
K_NODRYRUN="yes"
K_FROM_GIT="yes"
ETYPE="sources"

inherit kernel-2
detect_version

MY_PV="${PV/_p[1-9]/}-1006.6"

DESCRIPTION="Improved Rockchip Linux"
HOMEPAGE="https://github.com/Joshua-Riek/linux-rockchip"
SRC_URI="https://github.com/Joshua-Riek/linux-rockchip/archive/Ubuntu-rockchip-${MY_PV}.tar.gz"

KEYWORDS="~arm ~arm64"

DEPEND="${RDEPEND}
	>=sys-devel/patch-2.7.6-r5"

KV_FULL="${PVR/_p/_rockchip}"
S="${WORKDIR}/linux-${KV_FULL}"
EGIT_CHECKOUT_DIR="${S}"

src_unpack() {
	unpack  "${A}"
	mv "${WORKDIR}/linux-rockchip-Ubuntu-rockchip-${MY_PV}" "${S}" || die
}

pkg_postinst() {
	postinst_sources
}
