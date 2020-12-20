# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 vala meson

DESCRIPTION="Set of programs to inspect and build Windows Installer (.MSI) files"
HOMEPAGE="https://wiki.gnome.org/msitools"

if [[ "${PV}" == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/GNOME/msitools.git"
	KEYWORDS=""
fi

LICENSE="LGPL-2+"
SLOT="0"
IUSE="+introspection static"

RDEPEND="
	>=app-arch/gcab-0.4[vala]
	gnome-extra/libgsf
	introspection? ( >=dev-libs/gobject-introspection-0.10.8 )
"
DEPEND="${RDEPEND}
	dev-libs/gobject-introspection-common
	dev-libs/vala-common
	dev-util/intltool
	>=dev-util/gtk-doc-am-1.13
	>=virtual/pkgconfig-0-r1
	$(vala_depend)
"

src_prepare() {
	default

	vala_src_prepare
}

src_configure() {
	local emesonargs=(
		$(meson_use introspection)
	)

	meson_src_configure
}
