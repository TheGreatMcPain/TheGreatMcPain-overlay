# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Program to help executing outside programs in proton."
HOMEPAGE="https://gitlab.com/xaryphon/protonhax"
EGIT_REPO_URI="https://gitlab.com/xaryphon/protonhax.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

src_prepare() {
	default

	# replace '/bin/sh' with '/bin/bash',
	# because the script actually uses extra bash stuff
	# that is not POSIX complient.
	sed -e "s#/bin/sh#/bin/bash#" -i protonhax || die

	# Replace 'tcc' with gcc, so we don't have to install
	# any other dependencies.
	sed -e "s#tcc#gcc#" -i Makefile || die
}

src_install() {
	dobin envload
	dobin protonhax

	dodoc README.md
}
