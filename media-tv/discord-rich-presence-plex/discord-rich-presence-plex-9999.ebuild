# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )

inherit distutils-r1 git-r3

DESCRIPTION="A Python script that displays your Plex status on Discord using Rich Presence."
HOMEPAGE="https://github.com/Phineas05/discord-rich-presence-plex"

EGIT_REPO_URI="https://github.com/Phineas05/discord-rich-presence-plex.git"
SRC_URI=""
KEYWORDS=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	=dev-python/websocket-client-0.48.0[${PYTHON_USEDEP}]
	dev-python/plexapi[${PYTHON_USEDEP}]
"

RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/add-external-config.patch"
)

src_compile() {
	true
}

src_install() {
	dobin discordRichPresencePlex.py
	dodoc discordRichPresencePlex.conf
	dodoc README.md
}

src_postinst() {
	elog "To configure: Place the example config"
	elog "located in '/usr/share/doc/${P}' named 'discordRichPresencePlex.conf'"
	elog "into '~/.config'."
	elog "It may help to read up on ${HOMEPAGE}"
	elog
	elog "Once done you should be able to run it by doing."
	elog ">$ discordRichPresencePlex.py"
}
