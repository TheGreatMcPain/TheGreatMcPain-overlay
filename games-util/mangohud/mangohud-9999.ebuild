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
	SRC_URI=""
else
	SRC_URI="https://github.com/flightlessmango/MangoHud/releases/download/v${PV}/MangoHud-v${PV}-Source.tar.gz -> ${P}.tar.gz"
	KEYWORDS="-* ~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="xnvctrl"

DEPEND="
	dev-python/mako[${PYTHON_USEDEP}]
	dev-util/glslang
	dev-util/vulkan-headers
	media-libs/vulkan-loader[${MULTILIB_USEDEP}]
	media-libs/libglvnd[$MULTILIB_USEDEP]
	xnvctrl? (
		x11-drivers/nvidia-drivers[${MULTILIB_USEDEP},static-libs]
	)
"

RDEPEND="${DEPEND}"

src_unpack() {
	if [[ -n ${A} ]]; then
		mkdir "${P}"
		cd "${P}"
		unpack ${A}
	fi

	if [[ ${PV} == "9999" ]]; then
		git-r3_src_unpack
	fi
}

multilib_src_configure() {
	local emesonargs=(
		-Dappend_libdir_mangohud=false
		-Duse_system_vulkan=enabled
		-Dinclude_doc=false
		-Dwith_xnvctrl=$(usex xnvctrl enabled disabled)
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
