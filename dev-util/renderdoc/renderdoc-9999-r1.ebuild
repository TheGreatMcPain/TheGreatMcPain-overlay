# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit qmake-utils cmake-multilib eutils python-single-r1 git-r3 xdg-utils

SWIG_VERSION="7"
SWIG_ZIP_FILENAME="${PN}_swig_modified-${SWIG_VERSION}.zip"
DESCRIPTION="A tool for tracing, analyzing, and debugging graphics APIs"
HOMEPAGE="https://github.com/baldurk/renderdoc"
SRC_URI="qt5? ( https://github.com/baldurk/swig/archive/renderdoc-modified-${SWIG_VERSION}.zip -> ${SWIG_ZIP_FILENAME} )"
EGIT_REPO_URI="https://github.com/baldurk/renderdoc.git"
EGIT_BRANCH="v1.x"
if ! [ ${PV} = "9999" ]; then
	EGIT_COMMIT="v${PV}"
fi
CMAKE_BUILD_TYPE="Release"
CMAKE_BUILD_GENERATOR="Ninja"
export QT_SELECT="qt5"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+qt5 +python"

RDEPEND="${PYTHON_DEPS}
	dev-libs/libpcre
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
	>=sys-devel/gcc-5.0:*
	python? (
		>=dev-lang/python-3.6:*
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtsvg:5
		dev-qt/qtx11extras:5
	)
"

DEPEND="${RDEPEND}
	dev-util/cmake
	sys-devel/bison
"

PATCHES=("${FILESDIR}"/renderdoc-dont-install-docs.patch)

if ver_test -eq "1.11"; then
	PATCHES+=("${FILESDIR}"/renderdoc-1.11-fix-half-library.patch)
fi

src_prepare() {
	cmake-utils_src_prepare
	# Force vulkan layer to be multilib.
	sed "${S}"/renderdoc/driver/vulkan/renderdoc.json \
		-e 's|@VULKAN_LAYER_MODULE_PATH@|librenderdoc.so|g' \
		-i || die
}

multilib_src_configure() {
	if ! multilib_is_native_abi; then
		local mycmakeargs=(
			-DENABLE_QRENDERDOC=OFF
			-DENABLE_PYRENDERDOC=OFF
		)
	else
		local mycmakeargs=(
			-DRENDERDOC_SWIG_PACKAGE="${DISTDIR}/${SWIG_ZIP_FILENAME}"
		)
	fi
	cmake-utils_src_configure
}

multilib_src_install_all() {
	cp "${S}"/util/LINUX_DIST_README "${S}"/README || die
	dodoc README
	dodoc LICENSE.md
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
