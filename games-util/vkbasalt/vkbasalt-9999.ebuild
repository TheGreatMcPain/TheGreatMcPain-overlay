# Copyright 1999-2020 Gentoo Authors
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

RESTRICT="test"

RDEPEND="!<media-libs/vulkan-loader-1.1:=[${MULTILIB_USEDEP},layers]
	dev-util/reshade-shaders"

BDEPEND="!<dev-util/vulkan-headers-1.1
	dev-util/glslang
	>=dev-util/reshade-fx-4.5.4[${MULTILIB_USEDEP}]
	>=dev-util/meson-0.49
	x11-libs/libX11[${MULTILIB_USEDEP}]"

DEPEND="${RDEPEND}"

src_prepare() {
	# meson build
	cp "${FILESDIR}/vkbasalt-0.3.1-meson.build" "${S}"/meson.build

	# Vulkan explicit layer file
	cp "${FILESDIR}/VkLayer_vkBasalt.json" "${S}"/config/

	default

	# Ignore Debug messages
	for sfile in "${S}"/src/*.cpp; do
		sed -E \
			-e 's/(^ *std::cout.*$)/#ifdef LAYER_DEBUG\n\1\n#endif/g' \
			-i "${sfile}"
	done

	# Fix ReShadeFX path
	for sfile in "${S}"/src/*; do
		sed -E \
			-e 's#../reshade/source/#reshade/#g' \
			-i "${sfile}"
	done

	# TMP Hack: support reshadeEffectsPath= option
	for sfile in "${S}"/src/*; do
		sed -E \
			-e 's#\(pConfig->getOption\(effectName\)\)#(std::filesystem::path(pConfig->getOption("reshadeEffectsPath", "")) /= pConfig->getOption(effectName))#g' \
			-i "${sfile}"
	done
}

multilib_src_configure() {
	meson_src_configure
}

multilib_src_compile() {
	meson_src_compile
}

multilib_src_install() {
	meson_src_install
}
