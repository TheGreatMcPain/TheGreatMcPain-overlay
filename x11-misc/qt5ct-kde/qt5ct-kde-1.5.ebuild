# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Qt5 configuration tool, similar to qtconfig for Qt4 (KDE fixes)"
HOMEPAGE="https://aur.archlinux.org/packages/qt5ct-kde"
SRC_URI="https://download.sourceforge.net/qt5ct/qt5ct-${PV}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 ~arm ~ppc64 x86"

RDEPEND="
	!x11-misc/qt5ct
	kde-frameworks/qqc2-desktop-style
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5=[dbus]
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-qt/linguist-tools:5
	dev-qt/qtpaths:5
"

PATCHES="${FILESDIR}/qt5ct-shenanigans.patch"

S="${WORKDIR}/qt5ct-${PV}"

src_install() {
	cmake_src_install

	newenvd - 98qt5ct <<< 'QT_QPA_PLATFORMTHEME=qt5ct'
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		ewarn "qt5ct configuration won't be applied to the currently running sessions."
		ewarn "Please relogin."
	fi
	if ! has_version 'dev-qt/qtsvg:5'; then
		elog
		elog "For SVG icon themes, please install 'dev-qt/qtsvg:5'."
		elog
	fi
}
