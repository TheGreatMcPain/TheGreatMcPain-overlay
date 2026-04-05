# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ab_glyph@0.2.32
	ab_glyph_rasterizer@0.1.10
	adler2@2.0.1
	aho-corasick@1.1.4
	anstream@0.6.21
	anstyle-parse@0.2.7
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.13
	anyhow@1.0.100
	assert_cmd@2.1.1
	assert_fs@1.1.3
	autocfg@1.5.0
	bitflags@1.3.2
	bitflags@2.10.0
	bitstream-io@4.9.0
	bitvec_helpers@4.0.1
	bstr@1.12.1
	bumpalo@3.19.1
	bytemuck@1.24.0
	byteorder@1.5.0
	cc@1.2.51
	cfg-if@1.0.4
	clap@4.5.53
	clap_builder@4.5.53
	clap_derive@4.5.49
	clap_lex@0.7.6
	color_quant@1.1.0
	colorchoice@1.0.4
	console@0.16.2
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.23.2
	core-text@20.1.0
	core2@0.4.0
	crc32fast@1.5.0
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	difflib@0.4.0
	dirs-sys@0.5.0
	dirs@6.0.0
	dlib@0.5.2
	doc-comment@0.3.4
	dwrote@0.11.5
	encode_unicode@1.0.0
	equivalent@1.0.2
	errno@0.3.14
	fastrand@2.3.0
	fdeflate@0.3.7
	find-msvc-tools@0.1.6
	flate2@1.1.5
	float-cmp@0.10.0
	float-ord@0.3.2
	font-kit@0.14.3
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	freetype-sys@0.20.1
	getrandom@0.2.16
	getrandom@0.3.4
	globset@0.4.18
	globwalk@0.9.1
	hashbrown@0.16.1
	heck@0.5.0
	hevc_parser@0.6.10
	ignore@0.4.25
	image@0.24.9
	indexmap@2.12.1
	indicatif@0.18.3
	is_terminal_polyfill@1.70.2
	itoa@1.0.17
	jpeg-decoder@0.3.2
	js-sys@0.3.83
	lazy_static@1.5.0
	libc@0.2.178
	libloading@0.8.9
	libredox@0.1.12
	linux-raw-sys@0.11.0
	log@0.4.29
	matroska-demuxer@0.7.0
	memchr@2.7.6
	miniz_oxide@0.8.9
	nom@8.0.0
	normalize-line-endings@0.3.0
	num-traits@0.2.19
	once_cell@1.21.3
	once_cell_polyfill@1.70.2
	option-ext@0.2.0
	owned_ttf_parser@0.25.1
	pathfinder_geometry@0.5.1
	pathfinder_simd@0.5.5
	pkg-config@0.3.32
	plotters-backend@0.3.7
	plotters-bitmap@0.3.7
	plotters@0.3.7
	png@0.17.16
	portable-atomic@1.12.0
	predicates-core@1.0.9
	predicates-tree@1.0.12
	predicates@3.1.3
	proc-macro2@1.0.103
	quote@1.0.42
	r-efi@5.3.0
	redox_users@0.5.2
	regex-automata@0.4.13
	regex-lite@0.1.8
	regex-syntax@0.8.8
	regex@1.12.2
	rustc_version@0.4.1
	rustix@1.1.3
	rustversion@1.0.22
	same-file@1.0.6
	semver@1.0.27
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.148
	shlex@1.3.0
	simd-adler32@0.3.8
	strsim@0.11.1
	syn@2.0.111
	tempfile@3.24.0
	terminal_size@0.4.3
	termtree@0.5.1
	thiserror-impl@2.0.17
	thiserror@2.0.17
	ttf-parser@0.20.0
	ttf-parser@0.25.1
	unicode-ident@1.0.22
	unicode-width@0.2.2
	unit-prefix@0.5.2
	utf8parse@0.2.2
	wait-timeout@0.2.1
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.1+wasi-0.2.4
	wasm-bindgen-macro-support@0.2.106
	wasm-bindgen-macro@0.2.106
	wasm-bindgen-shared@0.2.106
	wasm-bindgen@0.2.106
	web-sys@0.3.83
	web-time@1.1.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-link@0.2.1
	windows-sys@0.60.2
	windows-sys@0.61.2
	windows-targets@0.53.5
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.53.1
	wio@0.2.2
	wit-bindgen@0.46.0
	yeslogic-fontconfig-sys@6.0.0
	zmij@1.0.0
"

RUST_MIN_VER=1.85.0
RUST_MULTILIB=1
inherit cargo edo multilib-minimal rust-toolchain

DESCRIPTION="Dolby Vision metadata parsing and writing"
HOMEPAGE="https://github.com/quietvoid/hdr10plus_tool/"
SRC_URI="
	https://github.com/quietvoid/hdr10plus_tool/archive/refs/tags/${P}.tar.gz
	${CARGO_CRATE_URIS}
"
LICENSE="MIT"
LICENSE+=" Apache-2.0 Unicode-3.0" # crates
SLOT="0/$(ver_cut 1)"
KEYWORDS="amd64"

BDEPEND="
	dev-util/cargo-c
"

QA_FLAGS_IGNORED="usr/lib.*/${PN}.*"

src_prepare() {
	# Kinda hacky, oh well
	mkdir -v "${S}"
	mv -v "${WORKDIR}/hdr10plus_tool-${P}"/hdr10plus/* "${S}"

	default

	multilib_copy_sources
}

src_configure() {
	multilib_src_configure() {
		local -n cargoargs=${PN}_CARGOARGS_${ABI}

		cargoargs=(
			--prefix="${EPREFIX}/usr"
			--libdir="${EPREFIX}/usr/$(get_libdir)"
			--library-type=cdylib
			--target="$(rust_abi)"
			$(usex debug --profile=dev --release)
		)
	}

	multilib-minimal_src_configure
}

src_compile() {
	multilib_src_compile() {
		local -n cargoargs=${PN}_CARGOARGS_${ABI}

		edo cargo cbuild "${cargoargs[@]}"
	}

	multilib-minimal_src_compile
}

src_test() { :; } # no tests, and must not run cargo_src_test

src_install() {
	multilib_src_install() {
		local -n cargoargs=${PN}_CARGOARGS_${ABI}

		edo cargo cinstall --destdir="${D}" "${cargoargs[@]}"
	}

	multilib-minimal_src_install
}
