# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	glutin_wgl_sys@0.5.0
	glutin_egl_sys@0.6.0
	constant_time_eq@0.3.0
	glyph_brush_layout@0.2.3
	windows-core@0.56.0
	async-net@2.0.0
	zvariant_utils@2.0.0
	async-fs@2.1.2
	wayland-backend@0.3.4
	objc@0.2.7
	rustls-pki-types@1.7.0
	windows@0.52.0
	data-encoding@2.6.0
	ppv-lite86@0.2.17
	statrs@0.16.0
	safe_arch@0.7.1
	tokio@1.38.0
	wayland-scanner@0.31.2
	pbkdf2@0.12.2
	strsim@0.11.1
	async-lock@2.8.0
	async-process@2.2.3
	accesskit@0.12.3
	oboe@0.6.1
	rodio@0.18.1
	zbus@3.15.2
	tracing-core@0.1.32
	wgpu-core@0.20.0
	wgpu-types@0.19.2
	slotmap@1.0.7
	atspi-proxies@0.3.0
	adler@1.0.2
	objc2-foundation@0.2.2
	backtrace@0.3.72
	windows-sys@0.48.0
	symphonia-metadata@0.5.4
	event-listener@5.3.1
	dlib@0.5.2
	type-map@0.5.0
	winnow@0.5.40
	ndk-context@0.1.1
	regex-syntax@0.8.3
	parking@2.2.0
	is_terminal_polyfill@1.70.0
	futures-core@0.3.30
	android_logger@0.13.3
	hermit-abi@0.3.9
	clang-sys@1.8.1
	jni-sys@0.3.0
	libspa-sys@0.8.0
	xdg-home@1.1.0
	memoffset@0.7.1
	proc-macro-crate@1.3.1
	eframe@0.27.2
	async-recursion@1.1.1
	toml@0.8.14
	windows_x86_64_gnu@0.52.5
	block2@0.5.1
	nix@0.28.0
	regex-automata@0.1.10
	windows_i686_gnu@0.42.2
	num-rational@0.4.2
	windows-implement@0.56.0
	cursor-icon@1.1.0
	libredox@0.0.2
	dirs-sys@0.4.1
	objc2-encode@3.0.0
	redox_syscall@0.3.5
	deflate64@0.1.8
	block-buffer@0.10.4
	toml@0.5.11
	ipnet@2.9.0
	wasm-bindgen-futures@0.4.42
	unicode-ident@1.0.12
	winit@0.29.15
	lockfree-object-pool@0.1.6
	syn@1.0.109
	wasm-bindgen-shared@0.2.92
	num_enum@0.7.2
	lock_api@0.4.12
	schannel@0.1.23
	untrusted@0.9.0
	wgpu-hal@0.19.4
	icrate@0.0.4
	pipewire-sys@0.8.0
	unicode-normalization@0.1.23
	android-activity@0.5.2
	console_error_panic_hook@0.1.7
	linux-raw-sys@0.4.14
	gpu-alloc@0.6.0
	crossbeam-utils@0.8.20
	presser@0.3.1
	x11rb@0.13.1
	mime@0.3.17
	bit-set@0.5.3
	crc32fast@1.4.2
	displaydoc@0.2.4
	malloc_buf@0.0.6
	windows-core@0.52.0
	windows_x86_64_gnullvm@0.52.5
	parking_lot_core@0.9.10
	windows-result@0.1.1
	objc2-app-kit@0.2.2
	socket2@0.5.7
	hmac@0.12.1
	accesskit_unix@0.6.2
	crypto-common@0.1.6
	png@0.17.13
	async-trait@0.1.80
	darling_core@0.20.9
	serde_spanned@0.6.6
	parking_lot@0.12.3
	ash@0.37.3+1.3.251
	wasm-bindgen-macro@0.2.92
	smithay-clipboard@0.7.1
	neli-proc-macros@0.1.3
	windows_i686_gnu@0.52.5
	urlencoding@2.1.3
	ndk-sys@0.5.0+25.2.9519653
	block-sys@0.1.0-beta.1
	zerocopy-derive@0.7.34
	zvariant_derive@4.1.1
	tower-layer@0.3.2
	base64@0.22.1
	env_logger@0.11.3
	ordered-stream@0.2.0
	object@0.35.0
	rand_core@0.6.4
	ab_glyph@0.2.26
	futures-io@0.3.30
	lewton@0.10.2
	metal@0.27.0
	symphonia@0.5.4
	arrayref@0.3.7
	reqwest@0.12.4
	futures-task@0.3.30
	http@0.2.12
	spin@0.9.8
	arrayvec@0.7.4
	polling@2.8.0
	inout@0.1.3
	fdeflate@0.3.4
	coreaudio-rs@0.11.3
	bincode@1.3.3
	async-broadcast@0.7.0
	colorchoice@1.0.1
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	serde_repr@0.1.19
	glob@0.3.1
	piper@0.2.3
	aes@0.8.4
	num-integer@0.1.46
	unicode-segmentation@1.11.0
	form_urlencoded@1.2.1
	blocking@1.6.1
	winnow@0.6.13
	futures-channel@0.3.30
	pin-project-lite@0.2.14
	ureq@2.9.7
	nohash-hasher@0.2.0
	pico-args@0.5.0
	glam@0.27.0
	core-foundation@0.9.4
	env_logger@0.10.2
	ndk-sys@0.6.0+11769913
	prettyplease@0.2.20
	tower@0.4.13
	hyper@1.3.1
	android-activity@0.6.0
	bytes@1.6.0
	pipewire@0.8.0
	zvariant_utils@1.0.1
	errno@0.3.9
	h2@0.3.26
	convert_case@0.6.0
	alsa-sys@0.3.1
	httpdate@1.0.3
	gloo-utils@0.2.0
	wgpu-core@0.19.4
	zbus@4.2.2
	windows_aarch64_msvc@0.48.5
	winreg@0.50.0
	d3d12@0.20.0
	accesskit_consumer@0.16.1
	memmap2@0.9.4
	event-listener@2.5.3
	unicode-bidi@0.3.15
	regex@1.10.4
	jack@0.11.4
	webpki-roots@0.26.1
	windows_x86_64_gnu@0.42.2
	wayland-client@0.31.3
	wayland-csd-frame@0.3.0
	syn@2.0.66
	pin-project-internal@1.1.5
	profiling-procmacros@1.0.15
	windows_i686_gnu@0.48.5
	windows@0.54.0
	tracing-log@0.2.0
	rand@0.8.5
	gpu-descriptor-types@0.1.2
	rustc-hash@1.1.0
	async-broadcast@0.5.1
	color_quant@1.1.0
	gethostname@0.4.3
	objc_id@0.1.1
	socket2@0.4.10
	hound@3.5.1
	tracy-client-sys@0.22.2
	raw-window-handle@0.5.2
	idna@0.5.0
	security-framework-sys@2.11.0
	termcolor@1.4.1
	naga@0.19.2
	core-foundation-sys@0.8.6
	egui@0.27.2
	windows-targets@0.42.2
	fastrand@1.9.0
	lazy_static@1.4.0
	naga@0.20.0
	atomic-waker@1.1.2
	yansi-term@0.1.2
	wayland-sys@0.31.2
	libm@0.2.8
	cexpr@0.6.0
	rustls-pemfile@1.0.4
	litrs@0.4.1
	ndk@0.8.0
	alsa@0.9.0
	khronos_api@3.1.0
	tracy-client@0.17.0
	egui-wgpu@0.27.2
	want@0.3.1
	async-io@2.3.3
	ahash@0.8.11
	simd-adler32@0.3.7
	zbus_names@3.0.0
	nvml-wrapper@0.10.0
	fnv@1.0.7
	libc@0.2.155
	wasite@0.1.0
	enumflags2@0.7.9
	http@1.1.0
	windows@0.56.0
	sync_wrapper@0.1.2
	sctk-adwaita@0.8.1
	ash@0.38.0+1.3.281
	wasm-streams@0.4.0
	nix@0.27.1
	tinyvec_macros@0.1.1
	futures-macro@0.3.30
	cpal@0.15.3
	zvariant@4.1.1
	static_assertions@1.1.0
	event-listener-strategy@0.5.2
	tokio-rustls@0.25.0
	shlex@1.3.0
	slab@0.4.9
	async-signal@0.2.7
	mio@0.8.11
	tokio-tungstenite@0.20.1
	windows_i686_gnullvm@0.52.5
	open@5.1.3
	pin-project@1.1.5
	winapi-util@0.1.8
	ecolor@0.27.2
	bytemuck@1.16.0
	iana-time-zone@0.1.60
	instant@0.1.13
	anstyle@1.0.7
	toml_edit@0.21.1
	httparse@1.8.0
	linux-raw-sys@0.3.8
	atspi-connection@0.3.0
	zeroize_derive@1.4.2
	regex-automata@0.4.6
	toml_edit@0.22.14
	wayland-cursor@0.31.3
	zbus_macros@4.2.2
	digest@0.10.7
	http-body-util@0.1.1
	strict-num@0.1.1
	dasp_sample@0.11.0
	libloading@0.7.4
	num_enum_derive@0.7.2
	heck@0.5.0
	dirs@5.0.1
	atspi@0.19.0
	memoffset@0.9.1
	pin-utils@0.1.0
	headers-core@0.2.0
	thiserror-impl@1.0.61
	valuable@0.1.0
	windows@0.48.0
	xcursor@0.3.5
	chrono@0.4.38
	glutin_glx_sys@0.5.0
	com_macros_support@0.6.0
	url@2.5.0
	egui_glow@0.27.2
	ico@0.3.0
	matrixmultiply@0.3.8
	tokio-util@0.7.11
	wasm-logger@0.2.0
	matchers@0.1.0
	semver@1.0.23
	zstd-sys@2.0.10+zstd.1.5.6
	h2@0.4.5
	xml-rs@0.8.20
	block2@0.2.0-alpha.6
	libredox@0.1.3
	proc-macro-crate@3.1.0
	dispatch@0.2.0
	wgpu@0.20.0
	anyhow@1.0.86
	glutin@0.31.3
	encoding_rs@0.8.34
	walkdir@2.5.0
	atspi-common@0.3.0
	bytemuck_derive@1.7.0
	pkg-config@0.3.30
	symphonia-bundle-mp3@0.5.4
	anstyle-parse@0.2.4
	getrandom@0.2.15
	serde_urlencoded@0.7.1
	crc@3.2.1
	rustls-webpki@0.102.4
	as-raw-xcb-connection@1.0.1
	home@0.5.9
	cocoa@0.25.0
	objc2-quartz-core@0.2.2
	darling_macro@0.20.9
	derive_arbitrary@1.3.2
	futures-lite@2.3.0
	lazycell@1.3.0
	android-tzdata@0.1.1
	async-lock@3.4.0
	deranged@0.3.11
	scoped-tls@1.0.1
	bumpalo@3.16.0
	emath@0.27.2
	try-lock@0.2.5
	futures-sink@0.3.30
	zstd@0.13.1
	fern@0.6.2
	objc_exception@0.1.2
	x11-dl@2.21.0
	percent-encoding@2.3.1
	core-graphics-types@0.1.3
	http-body@0.4.6
	windows_x86_64_msvc@0.42.2
	proc-macro2@1.0.84
	ryu@1.0.18
	rustls-pemfile@2.1.2
	aho-corasick@1.1.3
	num-derive@0.4.2
	hyper-rustls@0.26.0
	async-once-cell@0.5.3
	x11rb-protocol@0.13.1
	zbus_names@2.6.1
	futures-util@0.3.30
	async-process@1.8.1
	openssl@0.10.64
	foreign-types-macros@0.2.3
	objc2-core-data@0.2.2
	com_macros@0.6.0
	wasm-bindgen-backend@0.2.92
	bindgen@0.69.4
	env_filter@0.1.0
	nix@0.26.4
	iana-time-zone-haiku@0.1.2
	ring@0.17.8
	anstyle-wincon@3.0.3
	tinyvec@1.6.0
	generator@0.8.1
	which@4.4.2
	bzip2@0.4.4
	xdg@2.5.2
	orbclient@0.3.47
	gpu-alloc-types@0.3.0
	tempfile@3.10.1
	tracing@0.1.40
	regex-syntax@0.6.29
	winreg@0.52.0
	xattr@1.3.1
	claxon@0.4.3
	codespan-reporting@0.11.1
	darling@0.20.9
	ntapi@0.4.1
	ashpd@0.8.1
	winres@0.1.12
	zeroize@1.8.1
	flume@0.11.0
	wayland-protocols-wlr@0.2.0
	foreign-types@0.5.0
	windows-targets@0.48.5
	humantime@2.1.0
	zstd-safe@7.1.0
	system-configuration-sys@0.5.0
	event-listener@3.1.0
	accesskit_macos@0.10.1
	async-task@4.7.1
	com@0.6.0
	lzma-rs@0.3.0
	tungstenite@0.21.0
	windows_aarch64_gnullvm@0.42.2
	hex@0.4.3
	coreaudio-sys@0.2.15
	once_cell@1.19.0
	redox_syscall@0.5.1
	hexf-parse@0.2.1
	rosc@0.10.1
	wgpu@0.19.4
	local-ip-address@0.6.1
	objc-sys@0.3.5
	utf8parse@0.2.1
	cgl@0.3.2
	objc-foundation@0.1.1
	subtle@2.5.0
	minimal-lexical@0.2.1
	serde_derive@1.0.203
	js-sys@0.3.69
	vcpkg@0.2.15
	crc-catalog@2.4.0
	gpu-descriptor@0.2.4
	jobserver@0.1.31
	unicode-xid@0.2.4
	combine@4.6.7
	num_cpus@1.16.0
	khronos-egl@6.0.0
	if-addrs@0.10.2
	hyper-util@0.1.5
	rustls@0.22.4
	rustc-demangle@0.1.24
	xshell-macros@0.2.6
	objc2-core-image@0.2.2
	tokio-native-tls@0.3.1
	accesskit_winit@0.16.1
	hashbrown@0.14.5
	fastrand@2.1.0
	windows-interface@0.48.0
	zerocopy@0.7.34
	autocfg@1.3.0
	approx@0.5.1
	windows_i686_msvc@0.52.5
	is-docker@0.2.0
	openssl-macros@0.1.1
	jack-sys@0.5.1
	wgpu-types@0.20.0
	version-compare@0.2.0
	generic-array@0.14.7
	toml_datetime@0.6.6
	nom@7.1.3
	loom@0.7.2
	cfg-expr@0.15.8
	ogg@0.8.0
	oboe-sys@0.6.1
	winapi-x86_64-pc-windows-gnu@0.4.0
	rawpointer@0.2.1
	annotate-snippets@0.9.2
	xkbcommon-dl@0.4.2
	metal@0.28.0
	windows-core@0.54.0
	foreign-types-shared@0.3.1
	num-conv@0.1.0
	objc2@0.4.1
	smithay-client-toolkit@0.18.1
	indexmap@2.2.6
	sha1@0.10.6
	android_log-sys@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	objc-sys@0.2.0-beta.2
	exec@0.3.1
	windows_aarch64_msvc@0.42.2
	serde_json@1.0.117
	tiny-skia-path@0.11.4
	wgpu-hal@0.20.0
	neli@0.6.4
	polling@3.7.1
	async-fs@1.6.0
	android_system_properties@0.1.5
	tracing-subscriber@0.3.18
	byteorder@1.5.0
	endi@1.1.0
	epaint@0.27.2
	cc@1.0.98
	itertools@0.12.1
	futures-executor@0.3.30
	gpu-descriptor@0.3.0
	pollster@0.3.0
	winapi-i686-pc-windows-gnu@0.4.0
	glutin-winit@0.4.2
	windows_aarch64_gnullvm@0.48.5
	time-core@0.1.2
	time@0.3.36
	equivalent@1.0.1
	objc2@0.5.2
	typenum@1.17.0
	zip@2.1.3
	objc2@0.3.0-beta.3.patch-leaks.3
	thread_local@1.1.8
	either@1.12.0
	cocoa-foundation@0.1.2
	android-properties@0.2.2
	arboard@3.4.0
	gpu-descriptor-types@0.2.0
	gpu-allocator@0.25.0
	io-lifetimes@1.0.11
	spirv@0.3.0+sdk-1.3.268.0
	windows-sys@0.52.0
	rustix@0.37.27
	smol_str@0.2.2
	sysinfo@0.30.12
	security-framework@2.11.0
	wasm-bindgen@0.2.92
	errno-dragonfly@0.1.2
	miniz_oxide@0.7.3
	tower-service@0.3.2
	signal-hook-registry@1.4.2
	nalgebra@0.29.0
	openssl-probe@0.1.5
	ewebsock@0.5.0
	log@0.4.21
	foreign-types-shared@0.1.1
	same-file@1.0.6
	web-sys@0.3.69
	ttf-parser@0.21.1
	rand_chacha@0.3.1
	libloading@0.8.3
	windows_aarch64_gnullvm@0.52.5
	xshell@0.2.6
	redox_users@0.4.5
	num-complex@0.4.6
	owned_ttf_parser@0.21.0
	tokio-macros@2.3.0
	nvml-wrapper-sys@0.8.0
	objc2-encode@4.0.3
	addr2line@0.22.0
	widestring@1.1.0
	zvariant@3.15.2
	webbrowser@0.8.15
	windows_aarch64_msvc@0.52.5
	zvariant_derive@3.15.2
	calloop@0.12.4
	futures-lite@1.13.0
	wrapcenum-derive@0.4.1
	nu-ansi-term@0.46.0
	cipher@0.4.4
	anstream@0.6.14
	block@0.1.6
	cfg-if@1.0.0
	foreign-types@0.3.2
	reqwest@0.11.27
	version_check@0.9.4
	windows-interface@0.56.0
	wasm-bindgen-macro-support@0.2.92
	block2@0.3.0
	arbitrary@1.3.2
	wayland-protocols@0.31.2
	windows_x86_64_msvc@0.48.5
	is-wsl@0.4.0
	winapi@0.3.9
	libspa@0.8.0
	waker-fn@1.2.0
	uds_windows@1.1.0
	windows-sys@0.45.0
	http-body@1.0.0
	openssl-sys@0.9.102
	egui-winit@0.27.2
	windows_x86_64_gnullvm@0.42.2
	calloop-wayland-source@0.2.0
	cfg_aliases@0.1.1
	headers@0.3.9
	symphonia-core@0.5.4
	rustix@0.38.34
	downcast-rs@1.2.1
	bit-vec@0.6.3
	objc2-encode@2.0.0-pre.2
	cpufeatures@0.2.12
	zbus_macros@3.15.2
	toml_edit@0.19.15
	cookie-factory@0.3.3
	base64@0.21.7
	paste@1.0.15
	web-time@0.2.4
	cesu8@1.1.0
	image@0.24.9
	windows-implement@0.48.0
	bitflags@2.5.0
	accesskit_windows@0.15.1
	memchr@2.7.2
	rustversion@1.0.17
	xkeysym@0.2.0
	itoa@1.0.11
	thiserror@1.0.61
	bzip2-sys@0.1.11+1.0.8
	glow@0.13.1
	error-code@3.2.0
	renderdoc-sys@1.1.0
	profiling@1.0.15
	whoami@1.5.1
	rfd@0.14.1
	tungstenite@0.23.0
	objc2-metal@0.2.2
	derivative@2.2.0
	tar@0.4.40
	windows-targets@0.52.5
	nalgebra-macros@0.1.0
	futures@0.3.30
	powerfmt@0.2.0
	mdns-sd@0.11.1
	num-traits@0.2.19
	rand_distr@0.4.3
	async-executor@1.12.0
	windows_i686_msvc@0.42.2
	async-io@1.13.0
	sharded-slab@0.1.7
	pathdiff@0.2.1
	hyper-tls@0.5.0
	xi-unicode@0.3.0
	smallvec@1.13.2
	concurrent-queue@2.5.0
	jni@0.21.1
	gimli@0.29.0
	option-ext@0.2.0
	wayland-protocols-plasma@0.2.0
	enumflags2_derive@0.7.9
	redox_syscall@0.4.1
	target-lexicon@0.12.14
	utf-8@0.7.6
	quote@1.0.36
	ndk@0.9.0
	scopeguard@1.2.0
	tracing-attributes@0.1.27
	document-features@0.2.8
	encoding_rs_io@0.1.7
	ab_glyph_rasterizer@0.1.8
	quick-xml@0.31.0
	system-configuration@0.5.1
	bitflags@1.3.2
	tungstenite@0.20.1
	hyper@0.14.28
	zopfli@0.8.1
	block-sys@0.2.1
	hassle-rs@0.11.0
	simba@0.6.0
	app_dirs2@2.5.5
	tiny-skia@0.11.4
	anstyle-query@1.0.3
	windows_x86_64_gnullvm@0.48.5
	raw-window-handle@0.6.2
	runas@1.2.0
	flate2@1.0.30
	errno@0.2.8
	unicode-width@0.1.12
	nanorand@0.7.0
	serde@1.0.203
	windows_x86_64_msvc@0.52.5
	native-tls@0.2.12
	allocator-api2@0.2.18
	overload@0.1.1
	gl_generator@0.14.0
	range-alloc@0.1.3
	system-deps@6.2.2
	ident_case@1.0.1
	clipboard-win@5.3.1
	core-graphics@0.23.2
	mach2@0.4.2
	async-channel@2.3.1
	wide@0.7.21
	cros-libva@0.0.6
	filetime@0.2.23
	gloo-net@0.5.0
"

inherit desktop cargo xdg git-r3

DESCRIPTION="ALVR is an open source remote VR display for the Oculus Go/Quest"
HOMEPAGE="https://github.com/alvr-org/ALVR"
#SRC_URI="https://github.com/alvr-org/ALVR/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI=" ${CARGO_CRATE_URIS} "
EGIT_REPO_URI="https://github.com/alvr-org/ALVR.git"
EGIT_COMMIT="v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="video_cards_nvidia"
RESTRICT="network-sandbox" # Temp solution for bundled ffmpeg

RDEPEND="
	sys-libs/libunwind
"

DEPEND="${RDEPEND}"

BDEPEND="${RDEPEND}
	video_cards_nvidia? ( dev-util/nvidia-cuda-toolkit )
	virtual/pkgconfig
	media-gfx/imagemagick
"

PATCHES=(
	"${FILESDIR}/alvr-20.7.0-Disable_rpath_in_dependencies.rs.patch"
)

src_unpack() {
	git-r3_src_unpack
	cargo_src_unpack

	# ALVR requires some dependencies not on crate.io (forks of other libraries)
	# so will just have to fetch them here.
	#
	# TODO: Figure out how to get these deps for offline mode.
	pushd "${S}"
	cargo -v --config "net.offline = false" fetch
	popd
}

src_configure() {
	local ECARGO_EXTRA_ARGS="
		-p alvr_vrcompositor_wrapper
		-p alvr_server
		-p alvr_dashboard
		-p alvr_vulkan_layer
	"
	cargo_gen_config
	cargo_src_configure
}

src_compile() {
	export ALVR_ROOT_DIR=/usr
	export ALVR_LIBRARIES_DIR="$ALVR_ROOT_DIR/$(get_libdir)/"

	export ALVR_OPENVR_DRIVER_ROOT_DIR="$ALVR_ROOT_DIR/lib/steamvr/alvr/"
	export ALVR_VRCOMPOSITOR_WRAPPER_DIR="$ALVR_ROOT_DIR/libexec/alvr/"
	export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

	if use video_cards_nvidia; then
		PKG_CONFIG_PATH="${FILESDIR}" \
			cargo run -p alvr_xtask -- prepare-deps --platform linux
	else
		cargo run -p alvr_xtask -- prepare-deps --platform linux --no-nvidia
	fi

	cargo_src_compile
}

src_install() {
	# vrcompositor wrapper
	exeinto /usr/libexec/alvr/
	newexe target/release/alvr_vrcompositor_wrapper vrcompositor-wrapper

	# OpenVR Driver
	exeinto /usr/lib/steamvr/alvr/bin/linux64/
	newexe target/release/libalvr_server.so driver_alvr_server.so

	insinto /usr/lib/steamvr/alvr/
	doins alvr/xtask/resources/driver.vrdrivermanifest

	# Vulkan layer
	dolib.so target/release/libalvr_vulkan_layer.so
	insinto /usr/share/vulkan/explicit_layer.d/
	doins alvr/vulkan_layer/layer/alvr_x86_64.json

	# Launcher
	dobin target/release/alvr_dashboard

	# Desktop
	domenu alvr/xtask/resources/alvr.desktop

	# Icons
	for size in {16,32,48,64,128,256}; do
		convert alvr/dashboard/resources/dashboard.ico \
			-thumbnail ${size} -alpha on -background none -flatten \
			${PN}-${size}.png || die
		newicon -s ${size} ${PN}-${size}.png ${PN}.png
	done

	# Firewall and SELinux
	insinto /etc/ufw/applications.d/
	doins alvr/xtask/firewall/ufw-alvr

	insinto /usr/lib/firewalld/services/
	doins alvr/xtask/firewall/alvr-firewalld.xml

	doexe alvr/xtask/firewall/alvr_fw_config.sh

	## Removed in 20.2.0
	# insinto /usr/share/alvr/selinux/
	# doins packaging/selinux/*
}
