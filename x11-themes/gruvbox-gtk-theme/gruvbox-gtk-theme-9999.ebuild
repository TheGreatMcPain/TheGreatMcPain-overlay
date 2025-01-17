# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 xdg-utils

DESCRIPTION="A GTK theme based on the Gruvbox colour palette."
HOMEPAGE="https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme"

EGIT_REPO_URI="https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+gtk2 +icons"

RDEPEND="
	gtk2? (
		x11-themes/gnome-themes-standard
		x11-themes/gtk-engines-murrine
	)
"
BDEPEND="
	dev-lang/sassc
	icons? ( dev-util/gtk-update-icon-cache )
"

src_prepare() {
	eapply_user
	sed -i icons/*/index.theme -e 's/oomox-//' || die
}

src_configure() {
	true
}

src_compile() {
	cd "${S}/themes"
	./build.sh
	cd "${S}"
}

src_install() {
	cd "${S}/themes"
	./install.sh --dest "${ED}/usr/share/themes" --theme all
	cd "${S}"

	if use icons; then
		einfo "Installing icons"
		insinto /usr/share/icons
		doins -r icons/Gruvbox-Dark
		doins -r icons/Gruvbox-Light
	fi
}

pkg_postinst() {
	if use icons; then
		xdg_icon_cache_update
	fi
}

pkg_postrm() {
	if use icons; then
		xdg_icon_cache_update
	fi
}
