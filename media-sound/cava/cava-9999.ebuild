# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit linux-info git-r3 eutils autotools

DESCRIPTION="Console-based Audio Visualizer for ALSA (=CAVA)"
HOMEPAGE="https://github.com/karlstav/cava"
EGIT_REPO_URI="https://github.com/karlstav/cava.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="sci-libs/fftw
		dev-libs/iniparser:0
		sys-libs/ncurses"
RDEPEND="${DEPEND}"

DOCS="README.md"

pkg_setup() {
		if linux_config_exists ; then
			einfo "Checking kernel configuration at $(linux_config_path)..."
			if ! linux_chkconfig_present SND_ALOOP ; then
				ewarn 'Kernel option CONFIG_SND_ALOOP=[ym] needed but missing'
			fi
		fi
}

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf \
			$(use_enable debug ) \
			--enable-legacy_iniparser \
			--docdir="${EREFIX}"/usr/share/doc/${PF}
}

src_compile() {
	emake SYSTEM_LIBINIPARSER=1 VERSION=${PV}
}

src_install() {
	einstalldocs
	emake DESTDIR="${D}" PREFIX=/usr SYSTEM_LIBINIPARSER=1 install
}
