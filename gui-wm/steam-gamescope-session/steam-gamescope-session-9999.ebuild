# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Steam BigPicture gamescope session."
HOMEPAGE="https://github.com/shahnawazshahin/steam-using-gamescope-guide"
EGIT_REPO_URI="https://github.com/shahnawazshahin/steam-using-gamescope-guide.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

# Steam is also required
# (not putting it here, so this overlay won't require 'steam-overlay')
DEPEND="
	gui-wm/gamescope
"

src_install() {
	dobin "${S}/usr/bin/gamescope-session"
	dobin "${S}/usr/bin/jupiter-biosupdate"
	dobin "${S}/usr/bin/steamos-session-select"
	dobin "${S}/usr/bin/steamos-select-branch"
	dobin "${S}/usr/bin/steamos-update"

	exeinto /usr/bin/steamos-polkit-helpers
	doexe "${S}/usr/bin/steamos-polkit-helpers/jupiter-biosupdate"
	doexe "${S}/usr/bin/steamos-polkit-helpers/steamos-update"
	doexe "${S}/usr/bin/steamos-polkit-helpers/steamos-set-timezone"

	insinto "/usr/share/wayland-sessions/"
	insopts -m644
	doins "${S}/usr/share/wayland-sessions/steam.desktop"

	# Some people may want to modify the gamescope-session script based on their system.
	dodir /etc/env.d
	echo "CONFIG_PROTECT=/usr/bin/gamescope-session" >> "${ED}"/etc/env.d/99gamescope_session || die
}
