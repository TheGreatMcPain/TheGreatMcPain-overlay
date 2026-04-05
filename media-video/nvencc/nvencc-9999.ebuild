# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cuda meson

DESCRIPTION="Custom NVENC encoder"
HOMEPAGE="https://github.com/rigaya/NVEnc"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/rigaya/NVEnc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

# TODO
DEPEND="
	media-libs/libhdr10plus
	media-libs/libdovi
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply_user
	cuda_src_prepare
	meson_src_prepare
}

src_configure() {
	export CUDA_PATH="/opt/cuda"
	local emesonargs=(
		-Denable_vapoursynth=false
		-Denable_avisynth=false
		-Dcuda_ccbindir=$(cuda_gccdir)
	)
	meson_src_configure
}
