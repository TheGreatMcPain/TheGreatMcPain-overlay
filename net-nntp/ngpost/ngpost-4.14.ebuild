# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils desktop

DESCRIPTION="Usenet poster developed in C++/QT"
HOMEPAGE="https://github.com/mbruel/ngPost"

if ver_test -eq "9999"; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mbruel/ngPost.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/mbruel/ngPost/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="rar par2 +7z"

# TODO: Complete dependencies
DEPEND="
	dev-qt/qtchooser
	dev-qt/qtcore
	dev-libs/openssl
	rar? ( app-arch/rar )
	par2? ( app-arch/par2cmdline )
	7z? ( app-arch/p7zip )"
RDEPEND="${DEPEND}"
BDEPEND=""

if ! ver_test -eq "9999"; then
	S="${WORKDIR}/ngPost-${PV}"
fi

S_ROOT="${S}"
S="${S}/src"

src_configure() {
	eqmake5
}

src_install() {
	dobin ngPost

	# Install README and config file for reference
	dodoc "${S_ROOT}/README.md"
	dodoc "${S_ROOT}/ngPost.conf"

	# Install desktop launcher
	domenu "${S_ROOT}/ngPost.desktop"
}

pkg_postinst() {
	elog
	elog "By default this ebuild installs 7z for file compression. ('7z' useflag)"
	elog
	elog "You may enable the 'rar' useflag to install app-arch/rar"
	elog "for rar compression."
	elog
	elog "You may also enable the 'par2' useflag to install app-arch/par2cmdline"
	elog "for par2 support. (Helps with data integrity)"
	elog
}
