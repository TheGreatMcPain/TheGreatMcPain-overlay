# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
UNIPATCH_STRICTORDER="yes"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_NOUSEPR="yes"
K_SECURITY_UNSUPPORTED="1"
K_EXP_GENPATCHES_NOUSE="1"
K_FROM_GIT="yes"
K_NODRYRUN="yes"
ETYPE="sources"

inherit kernel-2 git-r3
detect_version

DESCRIPTION="Improved Rockchip Linux"
HOMEPAGE="https://github.com/armbian/linux-rockchip"
EGIT_REPO_URI="https://github.com/armbian/linux-rockchip.git"
EGIT_BRANCH="rk-${PVR/_p/-rkr}"

KEYWORDS="~arm ~arm64"

DEPEND="${RDEPEND}
	>=sys-devel/patch-2.7.6-r5"

KV_FULL="${PVR/_p/_rkr}"
S="${WORKDIR}/linux-${KV_FULL}"
EGIT_CHECKOUT_DIR="${S}"

pkg_postinst() {
	postinst_sources
}
