# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="Convert ASS subtitles into BDN XML + PNG images"
HOMEPAGE="https://github.com/cubicibo/ass2bdnxml"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/cubicibo/ass2bdnxml.git"

# Doesn't have a LICENSE file, but 'ass2bdnxml.c' contains license text.
LICENSE="MIT"
SLOT="0"
#KEYWORDS=""

DEPEND="
	media-libs/libpng
	media-libs/libass
	media-gfx/libimagequant
"
RDEPEND="${DEPEND}"

src_install() {
	meson_src_install
	dobin "${BUILD_DIR}/${PN}"
}
