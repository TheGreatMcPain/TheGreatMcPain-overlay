# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake toolchain-funcs flag-o-matic

DESCRIPTION="Minecraft Bedrock Launcher for Linux (unofficial)"
HOMEPAGE="https://github.com/minecraft-linux/mcpelauncher-manifest"
EGIT_REPO_URI="https://github.com/minecraft-linux/mcpelauncher-manifest.git"

if ver_test "${PV}" -eq 9999; then
	EGIT_BRANCH="qt6"
else
	EGIT_COMMIT="v${PV}-qt6"
fi

LICENSE="MIT GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="
	net-misc/curl
	sys-libs/zlib
	media-libs/libpng
	media-libs/libsdl3
	dev-libs/libevdev
	x11-libs/libXi
	>=dev-cpp/nlohmann_json-3.12.0
	dev-qt/qtwebengine:6
	dev-qt/qtdeclarative:6
	dev-qt/qtbase:6
	dev-libs/libuv
	llvm-core/clang:*
	llvm-core/llvm:*"
RDEPEND="${DEPEND}
	games-util/mcpelauncher-ui-qt"

# Prevent downloading nlohmann_json sources
PATCHES="
	${FILESDIR}/mutex-shim_mcpelauncher-linker.patch
	${FILESDIR}/0001-Use-system-nlohmann_json.patch
	${FILESDIR}/0001-Make-compatible-with-nlohmann_json-3.12.0.patch
"

src_configure() {
	# Force clang (pulled from www-client/firefox)
	# Some of the code comes from Android which doesn't like GCC
	elog "Forcing clang"
	AR=llvm-ar
	CC=${CHOST}-clang
	CXX=${CHOST}-clang++
	NM=llvm-nm
	RANLIB=llvm-ranlib
	append-cxxflags "-DNDEBUG"
	append-ldflags "-fuse-ld=lld"

	strip-unsupported-flags
	append-flags "-D_FORTIFY_SOURCE=0"

	# Ensure we use correct toolchain
	export HOST_CC="$(tc-getBUILD_CC)"
	export HOST_CXX="$(tc-getBUILD_CXX)"
	tc-export CC CXX LD AR NM OBJDUMP RANLIB PKG_CONFIG

	local mycmakeargs=(
		-DUSE_OWN_CURL=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DENABLE_DEV_PATHS=OFF
		-DGAMEWINDOW_SYSTEM=SDL3
		-DSDL3_VENDORED=OFF
		-Wno-dev
	)

	cmake_src_configure
}
