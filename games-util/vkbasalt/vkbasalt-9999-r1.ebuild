# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MULTILIB_COMPAT=( abi_x86_{32,64} )

inherit meson multilib-minimal

DESCRIPTION="A vulkan post processing layer"
HOMEPAGE="https://github.com/DadSchoorse/vkBasalt"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/DadSchoorse/vkBasalt.git"
	EGIT_SUBMODULES=()
	inherit git-r3
	SRC_URI=""
else
	SRC_URI="https://github.com/DadSchoorse/vkBasalt/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="-* ~amd64"
	S="${WORKDIR}/vkBasalt-${PV}"
fi

LICENSE="ZLIB"
SLOT="0"
IUSE="reshade-shaders"

RESTRICT="test"

RDEPEND="
	!<media-libs/vulkan-loader-1.1:=[${MULTILIB_USEDEP},layers]
	reshade-shaders? ( dev-util/reshade-shaders )
"

BDEPEND="
	!<dev-util/vulkan-headers-1.1
	dev-util/glslang
	>=dev-util/meson-0.49
	x11-libs/libX11[${MULTILIB_USEDEP}]
"

DEPEND="${RDEPEND}"

multilib_src_configure() {
	meson_src_configure
}

multilib_src_compile() {
	meson_src_compile
}

multilib_src_install() {
	meson_src_install
}

multilib_src_install_all() {
	dodoc "${S}/config/vkBasalt.conf"
}

pkg_postinst() {
	if use reshade-shaders; then
		einfo ""
		einfo "You have enabled the reshade-shaders useflag."
		einfo "Please read this on how to configure Reshade Fx shaders."
		einfo "<https://github.com/DadSchoorse/vkBasalt#reshade-fx-shaders>"
		einfo ""
		einfo "Do keep in mind that the dev-util/reshade-shaders package installs"
		einfo "the 'Textures' and 'Shaders' directories to '/usr/share/reshade-shaders'."
		einfo ""
	fi

	einfo ""
	einfo "An example config exists in: /usr/share/doc/${P}/vkBasalt.conf.bz2"
	einfo "You may install it to your ~/.config like so."
	einfo ""
	einfo "'$ mkdir -v ~/.config/vkBasalt'"
	einfo ""
	einfo "'$ bzcat /usr/share/doc/${P}/vkBasalt.conf.bz2 > ~/.config/vkBasalt/vkBasalt.conf'"
	einfo ""
}
