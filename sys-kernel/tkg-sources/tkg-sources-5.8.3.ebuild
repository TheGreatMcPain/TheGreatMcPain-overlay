# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
ETYPE="sources"

inherit kernel-2
#detect_version
K_NOSETEXTRAVERSION="don't_set_it"

DESCRIPTION="Kernel Sources based on linux-tkg v5.x"
HOMEPAGE="https://github.com/Frogging-Family/linux-tkg"
SRC_URI="${KERNEL_URI}";

KEYWORDS="-* ~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

PATCHES="
	"${FILESDIR}"/4567_distro-Gentoo-Kconfig.patch
	"${FILESDIR}"/tkg-sources-5.8.3.patch.xz"

pkg_setup(){
	ewarn
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the Liquorix developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn
	kernel-2_pkg_setup
}

src_unpack() {
	kernel-2_src_unpack
}

src_install() {
	kernel-2_src_install

	dodoc "${FILESDIR}"/customization.cfg
}

K_EXTRAEINFO="The linux-tkg config file used to generate this patch is located \
	here: '/usr/share/doc/tkg-sources-${PV}/customization.cfg.bz2' \
	you may use this file to generate a .config for your system by cloning \
	${HOMEPAGE}, running 'bzcat /path/to/customization.cfg.bz2 > customization.cfg', \
	and './install.sh config' from the 'linux58-tkg' directory."
