# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Ebuild automatically produced by node-ebuilder.

EAPI=6

DESCRIPTION="Beautifier for javascript https://beautifier.io"
HOMEPAGE="https://github.com/beautify-web/js-beautify"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""
RESTRICT="network-sandbox"

DEPEND="
"
RDEPEND="${DEPEND}"

NPM_NO_DEPS=0

NPM_BINS="
	css-beautify.js => css-beautify
	html-beautify.js => html-beautify
	js-beautify.js => js-beautify
"

S="${WORKDIR}/package"

inherit npmv1

# npmv1 doesn't understand that js-beautify's
# 'bin' and 'lib' directories are located in the 'js' directory.
src_unpack() {
	default

	mv "${S}"/js/* "${S}"
}
