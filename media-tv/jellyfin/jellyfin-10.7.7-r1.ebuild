# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd wrapper

DESCRIPTION="The Free Software Media System"
HOMEPAGE="https://jellyfin.org"
SRC_URI="https://github.com/jellyfin/jellyfin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

# dotnet restore needs internet
RESTRICT="network-sandbox"

DEPEND="dev-dotnet/dotnetcore-sdk-bin:5.0"
RDEPEND="
	${DEPEND}
	>=media-video/ffmpeg-4.2.2
	media-tv/jellyfin-web
	acct-group/jellyfin
	acct-user/jellyfin
	app-crypt/mit-krb5
	dev-db/sqlite
	dev-util/lttng-ust
	media-libs/fontconfig
	media-libs/freetype
"

# Ignore PRESTRIPPED QA errors.
QA_PREBUILT="usr/lib/${MY_PN}/*"
QA_PRESTRIPPED="${QA_PREBUILT}"

src_prepare() {
	default

	# Use system ffmpeg
	sed -i "s|JELLYFIN_FFMPEG_OPT=|#JELLYFIN_FFMPEG_OPT=|" "debian/conf/${PN}" \
		|| die
}

src_compile() {
	dotnet publish Jellyfin.Server \
		--configuration Release \
		--runtime linux-x64 \
		--output "./jellyfin" \
		--no-self-contained \
		"-p:DebugSymbols=false;DebugType=none"
}

src_install() {
	# Install the Server part
	insinto usr/lib/
	doins -r "${PN}"
	insinto "etc/${PN}"
	doins -r "debian/conf/logging.json"

	# Install restart.sh script into "usr/lib/jellyfin"
	insinto "usr/lib/${PN}"
	doins "debian/bin/restart.sh"

	# Install wrappers
	make_wrapper "${PN}" "${EPREFIX}/usr/lib/${PN}/${PN}"

	# Install services
	newinitd "${FILESDIR}/${PN}" "${PN}"
	doconfd "debian/conf/${PN}"
	dosym "${EPREFIX}/etc/conf.d/${PN}" "${EPREFIX}/etc/default/${PN}"
	systemd_dounit "debian/${PN}.service"
	systemd_install_serviced "debian/conf/${PN}.service.conf"

	# Fix permissions
	chmod +x "${ED}/usr/lib/${PN}"/* || die
	chown -R jellyfin:jellyfin "${ED}/usr/lib/${PN}" || die
}
