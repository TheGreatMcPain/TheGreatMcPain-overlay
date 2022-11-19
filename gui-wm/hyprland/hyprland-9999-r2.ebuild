# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson cmake toolchain-funcs git-r3

DESCRIPTION="A dymanic tiling Wayland compositor that doesn't sacrifice on its looks."
HOMEPAGE="https://github.com/hyprwm/Hyprland"

EGIT_REPO_URI="https://github.com/hyprwm/Hyprland.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="greetd-fix vulkan +x11-backend X video_cards_nvidia"

# Copied from gui-libs/wlroots-9999
DEPEND="
	>=dev-libs/libinput-1.14.0:0=
	>=dev-libs/wayland-1.21.0
	>=dev-libs/wayland-protocols-1.24
	media-libs/mesa[egl(+),gles2,gbm(+)]
	sys-auth/seatd:=
	virtual/libudev
	vulkan? (
		dev-util/glslang:0=
		dev-util/vulkan-headers:0=
		media-libs/vulkan-loader:0=
	)
	>=x11-libs/libdrm-2.4.109:0=
	x11-libs/libxkbcommon
	x11-libs/pixman
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
	>=dev-libs/wayland-protocols-1.24
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

src_prepare() {
	default

	if use greetd-fix; then
		eapply "${FILESDIR}/0001-Make-tmp-hypr-readable-writable-by-everyone.patch"
	fi

	# Nvidia patch
	if use video_cards_nvidia; then
		sed -i "s|glFlush();|glFinish();|" \
			"${S}/subprojects/wlroots/render/gles2/renderer.c" || die "Nvidia patch failed"
	fi

	cmake_src_prepare
}

# For some reason hyprland uses a combination of Makefiles and CMake
# and the provided wlroots library is compiled via Mesonbuild.
src_configure() {
	emake protocols
	emake fixwlr

	elog "Compiling 'wlroots'"
	compile_wlroots

	# Use latest gcc
	latest_gcc=$(ls /usr/bin/gcc-* | grep -vE 'ar|nm|ranlib|config' | sort -r | head -n1)
	latest_gxx=$(ls /usr/bin/g++-* | grep -vE 'ar|nm|ranlib|config' | sort -r | head -n1)

	elog "Will compile 'Hyprland' with '${latest_gxx}'"

	CC=${latest_gcc}
	CXX=${latest_gxx}
	tc-export CC CXX

	local mycmakeargs=(
		-DCMAKE_SKIP_RPATH=ON
		-DNO_XWAYLAND=$(usex X false true)
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	pushd hyprctl
	emake all
	popd
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
}

pkg_postinst() {
	if use greetd-fix; then
		ewarn "You've enabled the 'greetd-fix' USE."
		ewarn "This makes '/tmp/hypr' modifiable by everyone (mode 777),"
		ewarn "which allows 'hyprctl' to work if '/tmp/hypr' was created by"
		ewarn "the 'greetd' user."
		ewarn
	fi
	elog "You must be in the input group to allow Hyprland"
	elog "to access input devices via libinput."
}
