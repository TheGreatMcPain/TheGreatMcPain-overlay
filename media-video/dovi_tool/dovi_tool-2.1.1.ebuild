# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ab_glyph@0.2.23
	ab_glyph_rasterizer@0.1.8
	adler@1.0.2
	aho-corasick@1.1.3
	anstream@0.6.13
	anstyle@1.0.6
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anyhow@1.0.81
	assert_cmd@2.0.14
	assert_fs@1.1.1
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.5.0
	bitstream-io@2.2.0
	bitvec@1.0.1
	bitvec_helpers@3.1.3
	bstr@1.9.1
	bumpalo@3.15.4
	bytemuck@1.15.0
	byteorder@1.5.0
	cc@1.0.90
	cfg-if@1.0.0
	clap@4.5.3
	clap_builder@4.5.2
	clap_derive@4.5.3
	clap_lex@0.7.0
	color_quant@1.1.0
	colorchoice@1.0.0
	console@0.15.8
	const-cstr@0.3.0
	core-foundation@0.9.4
	core-foundation-sys@0.8.6
	core-graphics@0.22.3
	core-graphics-types@0.1.3
	core-text@19.2.0
	crc@3.0.1
	crc-catalog@2.4.0
	crc32fast@1.4.0
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	deranged@0.3.11
	difflib@0.4.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dlib@0.5.2
	doc-comment@0.3.3
	dwrote@0.11.0
	either@1.10.0
	encode_unicode@0.3.6
	equivalent@1.0.1
	errno@0.3.8
	fastrand@2.0.1
	fdeflate@0.3.4
	flate2@1.0.28
	float-cmp@0.9.0
	float-ord@0.2.0
	font-kit@0.11.0
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	freetype@0.7.1
	freetype-sys@0.19.0
	funty@2.0.0
	getrandom@0.2.12
	globset@0.4.14
	globwalk@0.9.1
	hashbrown@0.14.3
	hdr10plus@2.1.1
	heck@0.5.0
	hevc_parser@0.6.2
	ignore@0.4.22
	image@0.24.9
	indexmap@2.2.6
	indicatif@0.17.8
	instant@0.1.12
	itertools@0.12.1
	itoa@1.0.10
	jpeg-decoder@0.3.1
	js-sys@0.3.69
	lazy_static@1.4.0
	libc@0.2.153
	libloading@0.8.3
	libredox@0.0.1
	linux-raw-sys@0.4.13
	log@0.4.21
	madvr_parse@1.0.2
	memchr@2.7.1
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	nom@7.1.3
	normalize-line-endings@0.3.0
	num-conv@0.1.0
	num-traits@0.2.18
	num_threads@0.1.7
	number_prefix@0.4.0
	once_cell@1.19.0
	owned_ttf_parser@0.20.0
	pathfinder_geometry@0.5.1
	pathfinder_simd@0.5.2
	pkg-config@0.3.30
	plotters@0.3.5
	plotters-backend@0.3.5
	plotters-bitmap@0.3.3
	png@0.17.13
	portable-atomic@1.6.0
	powerfmt@0.2.0
	predicates@3.1.0
	predicates-core@1.0.6
	predicates-tree@1.0.9
	proc-macro2@1.0.79
	quote@1.0.35
	radium@0.7.0
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex@1.10.4
	regex-automata@0.4.6
	regex-syntax@0.8.2
	roxmltree@0.19.0
	rustc_version@0.4.0
	rustix@0.38.32
	rustversion@1.0.14
	ryu@1.0.17
	same-file@1.0.6
	semver@1.0.22
	serde@1.0.197
	serde_derive@1.0.197
	serde_json@1.0.114
	simd-adler32@0.3.7
	strsim@0.11.0
	syn@2.0.53
	tap@1.0.1
	tempfile@3.10.1
	terminal_size@0.3.0
	termtree@0.4.1
	thiserror@1.0.58
	thiserror-impl@1.0.58
	time@0.3.34
	time-core@0.1.2
	time-macros@0.2.17
	ttf-parser@0.17.1
	ttf-parser@0.20.0
	unicode-ident@1.0.12
	unicode-width@0.1.11
	utf8parse@0.2.1
	vergen@8.3.1
	wait-timeout@0.2.0
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.92
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-shared@0.2.92
	web-sys@0.3.69
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.4
	wio@0.2.2
	wyz@0.5.1
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
