# Copyright 2020 Gentoo Authors
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
	SRC_URI="https://github.com/ppy/osu/archive/${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT CC-BY-NC-4.0"
SLOT="0"
IUSE=""
# dotnet needs to download some nuget packages to build osu-lazer
RESTRICT="network-sandbox test"

DEPEND="
	media-video/ffmpeg
	virtual/opengl
	media-libs/libsdl2
	x11-misc/shared-mime-info
	>=dev-dotnet/dotnetcore-sdk-bin-3.1.201
"
RDEPEND="${DEPEND}"

dotnet_ver=3.1
output="./osu.Desktop/bin/Release/netcoreapp$dotnet_ver/linux-x64"

if ! [[ ${PV} = "9999" ]]; then
	S="${WORKDIR}/osu-${PV}"
fi

src_compile() {
	if [[ ${PV} = "9999" ]]; then
		dotnet publish osu.Desktop \
			--framework netcoreapp$dotnet_ver \
			--configuration Release \
			--runtime linux-x64 \
			--output $output \
			--no-self-contained
	else
		dotnet publish osu.Desktop \
			--framework netcoreapp$dotnet_ver \
			--configuration Release \
			--runtime linux-x64 \
			--output $output \
			--no-self-contained \
			/property:Version=${PV}
	fi
}

src_install() {
	insinto "/usr/lib/${PN}"

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
