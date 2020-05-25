# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7,8} )

inherit eutils python-any-r1 scons-utils flag-o-matic llvm desktop

DESCRIPTION="Multi-platform 2D and 3D game engine"
HOMEPAGE="http://godotengine.org"
LICENSE="MIT"
SLOT="0"

if [[ ${PV} = 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/godotengine/${PN}"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/godotengine/${PN}/archive/${PV}-stable.zip -> ${P}.zip"
	S="${WORKDIR}/${P}-stable"
	KEYWORDS="~amd64 ~x86"
fi

IUSE="
	+udev
	debug
	clang
	lto
	pulseaudio
"

DEPEND="
	>=app-arch/bzip2-1.0.6-r6
	>=app-arch/lz4-0_p120
	>=app-arch/xz-utils-5.0.8
	>=app-arch/zstd-1.4.4
	>=dev-libs/json-c-0.11-r1
	dev-libs/libpcre2[pcre32]
	>=media-libs/alsa-lib-1.0.28
	>=media-libs/flac-1.3.1-r1
	>=media-libs/libogg-1.3.1
	>=media-libs/libsndfile-1.0.25-r1
	media-libs/libvpx
	>=media-libs/mesa-10.2.8[gles2]
	media-libs/libwebp
	media-libs/opus
	media-libs/opusfile
	net-libs/enet:=
	>=net-libs/libasyncns-0.8-r3
	net-libs/mbedtls
	net-libs/miniupnpc
	>=sys-apps/attr-2.4.47-r1
	>=sys-apps/tcp-wrappers-7.6.22-r1
	>=sys-apps/util-linux-2.25.2-r2
	!clang? ( >=sys-devel/gcc-4.6.4:*[cxx] )
	>=sys-libs/gdbm-1.11
	>=sys-libs/glibc-2.20-r2
	>=sys-libs/libcap-2.22-r2
	>=sys-libs/zlib-1.2.8-r1
	>=x11-libs/libX11-1.6.2
	>=x11-libs/libXcursor-1.1.14
	>=x11-libs/libXinerama-1.1.3
	>=media-libs/freetype-2.5.3-r1:2
	clang? ( >=sys-devel/llvm-3.6.0:= )
	>=media-libs/libpng-1.6.16:0=
	pulseaudio? ( >=media-sound/pulseaudio-5.0-r7 )
	media-libs/libtheora
	udev? ( virtual/udev )
	virtual/glu
	>=media-libs/libvorbis-1.3.4
"

RDEPEND="${DEPEND}"

pkg_setup() {
	llvm_pkg_setup
	python-any-r1_pkg_setup
}

src_configure() {
	if use clang && ! tc-is-clang; then
		einfo "Enforcing the use of clang due to USE=clang ..."
		CC=${CHOST}-clang
		CXX=${CHOST}-clang++
	fi

	strip-unsupported-flags

	MYSCONS=(
		CC="$(tc-getCC)"
		CXX="$(tc-getCXX)"
		builtin_enet=no
		builtin_freetype=no
		builtin_libogg=no
		builtin_libpng=no
		builtin_libtheora=no
		builtin_libvorbis=no
		builtin_libvpx=no
		builtin_libwebp=no
		builtin_mbedtls=no
		builtin_miniupnpc=no
		builtin_opus=no
		builtin_pcre2=no
		builtin_zlib=no
		builtin_zstd=no
		module_enet_enabled=yes
		module_freetype_enabled=yes
		module_mbedtls_enabled=yes
		module_opus_enabled=yes
		module_theora_enabled=yes
		module_vorbis_enabled=yes
		module_webp_enabled=yes
		platform=x11
		pulseaudio=$(usex pulseaudio)
		tools=yes
		progress=false
		verbose=true
		udev=$(usex udev)
		use_llvm=$(usex clang)
		use_lld=$(usex clang)
		use_lto=$(usex lto)
		target=$(usex debug debug release_debug)
	)
}

src_compile() {
	escons "${MYSCONS[@]}"
}

src_install() {
	newicon icon.svg ${PN}.svg
	dobin bin/godot.*
	if [[ "${ARCH}" == "amd64" ]]; then
		if use clang; then
			make_desktop_entry godot.x11.tools.64.llvm Godot
			with_desktop_entry=1
		else
			make_desktop_entry godot.x11.tools.64 Godot
			with_desktop_entry=1
		fi
	fi

	if [[ "${ARCH}" == "x86" ]]; then
		if use clang; then
			make_desktop_entry godot.x11.tools.32.llvm Godot
			with_desktop_entry=1
		else
			make_desktop_entry godot.x11.tools.32 Godot
			with_desktop_entry=1
		fi
	fi

	if ! [[ "${with_desktop_entry}" == "1" ]]; then
		elog "Couldn't detect running architecture to create a desktop file."
	fi
}
