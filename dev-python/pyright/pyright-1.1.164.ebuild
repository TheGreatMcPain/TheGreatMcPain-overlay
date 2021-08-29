# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Static type checker for Python"
HOMEPAGE="https://github.com/microsoft/pyright"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""
RESTRICT="network-sandbox"

DEPEND="
"
RDEPEND="${DEPEND}"

NPM_NO_DEPS=1

NPM_BINS="
    index.js => pyright
"

NPM_PKG_DIRS="dist"

S="${WORKDIR}/package"

inherit npmv1

src_install() {
    npmv1_src_install
    chmod +x "${ED}${NPM_PACKAGEDIR}/index.js"
    chmod +x "${ED}${NPM_PACKAGEDIR}/langserver.index.js"
}