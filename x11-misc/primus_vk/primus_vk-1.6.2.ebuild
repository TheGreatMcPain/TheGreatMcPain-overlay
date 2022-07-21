# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib-minimal

DESCRIPTION="Vulkan GPU-offloading layer"
HOMEPAGE="https://github.com/felixdoerre/primus_vk"
SRC_URI="https://github.com/felixdoerre/primus_vk/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	x11-misc/primus[${MULTILIB_USEDEP}]
	media-libs/vulkan-loader[${MULTILIB_USEDEP}]"
BDEPEND="media-libs/vulkan-layers[${MULTILIB_USEDEP}]"

src_prepare() {
	eapply_user
	multilib_copy_sources
}

multilib_src_compile() {
	emake libnv_vulkan_wrapper.so
	emake libprimus_vk.so
}

multilib_src_install() {
	newlib.so libnv_vulkan_wrapper.so libnv_vulkan_wrapper.so.1
	newlib.so libprimus_vk.so libprimus_vk.so.1
}

multilib_src_install_all() {
	insinto /usr/share/vulkan/implicit_layer.d
	doins primus_vk.json

	insinto /usr/share/vulkan/icd.d
	doins nv_vulkan_wrapper.json

	newbin pvkrun.in.sh pvkrun

	dodoc README.md
}
