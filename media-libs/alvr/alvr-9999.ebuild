# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

inherit desktop cargo xdg git-r3

DESCRIPTION="ALVR is an open source remote VR display for the Oculus Go/Quest"
HOMEPAGE="https://github.com/alvr-org/ALVR"
EGIT_REPO_URI="https://github.com/alvr-org/ALVR.git"
RESTRICT="network-sandbox" # Temp solution for bundled ffmpeg

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	sys-libs/libunwind
	|| (
		www-client/chromium
		www-client/chromium-bin
	)
"

DEPEND="${RDEPEND}"

BDEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_unpack() {
	# cargo_src_unpack

	# # ALVR requires some dependencies not on crate.io (forks of other libraries)
	# # so will just have to fetch them here.
	# pushd "${S}"
	# cargo -v --config "net.offline = false" fetch
	# popd

	git-r3_src_unpack

	pushd "${S}"
	eapply "${FILESDIR}/0001-Fix-cargo-vendor.patch"
	popd

	cargo_live_src_unpack
}

src_configure() {
	local ECARGO_EXTRA_ARGS="
		-p alvr_vrcompositor_wrapper
		-p alvr_server
		-p alvr_dashboard
		-p alvr_vulkan_layer
	"
	cargo_gen_config
	cargo_src_configure
}

src_compile() {
	export ALVR_ROOT_DIR=/usr
	export ALVR_LIBRARIES_DIR="$ALVR_ROOT_DIR/$(get_libdir)/"

	export ALVR_OPENVR_DRIVER_ROOT_DIR="$ALVR_ROOT_DIR/lib/steamvr/alvr/"
	export ALVR_VRCOMPOSITOR_WRAPPER_DIR="$ALVR_ROOT_DIR/libexec/alvr/"

	PKG_CONFIG_PATH="${FILESDIR}" \
		cargo xtask prepare-deps --platform linux

	cargo_src_compile
}

src_install() {
	# vrcompositor wrapper
	exeinto /usr/libexec/alvr/
	newexe target/release/alvr_vrcompositor_wrapper vrcompositor-wrapper

	# OpenVR Driver
	exeinto /usr/lib/steamvr/alvr/bin/linux64/
	newexe target/release/libalvr_server.so driver_alvr_server.so

	insinto /usr/lib/steamvr/alvr/
	doins alvr/xtask/resources/driver.vrdrivermanifest

	# Vulkan layer
	dolib.so target/release/libalvr_vulkan_layer.so
	insinto /usr/share/vulkan/explicit_layer.d/
	doins alvr/vulkan_layer/layer/alvr_x86_64.json

	# Launcher
	dobin target/release/alvr_dashboard

	# Desktop
	domenu packaging/freedesktop/alvr.desktop

	# Icons
	for size in {16,32,48,64,128,256}; do
		convert alvr/dashboard/resources/dashboard.ico \
			-thumbnail ${size} -alpha on -background none -flatten \
			${PN}-${size}.png || die
		newicon -s ${size} ${PN}-${size}.png ${PN}.png
	done

	# Firewall and SELinux
	insinto /etc/ufw/applications.d/
	doins packaging/firewall/ufw-alvr

	insinto /usr/lib/firewalld/services/
	doins packaging/firewall/alvr-firewalld.xml

	doexe packaging/firewall/alvr_fw_config.sh

	insinto /usr/share/alvr/selinux/
	doins packaging/selinux/*
}
