# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg-utils

DESCRIPTION="rhythm is just a *click* away!"
HOMEPAGE="https://github.com/ppy/osu"
#SRC_URI=""
if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ppy/osu.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/ppy/osu/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT CC-BY-NC-4.0"
SLOT="0"
IUSE=""
RESTRICT="test"

DEPEND="
	media-video/ffmpeg
	virtual/opengl
	media-libs/libsdl2
	x11-misc/shared-mime-info
	virtual/dotnet-sdk:6.0
"
RDEPEND="${DEPEND}"

dotnet_ver=6.0
output="./osu.Desktop/bin/Release/netcoreapp$dotnet_ver/linux-x64"

if ! [[ ${PV} = "9999" ]]; then
	S="${WORKDIR}/osu-${PV}"
fi

pkg_setup() {
	if has network-sandbox $FEATURES; then
		eerror
		eerror "This ebuild requires that FEATURE 'network-sandbox'"
		eerror "be disabled, because 'dotnet restore' needs to download"
		eerror "dependencies for osu-lazer."
		eerror
		einfo
		einfo "Just add 'FEATURES=\"-network-sandbox\" games-arcade/osu-lazer'"
		einfo "into package.env."
		einfo
		die "network-sandbox is enabled"
	fi
}

src_compile() {
	if [[ ${PV} = "9999" ]]; then
		dotnet publish osu.Desktop \
			--configuration Release \
			--runtime linux-x64 \
			--output $output \
			--no-self-contained
	else
		dotnet publish osu.Desktop \
			--configuration Release \
			--runtime linux-x64 \
			--output $output \
			--no-self-contained \
			/property:Version=${PV}
	fi
}

src_install() {
	insinto "/usr/lib/${PN}"

	einfo
	einfo "If the merge failed and you were getting any certificate related errors"
	einfo "please update net-misc/ca-certificates"
	einfo
	einfo "For more info related to this issue see:"
	einfo "https://github.com/NuGet/Announcements/issues/49"
	einfo

	doins -r $output/*

	dobin "${FILESDIR}"/osu-lazer

	insinto "/usr/share/mime/packages"
	doins "${FILESDIR}"/x-osu-lazer.xml

	domenu "${FILESDIR}"/osu-lazer.desktop
	doicon "${FILESDIR}"/osu-lazer.png
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
