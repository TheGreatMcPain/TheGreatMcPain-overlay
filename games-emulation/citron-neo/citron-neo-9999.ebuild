# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg toolchain-funcs optfeature

DESCRIPTION="Nintendo Switch Emulator (citron fork)"
HOMEPAGE="https://github.com/citron-neo/emulator"

inherit git-r3
EGIT_REPO_URI="https://github.com/citron-neo/emulator.git"

LICENSE="GPL-3+"
SLOT="0"
IUSE="camera +cubeb discord llvm +qt6 room test +usb web-applet web-service"
REQUIRED_USE="
	!qt6? ( !camera !discord !web-applet )
	web-service? ( || ( qt6 room ) )
"

RESTRICT="!test? ( test )"

RDEPEND="
	app-arch/lz4
	app-arch/zstd
	dev-cpp/cpp-httplib:=[ssl]
	dev-libs/libfmt:=
	dev-libs/openssl:=
	dev-util/spirv-tools
	games-util/gamemode
	media-gfx/renderdoc
	media-libs/libsdl3[udev]
	media-libs/libva
	media-libs/opus
	media-libs/openal
	media-video/ffmpeg
	net-libs/enet
	net-libs/mbedtls:3
	virtual/zlib:=

	camera? ( dev-qt/qtmultimedia:6 )
	cubeb? ( media-libs/cubeb )
	qt6? (
		dev-libs/quazip[qt6(+)]
		dev-qt/qtbase:6[concurrent,dbus,gui,widgets]
		dev-qt/qtcharts:6
	)
	usb? ( dev-libs/libusb )
	web-applet? ( dev-qt/qtwebengine:6[widgets] )
	web-service? ( dev-cpp/cpp-httplib:=[ssl] )
	llvm? ( llvm-core/llvm )
"
DEPEND="
	${RDEPEND}
	dev-cpp/nlohmann_json
	dev-cpp/simpleini
	dev-libs/boost:=[context]
	dev-util/spirv-headers
	dev-util/vulkan-headers
	dev-util/vulkan-utility-libraries

	amd64? ( dev-libs/xbyak )
	x86? ( dev-libs/xbyak )
"
BDEPEND="
	app-arch/unzip
	dev-util/glslang
	virtual/pkgconfig

	test? ( dev-cpp/catch )
"

## TODO: Find out why some of these won't work if removed from 'externals'
# [directory]=license
declare -A KEEP_BUNDLED=(
	# Generated or copied files for internal usage
	[bc_decoder]=MPL-2.0
	[cmake-modules]=LGPL-3+
	[demangle]=Apache-2.0-with-LLVM-exceptions
	[FidelityFX-FSR]=MIT
	[glad]=GPL-2+
	[nx_tzdb]="GPL-2+"
	[stb]="MIT public-domain"
	[tz]=BSD-2
	[xbyak]=BSD
	[unordered_dense]=MIT
	[dynarmic]=GPL-3
	[mbedtls]=Apache-2.0
	[SDL]=ZLIB
	[Vulkan-Headers]="Apache-2.0 MIT"
	[Vulkan-Utility-Libraries]=Apache-2.0
	[simpleini]=MIT
	[VulkanMemoryAllocator]=MIT
	[SPIRV-Headers]=MIT
	[sirit]=BSD
	[discord-rpc]=MIT
	[cpp-jwt]=MIT
	[oaknut]=MIT

	# Configuration for the system library
	[libusb]=GPL-3+
)

add_bundled_licenses() {
	for license in "${KEEP_BUNDLED[@]}"; do
		if [[ -n "$license" ]]; then
			LICENSE+=" ${license}"
		fi
	done
}
add_bundled_licenses

src_unpack() {
	if [[ "${PV}" == 9999 ]]; then
		git-r3_src_unpack
	else
		default
	fi
}

src_prepare() {
	local s remove=()
	for s in externals/*; do
		[[ -f ${s} ]] && continue
		if ! has "${s#externals/}" "${!KEEP_BUNDLED[@]}"; then
			remove+=( "${s}" )
		fi
	done

	if [[ -n "${remove}" ]]; then
		einfo "removing sources: ${remove[*]}"
		rm -r "${remove[@]}" || die
	fi

	cmake_src_prepare
}

src_configure() {
	if [[ "${PV}" == 9999 ]]; then
		citron_ver="$(git rev-parse --short=10 HEAD)-9999"
	else
		citron_ver="v${PV/_/-}"
	fi

	if tc-is-gcc; then
		citron_comp_id="GCC $(gcc-fullversion)"
	elif tc-is-clang; then
		citron_comp_id="Clang $(clang-fullversion)"
	else
		citron_comp_id="$(tc-getcc)"
	fi

	local mycmakeargs=(
		-DCITRON_USE_BUNDLED_FFMPEG=OFF
		-DCITRON_USE_BUNDLED_QT=OFF
		-DCITRON_USE_BUNDLED_VCPKG=OFF
		-DCITRON_CHECK_SUBMODULES=OFF
		-DTITLE_BAR_FORMAT_IDLE="Citron-neo | ${citron_ver} | ${citron_comp_id}"
		-DTITLE_BAR_FORMAT_RUNNING="Citron-neo | ${citron_ver} | ${citron_comp_id}"
		-DCITRON_USE_FASTER_LD=OFF

		-DDYNARMIC_USE_LLVM=$(usex llvm)

		-DBUILD_TESTING=$(usex test)
		-DENABLE_CUBEB=$(usex cubeb)
		-DENABLE_LIBUSB=$(usex usb)
		-DENABLE_QT=$(usex qt6)
		-DENABLE_WEB_SERVICE=$(usex web-service)
		-DUSE_DISCORD_PRESENCE=$(usex discord)
		-DCITRON_USE_QT_MULTIMEDIA=$(usex camera)
		-DCITRON_USE_QT_WEB_ENGINE=$(usex web-applet)

		-DCITRON_ROOM=$(usex room)

		-Wno-dev
	)

	cmake_src_configure
}

#src_test() {
#	cd "${BUILD_DIR}" || die
#
#	./bin/dynarmic_tests || die
#
#	# See https://git.eden-emu.dev/eden-emu/eden/issues/126
#	./bin/tests "~Fibers::InterExchange" "~RingBuffer: Threaded Test" || die
#}

pkg_postinst() {
	xdg_pkg_postinst

	optfeature_header "SDL requires HIDRAW access for many controller gyroscopes to work."
	optfeature "HIDRAW support" games-util/game-device-udev-rules
}
