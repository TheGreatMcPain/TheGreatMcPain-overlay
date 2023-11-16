# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ab_glyph@0.2.22
	ab_glyph_rasterizer@0.1.8
	adler@1.0.2
	aho-corasick@1.1.1
	anstream@0.6.4
	anstyle@1.0.4
	anstyle-parse@0.2.2
	anstyle-query@1.0.0
	anstyle-wincon@3.0.1
	anyhow@1.0.75
	assert_cmd@2.0.12
	assert_fs@1.0.13
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.4.0
	bitstream-io@1.7.0
	bitvec@1.0.1
	bitvec_helpers@3.1.2
	bstr@1.6.2
	bumpalo@3.14.0
	bytemuck@1.14.0
	byteorder@1.5.0
	cc@1.0.83
	cfg-if@1.0.0
	clap@4.4.6
	clap_builder@4.4.6
	clap_derive@4.4.2
	clap_lex@0.5.1
	cmake@0.1.50
	color_quant@1.1.0
	colorchoice@1.0.0
	console@0.15.7
	const-cstr@0.3.0
	core-foundation@0.9.3
	core-foundation-sys@0.8.4
	core-graphics@0.22.3
	core-graphics-types@0.1.2
	core-text@19.2.0
	crc@3.0.1
	crc-catalog@2.2.0
	crc32fast@1.3.2
	deranged@0.3.8
	difflib@0.4.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dlib@0.5.2
	doc-comment@0.3.3
	dwrote@0.11.0
	either@1.9.0
	encode_unicode@0.3.6
	equivalent@1.0.1
	errno@0.3.4
	errno-dragonfly@0.1.2
	fastrand@2.0.1
	fdeflate@0.3.0
	flate2@1.0.27
	float-cmp@0.9.0
	float-ord@0.2.0
	fnv@1.0.7
	font-kit@0.11.0
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	freetype@0.7.0
	freetype-sys@0.13.1
	funty@2.0.0
	getrandom@0.2.10
	globset@0.4.13
	globwalk@0.8.1
	hashbrown@0.14.1
	hdr10plus@2.1.0
	heck@0.4.1
	hevc_parser@0.6.1
	ignore@0.4.20
	image@0.24.7
	indexmap@2.0.2
	indicatif@0.17.7
	instant@0.1.12
	itertools@0.11.0
	itoa@1.0.9
	jpeg-decoder@0.3.0
	js-sys@0.3.64
	lazy_static@1.4.0
	libc@0.2.149
	libloading@0.8.1
	linux-raw-sys@0.4.8
	log@0.4.20
	madvr_parse@1.0.1
	memchr@2.6.4
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	nom@7.1.3
	normalize-line-endings@0.3.0
	num-integer@0.1.45
	num-rational@0.4.1
	num-traits@0.2.16
	num_threads@0.1.6
	number_prefix@0.4.0
	once_cell@1.18.0
	owned_ttf_parser@0.19.0
	pathfinder_geometry@0.5.1
	pathfinder_simd@0.5.2
	pkg-config@0.3.27
	plotters@0.3.5
	plotters-backend@0.3.5
	plotters-bitmap@0.3.3
	png@0.17.10
	portable-atomic@1.4.3
	predicates@3.0.4
	predicates-core@1.0.6
	predicates-tree@1.0.9
	proc-macro2@1.0.68
	quote@1.0.33
	radium@0.7.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	regex@1.9.6
	regex-automata@0.3.9
	regex-syntax@0.7.5
	roxmltree@0.18.1
	rustc_version@0.4.0
	rustix@0.38.17
	rustversion@1.0.14
	ryu@1.0.15
	same-file@1.0.6
	semver@1.0.19
	serde@1.0.188
	serde_derive@1.0.188
	serde_json@1.0.107
	simd-adler32@0.3.7
	strsim@0.10.0
	syn@2.0.38
	tap@1.0.1
	tempfile@3.8.0
	terminal_size@0.3.0
	termtree@0.4.1
	thiserror@1.0.49
	thiserror-impl@1.0.49
	thread_local@1.1.7
	time@0.3.29
	time-core@0.1.2
	time-macros@0.2.15
	ttf-parser@0.17.1
	ttf-parser@0.19.2
	unicode-ident@1.0.12
	unicode-width@0.1.11
	utf8parse@0.2.1
	vergen@8.2.5
	wait-timeout@0.2.0
	walkdir@2.4.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	web-sys@0.3.64
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	wio@0.2.2
	wyz@0.5.1
	xmlparser@0.13.6
	yeslogic-fontconfig-sys@3.2.0
"

inherit cargo git-r3

DESCRIPTION="CLI tool combining multiple utilities for working with Dolby Vision"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/quietvoid/dovi_tool"
SRC_URI="$(cargo_crate_uris)"
EGIT_COMMIT="${PV}"
EGIT_REPO_URI="https://github.com/quietvoid/dovi_tool.git"
RESTRICT="network-sandbox"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Boost-1.0 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	cargo_src_unpack
	git-r3_src_unpack

	# TODO: Figure out how to get these deps for offline mode.
	pushd "${S}"
	cargo -v --config "net.offline = false" fetch
	popd
}

src_install() {
	dobin "${S}/target/release/dovi_tool"
}
