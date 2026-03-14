# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=( 20 21 )
RUST_NEEDS_LLVM=1
RUST_MIN_VER="1.89"

inherit cargo llvm-r1 systemd git-r3

DESCRIPTION="A ready to go Wayland status bar for Hyprland and Niri"
HOMEPAGE="https://malpenzibo.github.io/ashell/"
EGIT_REPO_URI="https://github.com/MalpenZibo/ashell.git"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD Boost-1.0
	CC0-1.0 GPL-3+ ISC MIT MPL-2.0 UoI-NCSA Unicode-3.0 ZLIB
"
SLOT="0"

RDEPEND="
	dev-libs/wayland-protocols
	media-fonts/symbols-nerd-font
	media-libs/libpulse
	media-video/pipewire:=
	sys-apps/dbus
	x11-libs/libxkbcommon
"
# libclang is required for bindgen
BDEPEND="
	$(llvm_gen_dep 'llvm-core/clang:${LLVM_SLOT}')
"

pkg_setup() {
	llvm-r1_pkg_setup
	rust_pkg_setup
}

src_unpack() {
    git-r3_src_unpack
    cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure --frozen
}

src_install() {
	# default invokes `make install` which invokes `sudo cp`
	# therefore explicitly invoke cargo_src_install
	cargo_src_install
	einstalldocs
	systemd_douserunit "${FILESDIR}/ashell.service"
}

pkg_postinst() {
	systemd_is_booted && elog "This port provides the systemd user service unit ashell.service."
}
