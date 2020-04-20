# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3

DESCRIPTION="A flat theme with transparent elements"
HOMEPAGE="https://github.com/cyrinux/arc-gruvbox-theme"
EGIT_REPO_URI="https://github.com/cyrinux/arc-gruvbox-theme.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="
	cinnamon
	dark
	darker
	gnome
	+gtk2
	+gtk3
	+light
	mate
	plank
	+transparency
	unity
	xfce
"
REQUIRED_USE="
	|| ( dark darker light )
"

# Supports various GTK+3 versions and uses pkg-config to determine which set of
# files to install. Updates will break it but only this fix will help.
# https://github.com/horst3180/arc-theme/pull/436
DEPEND="
	gtk3? (
		>=x11-libs/gtk+-3.14:3
	)
"
# gnome-themes-standard is only needed by GTK+2 for the Adwaita
# engine. This engine is built into GTK+3.
RDEPEND="
	gtk2? (
		x11-themes/gnome-themes-standard
	)
	x11-themes/gtk-engines-murrine
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable cinnamon) \
		$(use_enable dark) \
		$(use_enable darker) \
		$(use_enable gnome gnome-shell) \
		$(use_enable gtk2) \
		$(use_enable gtk3) \
		$(use_enable light) \
		$(use_enable mate metacity) \
		$(use_enable transparency) \
		$(use_enable unity) \
		$(use_enable xfce xfwm)
}

src_install() {
	emake DESTDIR="${D}" install

	# manually install plank theme files
	if use "plank"; then
		cp -r "${S}/extra/plank" "${D}/share/plank/themes/"
		chown -R root:root "${D}/share/plank/themes"
	fi
}
