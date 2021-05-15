# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake flag-o-matic

DESCRIPTION="mcpelauncher-linux UI"
HOMEPAGE="https://github.com/minecraft-linux/mcpelauncher-ui-manifest"
EGIT_BRANCH="ng"
EGIT_REPO_URI="https://github.com/minecraft-linux/mcpelauncher-ui-manifest.git"

LICENSE="MIT GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-qt/qtwebengine:5
	dev-qt/qtdeclarative:5
	dev-qt/qtquickcontrols:5
	dev-qt/qtquickcontrols2:5
	dev-qt/qtsvg:5
	dev-libs/libzip
	dev-libs/protobuf"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	# Doesn't like LTO
	filter-flags -flto*

	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
	)

	cmake_src_configure
}
