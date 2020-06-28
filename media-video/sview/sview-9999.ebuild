# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic

DESCRIPTION="Stereoscopic media player"
HOMEPAGE="http://www.sview.ru"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gkv311/sview.git"
	SRC_URI=""
	KEYWORDS=""
else
	VERSION="${PV/./_}"
	SRC_URI="https://github.com/gkv311/sview/archive/${VERSION}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE=""
SLOT="0"
IUSE="webp"

DEPEND="
	x11-libs/gtk+:2
	media-video/ffmpeg
	media-libs/openal
	dev-libs/libconfig
	x11-libs/libXpm
	webp? (
		media-libs/libwebp
	)
"

RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES="
	"${FILESDIR}/respect-flags.patch"
"

src_prepare() {
	default

	echo $(get_libdir)
}

src_compile() {
	emake MY_CFLAGS="${CFLAGS}" MY_CXXFLAGS="${CXXFLAGS}" MY_LDFLAGS="${LDFLAGS}" USR_LIB="$(get_libdir)"
}

src_install() {
	emake DESTDIR="${D}" USR_LIB="$(get_libdir)" install
}
