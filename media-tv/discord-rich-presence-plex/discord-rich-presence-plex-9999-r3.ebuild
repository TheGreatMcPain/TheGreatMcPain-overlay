# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10..11} )

inherit python-r1 git-r3

DESCRIPTION="A Python script that displays your Plex status on Discord using Rich Presence."
HOMEPAGE="https://github.com/Phineas05/discord-rich-presence-plex"

EGIT_REPO_URI="https://github.com/Phineas05/discord-rich-presence-plex.git"
SRC_URI=""
KEYWORDS=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	dev-python/websocket-client[${PYTHON_USEDEP}]
	dev-python/plexapi[${PYTHON_USEDEP}]
"

RDEPEND="
	${PYTHON_DEPS}
	${DEPEND}
"

PATCHES=(
	"${FILESDIR}/add-external-config.patch"
)

src_prepare() {
	default

	# append shebang to main.py
	mv "main.py" "main.py-backup" || die
	echo "#!/usr/bin/env python3.10" > "main.py" || die
	cat "main.py-backup" >> "main.py" || die
	rm "main.py-backup" || die

	# Make 'main.py' executable
	chmod +x "main.py" || die
}

src_compile() {
	true
}

src_install() {
	# Cleanup git files
	rm -rf ".git" ".gitignore"

	dodoc README.md

	dodir "/usr/$(get_libdir)/discord-rich-presence-plex"
	insinto "/usr/$(get_libdir)/discord-rich-presence-plex"

	doins -r "./"

	# A bit janky
	dosym "../$(get_libdir)/discord-rich-presence-plex/main.py" "/usr/bin/discord-rich-presence-plex"
	chmod +x "${ED}/usr/bin/discord-rich-presence-plex"
}

pkg_postinst() {
	einfo
	einfo "To configure: create '~/.config/discord-rich-presence-plex'"
	einfo "and run discord-rich-presence-plex"
	einfo
}
