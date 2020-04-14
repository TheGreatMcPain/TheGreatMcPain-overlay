# Copyright 2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
GST_ORG_MODULE=gst-plugins-bad

inherit gstreamer

DESCRIPTION="WebRTC plugins for GStreamer"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=net-libs/libnice-0.1.14[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"

multilib_src_compile() {
	emake -C gst-libs/gst/webrtc
	gstreamer_multilib_src_compile
}

multilib_src_install() {
	# commented-out because gst-plugins-bad installs the files already
	#emake -C gst-libs/gst/webrtc DESTDIR="${D}" install
	gstreamer_multilib_src_install
}
