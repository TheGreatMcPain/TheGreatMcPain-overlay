# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="Broadcast your MPD state using discord rich presence!"
HOMEPAGE="https://github.com/justas-d/mpd-rich-presence-discord"

EGIT_REPO_URI="https://github.com/justas-d/mpd-rich-presence-discord.git"
EGIT_SUBMODULES=(
	"-*"
)

SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	media-libs/libmpdclient
	net-im/discord-rpc
"

RDEPEND="${DEPEND}"

src_install() {
	dobin "${BUILD_DIR}/mpd_discord_richpresence"
	dodoc "${S}/README.md"
}
