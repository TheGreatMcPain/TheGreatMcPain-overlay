# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="HEVC/H264 video encoder using NVEnc"
HOMEPAGE="https://github.com/rigaya/NVEnc"
# SRC_URI="https://github.com/rigaya/NVEnc"
EGIT_REPO_URI="https://github.com/rigaya/NVEnc"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	>=x11-drivers/nvidia-drivers-435.21
	<media-video/ffmpeg-5:0=
	>=dev-util/nvidia-cuda-toolkit-10
"
DEPEND="${RDEPEND}"

src_configure() {
	./configure \
		--prefix="${EPREFIX}/usr" \
		--cuda-path="${EPREFIX}/opt/cuda" || die "configure failed"
}

src_install() {
	dobin nvencc
}
