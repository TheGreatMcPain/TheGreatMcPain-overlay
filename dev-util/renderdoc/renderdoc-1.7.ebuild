# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
PYTHON_COMPAT=( python3_6 python3_7 )
inherit qmake-utils cmake-utils eutils python-single-r1

SWIG_VERSION="6"
SWIG_ZIP_FILENAME="${PN}_swig_modified-${SWIG_VERSION}.zip"
DESCRIPTION="A tool for tracing, analyzing, and debugging graphics APIs"
HOMEPAGE="https://github.com/baldurk/renderdoc"
SRC_URI="https://github.com/baldurk/renderdoc/archive/v${PV}.tar.gz -> ${P}.tar.gz
		qt5? ( https://github.com/baldurk/swig/archive/renderdoc-modified-${SWIG_VERSION}.zip -> ${SWIG_ZIP_FILENAME} )"
CMAKE_BUILD_TYPE="Release"
CMAKE_BUILD_GENERATOR="Ninja"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+qt5 +python"

RDEPEND="${PYTHON_DEPS}
	dev-libs/libpcre
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
	python? (
		>=dev-lang/python-3.6:*
	)
	qt5? (
		>=dev-qt/qtcore-5.6:5
		>=dev-qt/qtgui-5.6:5
		>=dev-qt/qtwidgets-5.6:5
		>=dev-qt/qtsvg-5.6:5
		>=dev-qt/qtx11extras-5.6:5
	)"
DEPEND="${RDEPEND}
	>=sys-devel/gcc-6.0:*
	dev-util/cmake
	sys-devel/bison
	app-arch/unzip"

src_configure() {
	export QT_SELECT=qt5
	export QMAKE_QT5_COMMAND=qmake-qt5
	local mycmakeargs=(
		-DRENDERDOC_SWIG_PACKAGE="${DISTDIR}/${SWIG_ZIP_FILENAME}"
	)
	cmake-utils_src_configure
}
