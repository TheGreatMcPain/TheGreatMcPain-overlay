# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# You will need games-util/steam-client-meta from the steam-overlay for this to work

# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	tracing-core-0.1.23
	itertools-0.9.0
	hashbrown-0.8.2
	pango-sys-0.15.10
	gdk-sys-0.10.0
	wasm-bindgen-0.2.79
	exec-0.3.1
	pango-0.15.10
	which-4.2.5
	core-foundation-sys-0.7.0
	android_logger-0.10.1
	serde-1.0.136
	rand_chacha-0.3.1
	ahash-0.3.8
	minimal-lexical-0.2.1
	reqwest-0.11.10
	core-foundation-0.9.3
	hyper-tls-0.5.0
	which-3.1.1
	unic-bidi-0.9.0
	wayland-cursor-0.29.4
	thiserror-impl-1.0.30
	winapi-i686-pc-windows-gnu-0.4.0
	core-text-19.2.0
	dlib-0.5.0
	jni-sys-0.3.0
	toml-0.5.8
	windows_i686_msvc-0.32.0
	malloc_buf-0.0.6
	minimp3-sys-0.3.2
	bitflags-1.3.2
	instant-0.1.12
	cfg-if-1.0.0
	memmap2-0.3.1
	coreaudio-sys-0.2.9
	hermit-abi-0.1.19
	strum_macros-0.18.0
	indexmap-1.8.0
	wgpu-types-0.12.0
	quanta-0.4.1
	semver-0.11.0
	crossbeam-channel-0.5.4
	bumpalo-3.9.1
	heck-0.3.3
	piet-0.3.1
	futures-task-0.3.21
	either-1.6.1
	spirv-0.2.0+1.5.4
	dispatch-0.2.0
	vcpkg-0.2.15
	pkg-config-0.3.24
	cocoa-0.24.0
	ntapi-0.3.7
	gobject-sys-0.15.10
	sha-1-0.10.0
	ash-0.34.0+1.2.203
	windows_x86_64_msvc-0.32.0
	aho-corasick-0.7.18
	object-0.27.1
	stdweb-0.1.3
	cexpr-0.4.0
	inplace_it-0.3.3
	rustc-demangle-0.1.21
	stdweb-0.4.20
	bit-vec-0.6.3
	wayland-sys-0.29.4
	glib-sys-0.15.10
	wio-0.2.2
	arrayvec-0.7.2
	proc-macro-hack-0.5.19
	gpu-descriptor-types-0.1.1
	winres-0.1.12
	kurbo-0.7.1
	scoped-tls-1.0.0
	pango-sys-0.10.0
	itoa-1.0.1
	parking_lot_core-0.8.5
	gtk3-macros-0.15.4
	tinystr-0.3.4
	oboe-0.4.5
	windows-sys-0.32.0
	alsa-sys-0.3.1
	naga-0.8.5
	native-tls-0.2.8
	tokio-tungstenite-0.17.1
	form_urlencoded-1.0.1
	piet-direct2d-0.3.0
	semver-1.0.6
	remove_dir_all-0.5.3
	http-body-0.4.4
	semver-parser-0.7.0
	num-integer-0.1.44
	strum-0.18.0
	cpal-0.13.5
	glib-sys-0.10.1
	darling_core-0.13.1
	num-derive-0.3.3
	cexpr-0.6.0
	libloading-0.7.3
	sha1_smol-1.0.0
	gtk-sys-0.10.0
	cfg_aliases-0.1.1
	dwrote-0.11.0
	crossbeam-epoch-0.9.8
	chunked_transfer-1.4.0
	gdk-pixbuf-0.15.10
	gio-sys-0.15.10
	once_cell-1.10.0
	vec_map-0.8.2
	addr2line-0.17.0
	humantime-2.1.0
	libloading-0.6.7
	num-traits-0.2.14
	single-instance-0.3.3
	fs_extra-1.2.0
	cc-1.0.73
	redox_syscall-0.2.11
	mime-0.3.16
	parking_lot-0.11.2
	pin-project-lite-0.2.8
	gdk-pixbuf-sys-0.15.10
	rayon-core-1.9.1
	num_enum_derive-0.5.7
	futures-core-0.3.21
	try-lock-0.2.3
	rand-0.8.5
	os_str_bytes-6.0.0
	spin-0.5.2
	adler-1.0.2
	claxon-0.4.3
	hyper-0.14.18
	ndk-0.6.0
	wasm-bindgen-futures-0.4.29
	wayland-commons-0.29.4
	piet-common-0.3.2
	gdk-0.13.2
	errno-0.2.8
	minimp3-0.5.1
	security-framework-2.6.1
	time-macros-impl-0.1.2
	simple_logger-1.16.0
	druid-shell-0.7.0
	bindgen-0.59.2
	jni-0.19.0
	backtrace-0.3.64
	xcursor-0.3.4
	tracing-0.1.32
	wayland-scanner-0.29.4
	unic-common-0.9.0
	stdweb-derive-0.5.3
	log-0.4.16
	wasi-0.10.2+wasi-snapshot-preview1
	walkdir-2.3.2
	semver-parser-0.10.2
	system-deps-6.0.2
	fern-0.6.0
	piet-cairo-0.3.0
	webpki-0.22.0
	oboe-sys-0.4.5
	wgpu-hal-0.12.4
	futures-channel-0.3.21
	coreaudio-rs-0.10.0
	web-sys-0.3.56
	autocfg-1.1.0
	ndk-macro-0.3.0
	cpufeatures-0.2.2
	httparse-1.6.0
	nonzero_ext-0.2.0
	untrusted-0.7.1
	gtk-sys-0.15.3
	fxhash-0.2.1
	ndk-glue-0.5.1
	slice-deque-0.3.0
	crossbeam-utils-0.8.8
	windows_i686_gnu-0.32.0
	gimli-0.26.1
	cesu8-1.1.0
	rustls-0.20.4
	glow-0.11.2
	cairo-rs-0.15.10
	d3d12-0.4.1
	standback-0.2.17
	combine-4.6.3
	tower-service-0.3.1
	lazy_static-1.4.0
	parking_lot-0.12.0
	intl_pluralrules-7.0.1
	unicode-width-0.1.9
	cairo-sys-rs-0.10.0
	webbrowser-0.6.0
	proc-macro-error-1.0.4
	wayland-client-0.29.4
	serde_json-1.0.79
	foreign-types-0.3.2
	matches-0.1.9
	pico-args-0.4.2
	runas-0.2.1
	utf16_lit-1.0.1
	gio-0.15.10
	futures-io-0.3.21
	bytemuck-1.8.0
	msgbox-0.7.0
	stdweb-internal-macros-0.2.9
	openssl-probe-0.1.5
	proc-macro2-1.0.36
	dirs-sys-0.3.7
	ndk-sys-0.3.0
	tungstenite-0.17.2
	core-graphics-types-0.1.1
	glob-0.3.0
	ring-0.16.20
	codespan-reporting-0.11.1
	syn-1.0.89
	jobserver-0.1.24
	url-2.2.2
	atk-0.9.0
	clang-sys-1.3.1
	unic-langid-impl-0.9.0
	futures-0.3.21
	encoding_rs_io-0.1.7
	cty-0.2.2
	piet-coregraphics-0.3.0
	sha1-0.6.1
	darling_macro-0.13.1
	fluent-langneg-0.13.0
	regex-syntax-0.6.25
	headers-core-0.2.0
	slab-0.4.5
	ident_case-1.0.1
	gpu-alloc-types-0.2.0
	glib-0.10.3
	ucd-trie-0.1.3
	unicode-bidi-0.3.7
	redox_users-0.4.2
	cairo-sys-rs-0.15.1
	memoffset-0.6.5
	proc-macro-crate-0.1.5
	base64-0.13.0
	stable_deref_trait-1.2.0
	parking_lot_core-0.9.1
	range-alloc-0.1.2
	wayland-protocols-0.29.4
	js-sys-0.3.56
	winit-0.26.1
	objc_exception-0.1.2
	gdk-sys-0.15.1
	socket2-0.4.4
	winapi-util-0.1.5
	alsa-0.6.0
	generic-array-0.14.5
	gobject-sys-0.10.0
	wgpu-core-0.12.2
	byteorder-1.4.3
	hexf-parse-0.2.1
	miniz_oxide-0.4.4
	h2-0.3.12
	ureq-2.4.0
	pin-utils-0.1.0
	regex-1.5.5
	openssl-0.10.38
	tinyfiledialogs-3.9.0
	quote-1.0.16
	alcro-0.5.4
	xml-rs-0.8.4
	unic-ucd-bidi-0.9.0
	crypto-common-0.1.3
	gdk-pixbuf-0.9.0
	env_logger-0.9.0
	shlex-0.1.1
	nix-0.23.1
	heck-0.4.0
	num_enum-0.5.7
	nom-5.1.2
	pest-2.1.3
	widestring-0.4.3
	pango-0.9.1
	atk-0.15.1
	getrandom-0.2.5
	digest-0.10.3
	num_threads-0.1.5
	rayon-1.5.1
	discard-1.0.4
	glam-0.20.2
	sct-0.7.0
	khronos-egl-4.1.0
	mio-0.8.2
	gtk-0.15.4
	ogg-0.8.0
	http-0.2.6
	rcgen-0.9.2
	ndk-glue-0.6.1
	lewton-0.10.2
	keyboard-types-0.5.0
	serde_derive-1.0.136
	rental-impl-0.5.5
	signal-hook-registry-1.4.0
	core-video-sys-0.1.4
	headers-0.3.7
	failure-0.1.8
	winapi-0.3.9
	druid-0.7.0
	associative-cache-1.0.1
	jack-sys-0.2.3
	httpdate-1.0.2
	calloop-0.9.3
	x11-dl-2.19.1
	shlex-1.1.0
	metal-0.23.1
	rustc_version-0.3.3
	errno-dragonfly-0.1.2
	rustc-hash-1.1.0
	futures-timer-3.0.2
	core-foundation-sys-0.8.3
	cfg-expr-0.10.2
	no-std-compat-0.4.1
	gpu-alloc-0.5.3
	wasm-bindgen-shared-0.2.79
	druid-derive-0.4.0
	nonzero_ext-0.3.0
	scopeguard-1.1.0
	bincode-1.3.3
	piet-web-0.3.1
	tinyvec_macros-0.1.0
	glib-macros-0.15.10
	flate2-1.0.22
	tokio-native-tls-0.3.0
	const_fn-0.4.9
	gio-0.9.1
	wasm-bindgen-macro-support-0.2.79
	fluent-syntax-0.9.3
	textwrap-0.11.0
	crossbeam-deque-0.8.1
	atk-sys-0.15.1
	tempfile-3.3.0
	security-framework-sys-2.6.1
	governor-0.3.2
	unic-char-range-0.9.0
	schannel-0.1.19
	fnv-1.0.7
	system-deps-1.3.2
	type-map-0.4.0
	dashmap-5.2.0
	bytemuck_derive-1.0.1
	smallvec-1.8.0
	unic-ucd-version-0.9.0
	ndk-context-0.1.0
	widestring-0.5.1
	unic-langid-0.9.0
	webpki-roots-0.22.2
	crc32fast-1.3.2
	ansi_term-0.12.1
	proc-macro-error-attr-1.0.4
	windows_aarch64_msvc-0.32.0
	futures-util-0.3.21
	glib-macros-0.10.1
	unic-char-property-0.9.0
	xi-unicode-0.2.1
	raw-window-handle-0.4.2
	xi-unicode-0.3.0
	base-x-0.2.8
	rand_core-0.6.3
	core-graphics-0.22.3
	fluent-bundle-0.12.0
	renderdoc-sys-0.7.1
	yasna-0.5.0
	unicode-normalization-0.1.19
	dirs-4.0.0
	gdk-pixbuf-sys-0.10.0
	bit-set-0.5.2
	atty-0.2.14
	intl-memoizer-0.5.1
	time-macros-0.1.1
	miow-0.3.7
	ahash-0.7.6
	core-graphics-0.19.2
	sysinfo-0.23.5
	unicode-segmentation-1.9.0
	dashmap-4.0.2
	block-buffer-0.10.2
	jack-0.8.4
	libc-0.2.121
	stdweb-internal-runtime-0.1.5
	cocoa-foundation-0.1.0
	env_logger-0.8.4
	mach-0.3.2
	lazycell-1.3.0
	encoding_rs-0.8.30
	nom-7.1.1
	rental-0.5.6
	version-compare-0.1.0
	peeking_take_while-0.1.2
	strsim-0.8.0
	time-0.2.27
	winreg-0.10.1
	cfg-if-0.1.10
	foreign-types-shared-0.1.1
	rodio-0.15.0
	tokio-macros-1.7.0
	gpu-descriptor-0.2.2
	core-foundation-0.7.0
	copyless-0.1.5
	clap-2.34.0
	android_log-sys-0.2.0
	pem-1.0.2
	nix-0.22.3
	wasm-bindgen-backend-0.2.79
	tokio-util-0.7.0
	downcast-rs-1.2.0
	ppv-lite86-0.2.16
	ryu-1.0.9
	proc-macro-crate-1.1.3
	ndk-0.5.0
	wgpu-0.12.0
	tinyvec-1.5.1
	percent-encoding-2.1.0
	glib-0.15.10
	fastrand-1.7.0
	tokio-1.17.0
	openssl-sys-0.9.72
	termcolor-1.1.3
	time-0.3.9
	futures-macro-0.3.21
	wasi-0.11.0+wasi-snapshot-preview1
	lock_api-0.4.6
	time-0.1.43
	want-0.3.0
	darling-0.13.1
	unicode-xid-0.2.2
	block-0.1.6
	strsim-0.10.0
	gdk-0.15.4
	bindgen-0.56.0
	wasm-bindgen-macro-0.2.79
	futures-executor-0.3.21
	num_cpus-1.13.1
	smithay-client-toolkit-0.15.3
	windows_x86_64_gnu-0.32.0
	serde_urlencoded-0.7.1
	hound-3.4.0
	anyhow-1.0.56
	same-file-1.0.6
	ndk-sys-0.2.2
	rustc_version-0.2.3
	version-compare-0.0.10
	cairo-rs-0.9.1
	field-offset-0.3.4
	memchr-2.4.1
	version_check-0.9.4
	atk-sys-0.10.0
	console_log-0.2.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	chrono-0.4.19
	thiserror-1.0.30
	idna-0.2.3
	typenum-1.15.0
	semver-0.9.0
	utf-8-0.7.6
	hashbrown-0.11.2
	gtk-0.9.2
	objc-0.2.7
	arrayvec-0.5.2
	slotmap-1.0.6
	tokio-util-0.6.9
	bytes-1.1.0
	futures-sink-0.3.21
	profiling-1.0.5
	ipnet-2.4.0
	gio-sys-0.10.1
"

inherit desktop cargo xdg

DESCRIPTION="ALVR is an open source remote VR display for the Oculus Go/Quest"
HOMEPAGE="https://github.com/alvr-org/ALVR"
SRC_URI="https://github.com/alvr-org/ALVR/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" $(cargo_crate_uris) "

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${P^^}"

IUSE="+client +server vaapi vulkan x264 x265"

RDEPEND="
	>=media-video/ffmpeg-4.3[encode,vulkan?,x264?,x265?]
	vaapi? ( media-video/ffmpeg[libdrm,vaapi] )
	sys-libs/libunwind
	|| (
		www-client/chromium
		www-client/chromium-bin
	)
"

DEPEND="${RDEPEND}
	vulkan? ( dev-util/vulkan-headers )
"

BDEPEND="${RDEPEND}
	virtual/pkgconfig
	client? ( media-gfx/imagemagick )
"

src_configure() {
	local ECARGO_EXTRA_ARGS="
		-p vrcompositor-wrapper
		$(usex server "-p alvr_server" "" )
		$(usex client "-p alvr_client -p alvr_launcher" "" )
		$(usex vulkan "-p alvr_vulkan-layer" "" )
		"
	cargo_src_configure
}

src_install() {
	if use client; then
		dobin target/release/alvr_launcher
		dolib.so target/release/libalvr_client.so
		domenu packaging/freedesktop/alvr.desktop
		for size in {16,32,48,64,128,256}; do
			convert alvr/launcher/res/launcher.ico \
				-thumbnail ${size} -alpha on -background none -flatten \
				${PN}-${size}.png || die
			newicon -s ${size} ${PN}-${size}.png ${PN}.png
		done
	fi

	if use server; then
		#dolib.so target/release/libalvr_server.so

		exeinto /usr/lib64/alvr/bin/linux64/
		newexe target/release/libalvr_server.so driver_alvr_server.so

		insinto /usr/lib64/alvr/
		doins alvr/xtask/resources/driver.vrdrivermanifest

	fi

	if use vulkan; then
		dolib.so target/release/libalvr_vulkan_layer.so
		insinto /usr/share/vulkan/explicit_layer.d/
		doins alvr/vulkan-layer/layer/alvr_x86_64.json
	fi

	exeinto /usr/libexec/alvr
	doexe target/release/vrcompositor-wrapper
	doexe packaging/firewall/alvr_fw_config.sh

	insinto /usr/share/${PN}/selinux/
	doins packaging/selinux/*

	insinto /usr/share/${PN}/presets/
	doins alvr/xtask/resources/presets/*

	insinto /usr/share/${PN}/
	doins -r alvr/dashboard

	insinto /usr/lib/firewalld/services/
	doins packaging/firewall/alvr-firewalld.xml

	insinto /etc/ufw/applications.d/
	doins packaging/firewall/ufw-alvr
}
