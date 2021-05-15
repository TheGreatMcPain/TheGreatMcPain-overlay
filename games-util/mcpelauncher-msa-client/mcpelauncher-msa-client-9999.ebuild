# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake

DESCRIPTION="Microsoft Account authentication daemon for mcpelauncher"
HOMEPAGE="https://github.com/minecraft-linux/msa-manifest"
SRC_URI="https://github.com/nlohmann/json/releases/download/v3.7.3/include.zip -> nlohmann_json-3.7.3.zip"
EGIT_REPO_URI="https://github.com/minecraft-linux/msa-manifest.git"

LICENSE="MIT GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+qt5"

DEPEND="net-misc/curl
	dev-libs/openssl
	dev-cpp/nlohmann_json
	qt5? ( dev-qt/qtwebengine:5 )"
RDEPEND="${DEPEND}"
BDEPEND=""

# Prevent downloading nlohmann_json sources
PATCHES="${FILESDIR}/system-nlohmann_json.patch"

src_unpack() {
	unpack "${DISTDIR}/nlohmann_json-3.7.3.zip"
	git-r3_src_unpack
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DUSE_EXTERNAL_JSON=YES # Workaround for nlohmann_json
		-DJSON_SOURCES="${WORKDIR}" # Workaround for nlohmann_json
		-DENABLE_MSA_QT_UI=$(usex qt5 ON OFF)
	)

	cmake_src_configure
}
