# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="${PV/_p/-}"
MY_PN="${PN/-bin/}"

DESCRIPTION="FFmpeg for Jellyfin with custom extensions and enhancements (portable binary)"
HOMEPAGE="https://github.com/jellyfin/jellyfin-ffmpeg"
SRC_URI="
	amd64? (
		https://github.com/jellyfin/${MY_PN}/releases/download/v${MY_PV}/${MY_PN}_${MY_PV}_portable_linux64-gpl.tar.xz
	)
	arm64? (
		https://github.com/jellyfin/${MY_PN}/releases/download/v${MY_PV}/${MY_PN}_${MY_PV}_portable_linuxarm64-gpl.tar.xz
	)
"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

S="${WORKDIR}"

src_install() {
	exeinto "/opt/jellyfin-ffmpeg"
	doexe "ffmpeg"
	doexe "ffprobe"
}

pkg_postinst() {
	elog
	elog "'jellyfin-ffmpeg' has been installed to '/opt/jellyfin-ffmpeg'."
	elog
	elog "To use it with Jellyfin go into the adminisration dashboard,"
	elog "then go to 'Playback->Transcoding',"
	elog "and change the 'FFmpeg path' to '/opt/jellyfin-ffmpeg/ffmpeg'."
	elog
}
