# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake desktop xdg flag-o-matic

DESCRIPTION="A modder-friendly OpenGL source port based on the DOOM engine"
HOMEPAGE="https://zdoom.org"

if ver_test -eq "9999"; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/coelckers/${PN}.git"
	# EGIT_SUBMODULES="non-free? (wadsrc_widescreen/static)"
	EGIT_SUBMODULES=()
	KEYWORDS=""
else
	SRC_URI="https://github.com/coelckers/${PN}/archive/g${PV}.tar.gz -> ${P}.tar.gz
		non-free? ( https://github.com/nashmuhandes/WidePix/archive/92738042ca3a37f28153a09809d80a7d61090532.tar.gz -> widepix-9273804.tar.gz )"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="Apache-2.0 BSD BZIP2 GPL-3 LGPL-2.1+ LGPL-3 MIT
	non-free? ( Activision ChexQuest3 DOOM-COLLECTORS-EDITION freedist WidePix )"
SLOT="0"
IUSE="debug gtk gtk2 +non-free openmp"

DEPEND="
	app-arch/bzip2
	media-libs/libsdl2[opengl]
	media-libs/openal
	media-libs/zmusic
	sys-libs/zlib
	virtual/jpeg:0
	gtk? (
		gtk2? ( x11-libs/gtk+:2 )
		!gtk2? ( x11-libs/gtk+:3 )
	)"
RDEPEND="${DEPEND}"

if ver_test -ne "9999"; then
	S="${WORKDIR}/${PN}-g${PV}"
fi

PATCHES=(
	"${FILESDIR}/${P}-Introduce-the-BUILD_NONFREE-option.patch"
)

src_unpack() {
	if ver_test -eq "9999"; then
		use non-free && EGIT_SUBMODULES+=('wadsrc_widescreen/static')
		git-r3_src_unpack
	else
		default
	fi
}

src_prepare() {
	rm -rf docs/licenses || die
	rm -rf libraries/{bzip2,jpeg,zlib} || die
	if ! use non-free ; then
		rm -rf wadsrc_bm wadsrc_extra wadsrc_widescreen || die
	else
		if ver_test -ne "9999"; then
			mv "${WORKDIR}/WidePix-92738042ca3a37f28153a09809d80a7d61090532/filter" wadsrc_widescreen/static/ || die
		fi
	fi

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DINSTALL_DOCS_PATH="${EPREFIX}/usr/share/doc/${PF}"
		-DINSTALL_PK3_PATH="${EPREFIX}/usr/share/doom"
		-DINSTALL_SOUNDFONT_PATH="${EPREFIX}/usr/share/doom"
		-DDYN_OPENAL=OFF
		-DNO_GTK="$(usex !gtk)"
		-DNO_OPENAL=OFF
		-DNO_OPENMP="$(usex !openmp)"
		-DBUILD_NONFREE="$(usex non-free)"
	)

	# Has issues with LTO
	filter-flags "-flto=*"

	# Disable asserts for slight performance improvement
	# at the cost of not catching certain errors in the code.
	use debug || append-cppflags -DNDEBUG

	cmake_src_configure
}

src_install() {
	newicon src/posix/zdoom.xpm "${PN}.xpm"
	make_desktop_entry "${PN}" "GZDoom" "${PN}" "Game;ActionGame"
	cmake_src_install
}

pkg_postinst() {
	xdg_pkg_postinst

	if ! use non-free ; then
		ewarn
		ewarn "GZDoom installed without non-free components."
		ewarn "Note: The non-free game_support.pk3 file is needed to play"
		ewarn "      games natively supported by GZDoom."
		ewarn "A list of games natively supported by GZDoom is available"
		ewarn "on the ZDoom wiki: https://zdoom.org/wiki/IWAD"
		ewarn
	fi
}
