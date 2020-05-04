# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit meson distutils-r1 multilib-minimal flag-o-matic

DESCRIPTION="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more."
HOMEPAGE="https://github.com/flightlessmango/MangoHud"

IMGUI_COMMIT="96a2c4619b0c8009f684556683b2e1b6408bb0dc"
if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/flightlessmango/MangoHud.git"
	EGIT_SUBMODULES=("-*")
	SRC_URI="https://github.com/flightlessmango/imgui/archive/${IMGUI_COMMIT}.tar.gz"
else
	SRC_URI="https://github.com/flightlessmango/MangoHud/archive/v${PV}.tar.gz \
		https://github.com/flightlessmango/imgui/archive/${IMGUI_COMMIT}.tar.gz"
	KEYWORDS="-* ~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="video_cards_nvidia"

DEPEND="
	dev-python/mako[${PYTHON_USEDEP}]
	dev-util/glslang
	dev-util/vulkan-headers
	media-libs/vulkan-loader[${MULTILIB_USEDEP}]
	media-libs/libglvnd[$MULTILIB_USEDEP]
	video_cards_nvidia? (
		x11-drivers/nvidia-drivers[${MULTILIB_USEDEP},static-libs]
	)
"

RDEPEND="${DEPEND}"

if ! [[ ${PV} == "9999" ]]; then
	S="${WORKDIR}"/"MangoHud-${PV}"
fi

src_unpack() {
	default

	if [[ ${PV} == "9999" ]]; then
		git-r3_src_unpack
	fi

	mv "${WORKDIR}"/imgui-"${IMGUI_COMMIT}"/* \
		"${S}/modules/ImGui/src/"
}

multilib_src_configure() {
	local emesonargs=(
		-Dappend_libdir_mangohud=false
		-Duse_system_vulkan=enabled
		-Dinclude_doc=false
		-Dwith_xnvctrl=$(usex video_cards_nvidia enabled disabled)
	)
	meson_src_configure
}

multilib_src_compile() {
	meson_src_compile
}

multilib_src_install() {
	meson_src_install
}

multilib_src_install_all() {
	dodoc "${S}/bin/MangoHud.conf"

	einstalldocs
}
