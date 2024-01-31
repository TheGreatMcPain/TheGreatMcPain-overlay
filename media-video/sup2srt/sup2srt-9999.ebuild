# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="Convert SUP graphic subtitles to text-based SRT format"
HOMEPAGE="https://github.com/retrontology/sup2srt"
EGIT_REPO_URI="https://github.com/retrontology/sup2srt.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="
	media-libs/tiff[cxx]
	app-text/tesseract
	media-video/ffmpeg
	media-libs/leptonica
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin ${BUILD_DIR}/src/sup2srt
	dobin ${BUILD_DIR}/src/sup2disk
}
