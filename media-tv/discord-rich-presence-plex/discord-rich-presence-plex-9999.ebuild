# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )

inherit distutils-r1 git-r3

DESCRIPTION=""
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
