# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES=""

# Pulled from fem-overlay
CARGO_DEP_ARCHIVE_VER="2025-04-02"
CARGO_DEP_ARCHIVE_PV="${PV}+${CARGO_DEP_ARCHIVE_VER}"
CARGO_DEP_ARCHIVE_P="${PN}-deps-${CARGO_DEP_ARCHIVE_PV}"
CARGO_VENDOR_BASEURI="https://gitlab.com/api/v4/projects/42159594/packages/generic"
CARGO_VENDOR_ARCHIVE_NAME="${P}-deps.tar.xz"
CARGO_VENDOR_SRC_URI="${CARGO_VENDOR_BASEURI}/${PN}/${CARGO_DEP_ARCHIVE_PV//+/%2B}/${CARGO_VENDOR_ARCHIVE_NAME} -> ${CARGO_DEP_ARCHIVE_P}.tar.xz"

OPENVR_PV="1.16.8"

inherit desktop cargo xdg

DESCRIPTION="ALVR is an open source remote VR display for the Oculus Go/Quest"
HOMEPAGE="https://github.com/alvr-org/ALVR"
SRC_URI="
	https://github.com/alvr-org/ALVR/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ValveSoftware/openvr/archive/v${OPENVR_PV}.tar.gz -> ${P}-openvr.tar.gz
	${CARGO_VENDOR_SRC_URI}
"
S="${WORKDIR}/ALVR-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="video_cards_nvidia"

RDEPEND="
	sys-libs/libunwind
	media-video/ffmpeg[encode(+),drm,vulkan,vaapi]
	video_cards_nvidia? (
		media-video/ffmpeg[cuda,nvenc]
	)
"

DEPEND="${RDEPEND}"

BDEPEND="${RDEPEND}
	virtual/pkgconfig
	virtual/jack
	media-gfx/imagemagick
"

PATCHES=(
	"${FILESDIR}/0001-cargo-Remove-custom-release-profile.patch"
	"${FILESDIR}/0002-Force-system-ffmpeg.patch"
)

src_unpack() {
	cargo_src_unpack

	ln -s "${WORKDIR}/vendor" "${S}/" || die

	sed -i "${ECARGO_HOME}/config.toml" -e '/source.crates-io/d'  || die
	sed -i "${ECARGO_HOME}/config.toml" -e '/replace-with = "gentoo"/d'  || die
	sed -i "${ECARGO_HOME}/config.toml" -e '/local-registry = "\/nonexistent"/d'  || die
	cat "${WORKDIR}/vendor/vendor-config.toml" >> "${ECARGO_HOME}/config.toml" || die

	rm -r "${S}/openvr" || die
	ln -s "${WORKDIR}/openvr-${OPENVR_PV}" "${S}/openvr" || die
}

src_configure() {
	local ECARGO_EXTRA_ARGS="
		-p alvr_vrcompositor_wrapper
		-p alvr_server_openvr
		-p alvr_dashboard
		-p alvr_vulkan_layer
	"
	cargo_src_configure
}

src_compile() {
	export ALVR_ROOT_DIR=/usr
	export ALVR_LIBRARIES_DIR="$ALVR_ROOT_DIR/$(get_libdir)/"

	export ALVR_OPENVR_DRIVER_ROOT_DIR="$ALVR_ROOT_DIR/lib/steamvr/alvr/"
	export ALVR_VRCOMPOSITOR_WRAPPER_DIR="$ALVR_ROOT_DIR/libexec/alvr/"
	export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

	cargo_src_compile
}

src_install() {
	# vrcompositor wrapper
	exeinto /usr/libexec/alvr/
	newexe target/release/alvr_vrcompositor_wrapper vrcompositor-wrapper
	doexe target/release/alvr_drm_lease_shim.so

	# OpenVR Driver
	exeinto /usr/lib/steamvr/alvr/bin/linux64/
	newexe target/release/libalvr_server_openvr.so driver_alvr_server.so

	insinto /usr/lib/steamvr/alvr/
	doins alvr/xtask/resources/driver.vrdrivermanifest

	# Vulkan layer
	dolib.so target/release/libalvr_vulkan_layer.so
	insinto /usr/share/vulkan/explicit_layer.d/
	doins alvr/vulkan_layer/layer/alvr_x86_64.json

	# Launcher
	dobin target/release/alvr_dashboard

	# Desktop
	domenu alvr/xtask/resources/alvr.desktop

	# Icons
	for size in {16,32,48,64,128,256}; do
		magick alvr/dashboard/resources/dashboard.ico \
			-thumbnail ${size} -alpha on -background none -flatten \
			${PN}-${size}.png || die
		newicon -s ${size} ${PN}-${size}.png ${PN}.png
	done

	# Firewall and SELinux
	insinto /etc/ufw/applications.d/
	doins alvr/xtask/firewall/ufw-alvr

	insinto /usr/lib/firewalld/services/
	doins alvr/xtask/firewall/alvr-firewalld.xml

	exeinto /usr/libexec/alvr/
	doexe alvr/xtask/firewall/alvr_fw_config.sh
}
