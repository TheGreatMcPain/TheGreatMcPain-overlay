# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GIT_COMMIT="6.19-11"

CKV="$(ver_cut 1-2)"

KERNEL_IUSE_GENERIC_UKI=1

inherit kernel-build

DESCRIPTION="The Liquorix Kernel Sources v6.x (dist-kernel)"
HOMEPAGE="https://liquorix.net/"
BASE_P=linux-${PV%.*}
GENTOO_CONFIG_VER=g18
LIQUORIX_VERSION="${GIT_COMMIT/_p[0-9]*}"
LIQUORIX_FILE="${P}.tar.gz"
LIQUORIX_URI="https://github.com/damentz/liquorix-package/archive/${LIQUORIX_VERSION}.tar.gz -> ${LIQUORIX_FILE}"
SRC_URI="
	https://cdn.kernel.org/pub/linux/kernel/v$(ver_cut 1).x/${BASE_P}.tar.xz
	https://github.com/projg2/gentoo-kernel-config/archive/${GENTOO_CONFIG_VER}.tar.gz
		-> gentoo-kernel-config-${GENTOO_CONFIG_VER}.tar.gz
	${LIQUORIX_URI}
"

KEYWORDS="-* ~amd64"
IUSE="debug"

KV_FULL="${PVR/_p/-p}-lqx"
S="${WORKDIR}"/"${BASE_P}"

pkg_setup(){
	ewarn
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the Liquorix developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn
}

src_unpack() {
	unpack "${LIQUORIX_FILE}"
	default
}

src_prepare(){
	# Taken from
	# linux-lqx AUR package
	local lqx_patches="${WORKDIR}/liquorix-package-${GIT_COMMIT}/linux-liquorix/debian/patches"
	grep -P '^(zen|lqx)/' "${lqx_patches}/series" | while IFS= read -r line
	do
		einfo "Patching sources with $line"
		eapply "${lqx_patches}/${line}"
	done

	# Adds config options for OpenRC/Systemd
	eapply "${FILESDIR}"/4567_distro-Gentoo-Kconfig-r1.patch

	eapply_user

	sed -i "s|-lqx|-p|" Makefile || die

	cp "${WORKDIR}/liquorix-package-${GIT_COMMIT}/linux-liquorix/debian/config/kernelarch-x86/config-arch-64" \
		".config" || die

	local myversion="-lqx"
	echo "CONFIG_LOCALVERSION=\"${myversion}\"" > "${T}"/version.config || die

	local dist_conf_path="${WORKDIR}/gentoo-kernel-config-${GENTOO_CONFIG_VER}"

	merge_configs=(
		"${T}"/version.config
		"${dist_conf_path}"/base.config
		"${dist_conf_path}"/6.12+.config
	)

	use secureboot && merge_configs+=(
		"${dist_conf_path}"/secureboot.config
		"${dist_conf_path}"/zboot.config
	)

	kernel-build_merge_configs "${merge_configs[@]}"
}
