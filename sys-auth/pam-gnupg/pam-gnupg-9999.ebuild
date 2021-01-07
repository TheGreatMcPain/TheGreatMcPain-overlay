# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools pam

DESCRIPTION="Unlock GnuPG keys on login"
HOMEPAGE="https://github.com/cruegge/pam-gnupg"

if [[ "${PV}" = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cruegge/pam-gnupg.git"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/cruegge/pam-gnupg/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	app-crypt/gnupg
	sys-libs/pam
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf --prefix=/usr --with-moduledir=$(getpam_mod_dir)
}

pkg_postinst() {
	einfo
	einfo "To enable pam-gnupg you must put the lines:"
	einfo "'auth    optional pam_gnupg.so' and"
	einfo "'session optional pam_gnupg.so' into one of these files."
	einfo
	einfo "/etc/pam.d/lightdm, /etc/pam.d/lxdm, /etc/pam.d/sddm, etc."
	einfo
	einfo "For tty login use the file: /etc/pam.d/system-local-login"
	einfo
	einfo "See <https://github.com/cruegge/pam-gnupg#usage>"
	einfo "for more detailed usage instructions."
	einfo
}
