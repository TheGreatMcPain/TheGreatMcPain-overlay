# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
K_SECURITY_UNSUPPORTED="1"
K_EXP_GENPATCHES_NOUSE="1"
K_FROM_GIT="yes"
K_NODRYRUN="yes"
ETYPE="sources"

inherit kernel-2 git-r3

MY_PVR="${PVR/.9999_p/-rkr}"
EXTRAVERSION="rk-${MY_PVR}"

DESCRIPTION="Improved Rockchip Linux"
HOMEPAGE="https://github.com/armbian/linux-rockchip"
EGIT_REPO_URI="https://github.com/armbian/linux-rockchip.git"
EGIT_BRANCH="rk-${MY_PVR}"

KEYWORDS="~arm ~arm64"

DEPEND="${RDEPEND}
	>=sys-devel/patch-2.7.6-r5"

PATCHES="${FILESDIR}/4567_distro-Gentoo-Kconfig.patch"
#KV_FULL="${MY_PVR}"
S="${WORKDIR}/linux-${KV_FULL}"
EGIT_CHECKOUT_DIR="${S}"

src_unpack() {
	git-r3_src_unpack

	# Based on kernel-2_src_unpack (skips universal_unpack)
	unpack_set_extraversion
	unpack_fix_install_path

	# Setup KERNEL_MAKEOPTS and cd into sourcetree.
	env_setup_kernel_makeopts
	cd "${S}" || die

	# Handle deblob
	if [[ ${K_DEBLOB_AVAILABLE} == 1 ]] && use deblob; then
		cp "${DISTDIR}/${DEBLOB_A}" "${T}" || die "cp ${DEBLOB_A} failed"
		cp "${DISTDIR}/${DEBLOB_CHECK_A}" "${T}/deblob-check" || die "cp ${DEBLOB_CHECK_A} failed"
		chmod +x "${T}/${DEBLOB_A}" "${T}/deblob-check" || die "chmod deblob scripts failed"
	fi
}

src_prepare() {
	default
}

src_install() {
	# We really don't need this to be included.
	rm -r "${S}/.git" || die
	kernel-2_src_install
}
