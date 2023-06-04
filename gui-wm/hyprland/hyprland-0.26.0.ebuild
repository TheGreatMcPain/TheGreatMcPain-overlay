# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson cmake

DESCRIPTION="A dymanic tiling Wayland compositor that doesn't sacrifice on its looks."
HOMEPAGE="https://github.com/hyprwm/Hyprland"

SRC_URI="https://github.com/hyprwm/Hyprland/releases/download/v${PV}/source-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+hwdata +seatd +udev vulkan +x11-backend X video_cards_nvidia"

# Copied from gui-libs/wlroots-9999
DEPEND="
	>=dev-libs/libinput-1.14.0:0=
	>=dev-libs/wayland-1.22.0
	>=dev-libs/wayland-protocols-1.28
	media-libs/mesa[egl(+),gles2]
	>=media-libs/libdisplay-info-0.1.1:=
	hwdata? ( sys-apps/hwdata:= )
	seatd? ( sys-auth/seatd:= )
	udev? ( virtual/libudev )
	vulkan? (
		dev-util/glslang:0=
		dev-util/vulkan-headers:0=
		media-libs/vulkan-loader:0=
	)
	>=x11-libs/libdrm-2.4.114:0=
	x11-libs/libxkbcommon
	>=x11-libs/pixman-0.42.0:0=
	x11-backend? ( x11-libs/libxcb:0= )
	X? (
		x11-base/xwayland
		x11-libs/libxcb:0=
		x11-libs/xcb-util-image
		x11-libs/xcb-util-wm
	)
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	>=dev-libs/wayland-protocols-1.31
	>=dev-util/meson-0.60.0
	dev-util/wayland-scanner
	virtual/pkgconfig
"

pkg_pretend() {
	if ! has_version ">=sys-devel/gcc-12.1.0"; then
		eerror
		eerror "sys-devel/gcc-12.1.0 and up is required (needs C++23 support)"
		eerror
		die "Incompatible C++ compiler"
	fi
}

pkg_setup() {
	if ! has_version ">=sys-devel/gcc-12.1.0"; then
		eerror
		eerror "sys-devel/gcc-12.1.0 and up is required (needs C++23 support)"
		eerror
		die "Incompatible C++ compiler"
	fi
}

compile_udis86() {
	local S="$S/subprojects/udis86"
	local BUILD_DIR="${S}/build"
	local CMAKE_USE_DIR="${S}"

	cmake_src_configure
	cmake_src_compile
}

compile_wlroots() {
	local S="$S/subprojects/wlroots"
	local BUILD_DIR="${S}/build"

	# Taken from gui-libs/wlroots
	local emesonargs=(
		"-Dxcb-errors=disabled"
		"-Dexamples=false"
		-Drenderers=$(usex vulkan 'gles2,vulkan' gles2)
		-Dxwayland=$(usex X enabled disabled)
		-Dbackends=drm,libinput$(usex x11-backend ',x11' '')
	)
	meson_src_configure
	meson_src_compile
}

src_unpack() {
	unpack ${A}

	mv "${PN}-source" "${S}"
}

src_prepare() {
	default

	# Nvidia patch
	if use video_cards_nvidia; then
		sed -i "s|glFlush();|glFinish();|" \
			"${S}/subprojects/wlroots/render/gles2/renderer.c" || die "Nvidia patch failed"

		eapply "${FILESDIR}/0001-Workaround-Screencast-for-Nvidia.patch"
	fi

	cmake_src_prepare
}

# For some reason hyprland uses a combination of Makefiles and CMake
# and the provided wlroots library is compiled via Mesonbuild.
src_configure() {
	emake protocols
	emake fixwlr

	einfo "Compiling 'wlroots'"
	compile_wlroots

	einfo "Compiling 'udis86'"
	compile_udis86

	local mycmakeargs=(
		-DCMAKE_SKIP_RPATH=ON
		-DNO_XWAYLAND=$(usex X false true)
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	emake -C hyprctl all
}

src_install() {
	dobin "${BUILD_DIR}"/Hyprland
	dobin ./hyprctl/hyprctl

	dolib.so subprojects/wlroots/build/libwlroots.so.12032

	insinto /usr/share/wayland-sessions
	doins example/hyprland.desktop

	insinto /usr/share/hyprland
	doins assets/*

	dodoc example/hyprland.conf

	doman docs/Hyprland.1
	doman docs/hyprctl.1

	mkdir "${S}"/headers
	mkdir "${S}"/headers/protocols
	mkdir "${S}"/headers/wlroots

	find src -name '*.h*' -print0 | cpio --quiet -0dump headers
	pushd subprojects/wlroots/include
	find . -name '*.h*' -print0 | cpio --quiet -0dump ../../../headers/wlroots
	popd
	cp protocols/*-protocol.h headers/protocols

	insinto /usr/include/hyprland
	doins -r headers/*

	insinto /usr/share/pkgconfig
	doins ${BUILD_DIR}/hyprland.pc
}

pkg_postinst() {
	elog "You must be in the input group to allow Hyprland"
	elog "to access input devices via libinput."
}
