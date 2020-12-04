# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 meson systemd

DESCRIPTION="An MPD client that submits information to Audioscrobbler"
HOMEPAGE="https://www.musicpd.org/clients/mpdscribble/"
EGIT_REPO_URI="https://github.com/MusicPlayerDaemon/mpdscribble.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="+curl systemd"

RDEPEND="dev-libs/glib:2
	media-libs/libmpdclient
	curl? ( net-misc/curl )
	!curl? ( net-libs/libsoup:2.4 )
	dev-libs/boost[threads]
	dev-libs/libgcrypt"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default

	eapply "${FILESDIR}/mpdscribble-0.23-dont-install-doc.patch"
}

src_configure() {
	local emesonargs=(
		$(meson_feature systemd systemd)
	)

	if use systemd; then
		emesonargs+=( -Dsystemd_system_unit_dir="$(systemd_get_systemunitdir)" )
		emesonargs+=( -Dsystemd_user_unit_dir="$(systemd_get_userunitdir)" )
	else
		emesonargs+=( -Dsystemd_system_unit_dir="no" )
		emesonargs+=( -Dsystemd_user_unit_dir="no" )
	fi

	meson_src_configure
}

src_install() {
	meson_src_install
	newinitd "${FILESDIR}/mpdscribble.rc" mpdscribble
	keepdir /var/cache/mpdscribble
}
