# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )

inherit meson python-any-r1

VK_HEADERS_VER="1.3.239"

COMMIT="26757103dde8133bab432d172b8841df6bb48155"
DESCRIPTION="Simple framework for writing Vulkan layers (vulkan-headers ${VK_HEADERS_VER})"
HOMEPAGE="https://github.com/Joshua-Ashton/vkroots"
SRC_URI="
	https://github.com/Joshua-Ashton/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/KhronosGroup/Vulkan-Headers/raw/v${VK_HEADERS_VER}/registry/vk.xml \
		-> ${P}-vk-${VK_HEADERS_VER}.xml
"
KEYWORDS="~amd64"
LICENSE="Apache-2.0 MIT LGPL-2.1"
SLOT="0"

BDEPEND="
	${PYTHON_DEPS}
	dev-util/vulkan-headers
"

S="${WORKDIR}/${PN}-${COMMIT}"

src_compile() {
	"${PYTHON}" ./gen/make_vkroots --xml "${DISTDIR}/${P}-vk-${VK_HEADERS_VER}.xml" || die
}
