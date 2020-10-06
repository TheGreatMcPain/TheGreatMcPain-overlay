# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs perl-module

DESCRIPTION="git credential helper that reads netrc files."
HOMEPAGE="https://github.com/git/git"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/git/git.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/git/git/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~ppc-aix ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	dev-vcs/git[perl]
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${S}/contrib/credential/netrc"

git_emake() {
	# bug #320647: PYTHON_PATH
	local PYTHON_PATH=""
	emake ${MY_MAKEOPTS} \
		prefix="${EPREFIX}"/usr \
		htmldir="${EPREFIX}"/usr/share/doc/${PF}/html \
		perllibdir="$(perl_get_raw_vendorlib)" \
		sysconfdir="${EPREFIX}"/etc \
		DESTDIR="${D}" \
		GIT_TEST_OPTS="--no-color" \
		OPTAR="$(tc-getAR)" \
		OPTCC="$(tc-getCC)" \
		OPTCFLAGS="${CFLAGS}" \
		OPTLDFLAGS="${LDFLAGS}" \
		PERL_PATH="${EPREFIX}/usr/bin/perl" \
		PERL_MM_OPT="" \
		PYTHON_PATH="${PYTHON_PATH}" \
		V=1 \
		"$@"
}

src_compile() {
	git_emake
}

src_install() {
	dodir /usr/libexec/git-core

	git_emake install
}
