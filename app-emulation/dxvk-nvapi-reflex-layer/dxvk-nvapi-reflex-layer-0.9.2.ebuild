# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MULTILIB_COMPAT=( abi_x86_{32,64} )
inherit flag-o-matic meson-multilib

DESCRIPTION="Nvidia Reflex Vulkan Layer for DXVK-NVAPI"
HOMEPAGE="https://github.com/jp7677/dxvk-nvapi"
VULKAN_HEADERS_HASH="2cd90f9d20df57eac214c148f3aed885372ddcfe"
NVAPI_HASH="9b181ea572f680327fe01a14a0f1f41c78034104"
VKROOTS_HASH="ee76e620798612c52fb8dcc32a1058a0a3538930"
SRC_URI="
	https://github.com/jp7677/dxvk-nvapi/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.tar.gz
	https://github.com/KhronosGroup/Vulkan-Headers/archive/${VULKAN_HEADERS_HASH}.tar.gz
		-> ${P}-vulkan-headers.tar.gz
	https://github.com/NVIDIA/nvapi/archive/${NVAPI_HASH}.tar.gz
		-> ${P}-nvapi.tar.gz
	https://github.com/misyltoad/vkroots/archive/${VKROOTS_HASH}.tar.gz
		-> ${P}-vkroots.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="+abi_x86_32 debug"

BDEPEND="
	dev-util/glslang"

OLD_S="${WORKDIR}/dxvk-nvapi-${PV}"
S="${WORKDIR}/dxvk-nvapi-${PV}/layer"

src_prepare() {
	if [[ ${PV} != "9999" ]]; then
		rm -r "${OLD_S}/external/Vulkan-Headers" || die
		mv "${WORKDIR}/Vulkan-Headers-${VULKAN_HEADERS_HASH}" "${OLD_S}/external/Vulkan-Headers" || die
		rm -r "${OLD_S}/external/nvapi" || die
		mv "${WORKDIR}/nvapi-${NVAPI_HASH}" "${OLD_S}/external/nvapi" || die
		rm -r "${OLD_S}/external/vkroots" || die
		mv "${WORKDIR}/vkroots-${VKROOTS_HASH}" "${OLD_S}/external/vkroots" || die
	fi

	default
}

multilib_src_configure() {
	local emesonargs=(
		-Dabsolute_library_path=false
	)

	meson_src_configure
}

multilib_src_install_all() {
	dodoc "${OLD_S}/README.md"
}

pkg_postinst() {
	elog "For usage and instructions see 'Vulkan Reflex layer' section of..."
	elog
	elog "'${EROOT}/usr/share/doc/${PF}/README.md'"
}
