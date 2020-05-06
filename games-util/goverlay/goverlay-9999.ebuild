# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg-utils

DESCRIPTION=""
HOMEPAGE=""
if [[ ${PV} = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/benjamimgois/goverlay.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/benjamimgois/goverlay/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE=""
SLOT="0"
IUSE="opengl vulkan mangohud"

DEPEND="
	opengl? (
		x11-apps/mesa-progs
	)
	vulkan? (
		dev-util/vulkan-tools
	)
	mangohud? (
		games-util/mangohud
	)
"

RDEPEND="${DEPEND}"

BDEPEND="
	>=dev-lang/lazarus-2.0.6
"

src_prepare() {
	default
	# Since lazbuild, for some reason, requires write access to
	# '--lazarusdir' lets copy it into our working dir.
	elog "Copying lazarus files to working directory."
	cp -r /usr/share/lazarus "${WORKDIR}/lazarus" || \
		die "Failed to copy Lazarus working directory."
}

src_compile() {
	lazbuild \
		--lazarusdir="${WORKDIR}/lazarus" \
		--build-all \
		"${PN}.lpi" || die "Failed to compile."
}

src_install() {
	dobin "${PN}"
	domenu "${S}/data/${PN}.desktop"
	insinto "/usr/share/metainfo"
	doins "${S}/data/${PN}.metainfo.xml"

	for icon_size in 128 256 512; do
		doicon --size ${icon_size} "${S}/data/icons/${icon_size}x${icon_size}/${PN}.png"
	done
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
