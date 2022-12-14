# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit meson distutils-r1 multilib-minimal flag-o-matic

DESCRIPTION="A Vulkan/OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more."
HOMEPAGE="https://github.com/flightlessmango/MangoHud"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/flightlessmango/MangoHud.git"
	RESTRICT="network-sandbox" # for imgui subproject
	KEYWORDS=""
else
	SRC_URI="
		https://github.com/flightlessmango/MangoHud/releases/download/v${PV}/MangoHud-v${PV}-Source.tar.xz -> ${P}.tar.xz
	"
	KEYWORDS="-* ~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+dbus debug tools +X xnvctrl wayland video_cards_nvidia"

REQUIRED_USE="
	xnvctrl? ( video_cards_nvidia )"

BDEPEND="dev-python/mako[${PYTHON_USEDEP}]"

DEPEND="
	dev-util/glslang
	>=dev-util/vulkan-headers-1.2
	media-libs/vulkan-loader[${MULTILIB_USEDEP}]
	dev-libs/spdlog[${MULTILIB_USEDEP}]
	media-libs/libglvnd[${MULTILIB_USEDEP}]
	dbus? ( sys-apps/dbus[${MULTILIB_USEDEP}] )
	tools? (
		media-libs/glfw
	)
	X? ( x11-libs/libX11[${MULTILIB_USEDEP}] )
	video_cards_nvidia? (
		x11-drivers/nvidia-drivers[${MULTILIB_USEDEP}]
		xnvctrl? ( x11-drivers/nvidia-drivers[static-libs] )
	)
	wayland? ( dev-libs/wayland[${MULTILIB_USEDEP}] )"

RDEPEND="${DEPEND}"

if ! [[ ${PV} == "9999" ]]; then
	S="${WORKDIR}"/MangoHud-v${PV}
fi

src_unpack() {
	if [[ ${PV} == "9999" ]]; then
		git-r3_src_unpack
	fi
	default
}

multilib_src_configure() {
	local emesonargs=(
		-Dappend_libdir_mangohud=false
		-Duse_system_vulkan=enabled
		-Duse_system_spdlog=enabled
		-Dinclude_doc=false
		-Dwith_nvml=$(usex video_cards_nvidia enabled disabled)
		-Dwith_xnvctrl=$(usex xnvctrl enabled disabled)
		-Dwith_x11=$(usex X enabled disabled)
		-Dwith_wayland=$(usex wayland enabled disabled)
		-Dwith_dbus=$(usex dbus enabled disabled)
	)
	if [[ ${PV} == "9999" ]]; then
		emesonargs+=(
			--wrap-mode default
		)
	fi
	if multilib_is_native_abi; then
		emesonargs+=(
			-Dmangoapp=$(usex tools true false)
			-Dmangohudctl=$(usex tools true false)
			-Dmangoapp_layer=$(usex tools true false)
		)
	fi
	meson_src_configure
}

multilib_src_compile() {
	meson_src_compile
}

multilib_src_install() {
	meson_src_install
}

multilib_src_install_all() {
	dodoc "${S}/data/MangoHud.conf"
	doman "${S}/data/mangohud.1"
	if use tools; then
		doman "${S}/data/mangoapp.1"
	fi

	einstalldocs
}

pkg_postinst() {
	if ! use xnvctrl; then
		einfo ""
		einfo "If mangohud can't get GPU load, or other GPU information,"
		einfo "and you have an older Nvidia device."
		einfo ""
		einfo "Try enabling the 'xnvctrl' useflag."
		einfo ""
	fi
}
