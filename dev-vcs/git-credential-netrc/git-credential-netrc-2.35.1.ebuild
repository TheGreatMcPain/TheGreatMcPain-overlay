# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs perl-module

DESCRIPTION="git credential helper that reads netrc files."
HOMEPAGE="https://www.git-scm.com/"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://git.kernel.org/pub/scm/git/git.git"
	# Please ensure that all _four_ 9999 ebuilds get updated; they track the 4 upstream branches.
	# See https://git-scm.com/docs/gitworkflows#_graduation
	# In order of stability:
	# 9999-r0: maint
	# 9999-r1: master
	# 9999-r2: next
	# 9999-r3: seen
	case "${PVR}" in
		9999) EGIT_BRANCH=maint ;;
		9999-r1) EGIT_BRANCH=master ;;
		9999-r2) EGIT_BRANCH=next;;
		9999-r3) EGIT_BRANCH=seen ;;
	esac
fi

MY_PV="${PV/_rc/.rc}"
MY_P="git-${MY_PV}"

DOC_VER="${MY_PV}"

if [[ ${PV} != *9999 ]]; then
	SRC_URI_SUFFIX="xz"
	SRC_URI_KORG="https://www.kernel.org/pub/software/scm/git"
	[[ "${PV/rc}" != "${PV}" ]] && SRC_URI_KORG+='/testing'
	SRC_URI="${SRC_URI_KORG}/${MY_P}.tar.${SRC_URI_SUFFIX}"
	[[ "${PV}" == *_rc* ]] || \
	KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	~dev-vcs/git-${PV}[perl]
"
RDEPEND="${DEPEND}"
BDEPEND=""

if [[ "${PV}" == "9999" ]]; then
	S="${S}/contrib/credential/netrc"
else
	S="${WORKDIR}/git-${MY_PV}/contrib/credential/netrc"
fi

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
