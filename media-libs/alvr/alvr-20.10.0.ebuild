# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	bzip2@0.4.4
	tokio-native-tls@0.3.1
	atomic-waker@1.1.2
	unicode-normalization@0.1.23
	socket2@0.4.10
	openssl-macros@0.1.1
	aho-corasick@1.1.3
	tower@0.4.13
	wasite@0.1.0
	zopfli@0.8.1
	annotate-snippets@0.9.2
	data-encoding@2.6.0
	runas@1.2.0
	sctk-adwaita@0.8.3
	rustc-hash@1.1.0
	static_assertions@1.1.0
	fern@0.6.2
	downcast-rs@1.2.1
	generic-array@0.14.7
	jni@0.21.1
	ppv-lite86@0.2.17
	ash@0.37.3+1.3.251
	blocking@1.6.1
	cexpr@0.6.0
	wrapcenum-derive@0.4.1
	dirs-sys@0.4.1
	gloo-net@0.5.0
	com_macros_support@0.6.0
	gpu-allocator@0.25.0
	lazycell@1.3.0
	time-core@0.1.2
	anstyle-parse@0.2.4
	ureq@2.10.0
	cfg_aliases@0.2.1
	atspi@0.19.0
	orbclient@0.3.47
	redox_syscall@0.4.1
	simba@0.8.1
	accesskit_unix@0.6.2
	minimal-lexical@0.2.1
	objc2-core-data@0.2.2
	utf-8@0.7.6
	winreg@0.50.0
	idna@0.5.0
	waker-fn@1.2.0
	bytemuck@1.16.1
	unicode-segmentation@1.11.0
	env_logger@0.11.3
	is_terminal_polyfill@1.70.0
	windows_aarch64_msvc@0.52.6
	windows_x86_64_msvc@0.48.5
	type-map@0.5.0
	is-docker@0.2.0
	async-task@4.7.1
	tokio-rustls@0.26.0
	toml_edit@0.21.1
	quinn@0.11.2
	darling@0.20.10
	h2@0.3.26
	litrs@0.4.1
	objc2-app-kit@0.2.2
	errno@0.2.8
	headers-core@0.2.0
	rand_distr@0.4.3
	zbus_names@3.0.0
	ttf-parser@0.24.0
	serde_repr@0.1.19
	thiserror@1.0.61
	parking_lot@0.12.3
	wasm-bindgen-macro-support@0.2.92
	crypto-common@0.1.6
	smithay-clipboard@0.7.1
	windows-targets@0.48.5
	core-foundation-sys@0.8.6
	xkbcommon-dl@0.4.2
	app_dirs2@2.5.5
	crc@3.2.1
	bumpalo@3.16.0
	codespan-reporting@0.11.1
	async-signal@0.2.8
	jack-sys@0.5.1
	tempfile@3.10.1
	winit@0.29.15
	unicode-width@0.1.13
	regex-syntax@0.6.29
	scopeguard@1.2.0
	wayland-protocols-wlr@0.2.0
	android-tzdata@0.1.1
	nix@0.27.1
	lewton@0.10.2
	toml_datetime@0.6.6
	futures-macro@0.3.30
	toml@0.5.11
	filetime@0.2.23
	indexmap@2.2.6
	rodio@0.19.0
	wasm-streams@0.4.0
	hyper-util@0.1.6
	windows-sys@0.45.0
	ewebsock@0.5.0
	owned_ttf_parser@0.24.0
	system-configuration-sys@0.5.0
	event-listener-strategy@0.5.2
	alsa-sys@0.3.1
	xcursor@0.3.5
	lockfree-object-pool@0.1.6
	unicode-xid@0.2.4
	num-integer@0.1.46
	glam@0.28.0
	num-complex@0.4.6
	serde_derive@1.0.204
	whoami@1.5.1
	windows-interface@0.58.0
	wasm-logger@0.2.0
	tracing-core@0.1.32
	chrono@0.4.38
	num-rational@0.4.2
	futures-sink@0.3.30
	winapi-x86_64-pc-windows-gnu@0.4.0
	pbkdf2@0.12.2
	thread_local@1.1.8
	windows_aarch64_gnullvm@0.42.2
	futures-lite@1.13.0
	objc-sys@0.3.5
	native-tls@0.2.12
	object@0.36.1
	bit-vec@0.6.3
	winres@0.1.12
	xdg@2.5.2
	accesskit@0.12.3
	async-lock@2.8.0
	piper@0.2.3
	sharded-slab@0.1.7
	ecolor@0.28.1
	polling@3.7.2
	event-listener@3.1.0
	hermit-abi@0.3.9
	icrate@0.0.4
	windows-targets@0.52.6
	httparse@1.9.4
	ident_case@1.0.1
	winapi-i686-pc-windows-gnu@0.4.0
	humantime@2.1.0
	ndk-context@0.1.1
	range-alloc@0.1.3
	semver@1.0.23
	wasm-bindgen-backend@0.2.92
	num_enum_derive@0.7.2
	objc2-encode@3.0.0
	rustix@0.38.34
	version-compare@0.2.0
	wasm-bindgen-shared@0.2.92
	glutin_egl_sys@0.6.0
	symphonia@0.5.4
	hex@0.4.3
	windows_i686_msvc@0.52.6
	libm@0.2.8
	unicode-bidi@0.3.15
	polling@2.8.0
	security-framework@2.11.0
	concurrent-queue@2.5.0
	thiserror-impl@1.0.61
	cfg_aliases@0.1.1
	hashbrown@0.14.5
	env_filter@0.1.0
	lzma-rs@0.3.0
	tinyvec@1.8.0
	cpal@0.15.3
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.42.2
	libloading@0.7.4
	wayland-sys@0.31.3
	pin-project-internal@1.1.5
	uds_windows@1.1.0
	naga@0.20.0
	libredox@0.1.3
	io-lifetimes@1.0.11
	accesskit_macos@0.10.1
	redox_users@0.4.5
	parking@2.2.0
	itertools@0.12.1
	objc@0.2.7
	tracing-log@0.2.0
	emath@0.28.1
	bitflags@1.3.2
	url@2.5.2
	windows_x86_64_gnullvm@0.48.5
	inout@0.1.3
	jobserver@0.1.31
	windows-implement@0.48.0
	hyper-tls@0.5.0
	base64@0.21.7
	windows_i686_gnullvm@0.52.6
	simd-adler32@0.3.7
	async-process@1.8.1
	tracy-client-sys@0.22.2
	objc2@0.4.1
	yansi-term@0.1.2
	error-code@3.2.0
	egui-winit@0.28.1
	bytemuck_derive@1.7.0
	objc2-encode@4.0.3
	num-derive@0.4.2
	accesskit_consumer@0.16.1
	winapi@0.3.9
	once_cell@1.19.0
	quinn-proto@0.11.3
	crc-catalog@2.4.0
	async-io@1.13.0
	windows-core@0.54.0
	windows_i686_gnu@0.52.6
	h2@0.4.5
	xi-unicode@0.3.0
	objc2-metal@0.2.2
	hermit-abi@0.4.0
	symphonia-core@0.5.4
	android-activity@0.6.0
	libloading@0.8.4
	raw-window-handle@0.5.2
	async-net@2.0.0
	errno@0.3.9
	strict-num@0.1.1
	windows@0.58.0
	fnv@1.0.7
	convert_case@0.6.0
	toml_edit@0.22.15
	slab@0.4.9
	symphonia-bundle-mp3@0.5.4
	unicode-ident@1.0.12
	pollster@0.3.0
	ahash@0.8.11
	profiling-procmacros@1.0.15
	accesskit_winit@0.16.1
	miniz_oxide@0.7.4
	ring@0.17.8
	tracing-attributes@0.1.27
	async-channel@2.3.1
	image@0.25.1
	async-broadcast@0.7.1
	web-sys@0.3.69
	windows-core@0.52.0
	wasi@0.11.0+wasi-snapshot-preview1
	untrusted@0.9.0
	arboard@3.4.0
	async-executor@1.12.0
	heck@0.5.0
	lock_api@0.4.12
	arbitrary@1.3.2
	tiny-skia-path@0.11.4
	hound@3.5.1
	js-sys@0.3.69
	home@0.5.9
	wayland-scanner@0.31.3
	rosc@0.10.1
	accesskit_windows@0.15.1
	bzip2-sys@0.1.11+1.0.8
	crc32fast@1.4.2
	smol_str@0.2.2
	crossbeam-utils@0.8.20
	objc2@0.3.0-beta.3.patch-leaks.3
	subtle@2.6.1
	tungstenite@0.23.0
	clipboard-win@5.4.0
	jni-sys@0.3.0
	nom@7.1.3
	ash@0.38.0+1.3.281
	libc@0.2.155
	windows_x86_64_gnu@0.52.6
	async-fs@2.1.2
	overload@0.1.1
	symphonia-metadata@0.5.4
	block2@0.5.1
	event-listener@5.3.1
	serde_urlencoded@0.7.1
	aes@0.8.4
	gethostname@0.4.3
	alsa@0.9.0
	darling_macro@0.20.10
	block-sys@0.2.1
	glyph_brush_layout@0.2.4
	mdns-sd@0.11.1
	winreg@0.52.0
	backtrace@0.3.73
	form_urlencoded@1.2.1
	oboe@0.6.1
	tracing-subscriber@0.3.18
	foreign-types-shared@0.1.1
	gloo-utils@0.2.0
	eframe@0.28.1
	bincode@1.3.3
	exec@0.3.1
	openssl-sys@0.9.102
	displaydoc@0.2.5
	xml-rs@0.8.20
	objc-sys@0.2.0-beta.2
	darling_core@0.20.10
	http-body@0.4.6
	anstream@0.6.14
	zvariant_derive@4.1.2
	dispatch@0.2.0
	encoding_rs@0.8.34
	hassle-rs@0.11.0
	syn@1.0.109
	cros-libva@0.0.6
	nanorand@0.7.0
	glow@0.13.1
	derivative@2.2.0
	serde_json@1.0.120
	zerocopy@0.7.35
	enumflags2_derive@0.7.10
	prettyplease@0.2.20
	core-graphics@0.23.2
	want@0.3.1
	nalgebra@0.32.6
	same-file@1.0.6
	async-io@2.3.3
	reqwest@0.12.5
	pin-project-lite@0.2.14
	windows_aarch64_msvc@0.42.2
	enumflags2@0.7.10
	ashpd@0.8.1
	widestring@1.1.0
	termcolor@1.4.1
	security-framework-sys@2.11.0
	either@1.13.0
	parking_lot_core@0.9.10
	ndk@0.9.0
	rustls@0.23.11
	windows_x86_64_gnu@0.42.2
	gl_generator@0.14.0
	ryu@1.0.18
	d3d12@0.20.0
	foreign-types-macros@0.2.3
	num_enum@0.7.2
	syn@2.0.70
	futures-lite@2.3.0
	nix@0.29.0
	khronos-egl@6.0.0
	itoa@1.0.11
	log@0.4.22
	windows-sys@0.48.0
	version_check@0.9.4
	glutin_wgl_sys@0.5.0
	objc2@0.5.2
	try-lock@0.2.5
	futures-util@0.3.30
	nu-ansi-term@0.46.0
	rustc-demangle@0.1.24
	encoding_rs_io@0.1.7
	digest@0.10.7
	wasm-bindgen@0.2.92
	toml@0.8.14
	arrayvec@0.7.4
	cipher@0.4.4
	redox_syscall@0.5.2
	windows@0.54.0
	addr2line@0.22.0
	utf8parse@0.2.2
	proc-macro-crate@1.3.1
	system-configuration@0.5.1
	local-ip-address@0.6.1
	wgpu-hal@0.21.1
	zip@2.1.3
	memoffset@0.9.1
	rustls-pki-types@1.7.0
	lazy_static@1.5.0
	system-deps@6.2.2
	libredox@0.0.2
	tinyvec_macros@0.1.1
	wide@0.7.25
	adler@1.0.2
	futures-task@0.3.30
	windows-strings@0.1.0
	neli-proc-macros@0.1.3
	async-recursion@1.1.1
	proc-macro2@1.0.86
	mime@0.3.17
	openssl-probe@0.1.5
	hyper-rustls@0.27.2
	autocfg@1.3.0
	hexf-parse@0.2.1
	event-listener@2.5.3
	windows-interface@0.48.0
	zvariant_utils@1.0.1
	iana-time-zone-haiku@0.1.2
	libspa@0.8.0
	block@0.1.6
	zeroize@1.8.1
	equivalent@1.0.1
	glob@0.3.1
	nohash-hasher@0.2.0
	coreaudio-sys@0.2.15
	nvml-wrapper-sys@0.8.0
	nalgebra-macros@0.2.2
	spirv@0.3.0+sdk-1.3.268.0
	nvml-wrapper@0.10.0
	dirs@5.0.1
	flume@0.11.0
	pipewire-sys@0.8.0
	headers@0.3.9
	windows_x86_64_gnullvm@0.52.6
	anstyle-wincon@3.0.3
	windows-sys@0.52.0
	gpu-descriptor-types@0.2.0
	async-once-cell@0.5.3
	arrayref@0.3.7
	webpki-roots@0.26.3
	dlib@0.5.2
	walkdir@2.5.0
	urlencoding@2.1.3
	ndk-sys@0.5.0+25.2.9519653
	windows-result@0.1.2
	zeroize_derive@1.4.2
	futures-executor@0.3.30
	num-conv@0.1.0
	cfg-expr@0.15.8
	objc2-foundation@0.2.2
	tar@0.4.41
	android-properties@0.2.2
	block-buffer@0.10.4
	block2@0.2.0-alpha.6
	ipnet@2.9.0
	epaint@0.28.1
	paste@1.0.15
	zvariant_utils@2.0.0
	async-fs@1.6.0
	proc-macro-crate@3.1.0
	toml_edit@0.19.15
	cfg-if@1.0.0
	android_logger@0.14.1
	wayland-csd-frame@0.3.0
	winapi-util@0.1.8
	wayland-backend@0.3.5
	zvariant@3.15.2
	open@5.3.0
	zbus@4.3.1
	metal@0.28.0
	windows_x86_64_gnullvm@0.42.2
	valuable@0.1.0
	target-lexicon@0.12.15
	cpufeatures@0.2.12
	base64@0.22.1
	block-sys@0.1.0-beta.1
	zbus_names@2.6.1
	serde_spanned@0.6.6
	linux-raw-sys@0.3.8
	as-raw-xcb-connection@1.0.1
	pipewire@0.8.0
	atspi-common@0.3.0
	rustls-pemfile@1.0.4
	combine@4.6.7
	hyper@1.4.1
	atspi-connection@0.3.0
	tokio@1.38.0
	core-graphics-types@0.1.3
	xattr@1.3.1
	flate2@1.0.30
	gpu-descriptor@0.3.0
	core-foundation@0.9.4
	memoffset@0.7.1
	ndk-sys@0.6.0+11769913
	socket2@0.5.7
	wayland-cursor@0.31.4
	oboe-sys@0.6.1
	zstd-safe@7.2.0
	regex-automata@0.1.10
	iana-time-zone@0.1.60
	windows-core@0.58.0
	glutin@0.31.3
	anstyle-query@1.1.0
	num_cpus@1.16.0
	reqwest@0.11.27
	fastrand@2.1.0
	which@4.4.2
	getrandom@0.2.15
	tiny-skia@0.11.4
	sha1@0.10.6
	time@0.3.36
	winnow@0.5.40
	malloc_buf@0.0.6
	console_error_panic_hook@0.1.7
	android_system_properties@0.1.5
	cc@1.1.0
	endi@1.1.0
	zvariant_derive@3.15.2
	web-time@0.2.4
	sync_wrapper@1.0.1
	windows@0.52.0
	x11-dl@2.21.0
	block2@0.3.0
	objc2-quartz-core@0.2.2
	profiling@1.0.15
	renderdoc-sys@1.1.0
	byteorder@1.5.0
	foreign-types-shared@0.3.1
	matrixmultiply@0.3.8
	mach2@0.4.2
	smallvec@1.13.2
	tower-layer@0.3.2
	vcpkg@0.2.15
	libspa-sys@0.8.0
	windows_aarch64_gnullvm@0.48.5
	windows_x86_64_msvc@0.52.6
	errno-dragonfly@0.1.2
	rfd@0.14.1
	android-activity@0.5.2
	dasp_sample@0.11.0
	ico@0.3.0
	linux-raw-sys@0.4.14
	objc-foundation@0.1.1
	is-wsl@0.4.0
	bytes@1.6.0
	fdeflate@0.3.4
	async-broadcast@0.5.1
	bit-set@0.5.3
	zstd@0.13.2
	smithay-client-toolkit@0.18.1
	rand@0.8.5
	async-lock@3.4.0
	http@0.2.12
	regex-syntax@0.8.4
	zbus_macros@3.15.2
	atspi-proxies@0.3.0
	approx@0.5.1
	x11rb-protocol@0.13.1
	anyhow@1.0.86
	zstd-sys@2.0.12+zstd.1.5.6
	colorchoice@1.0.1
	foreign-types@0.5.0
	rustls-pemfile@2.1.2
	egui_glow@0.28.1
	wgpu@0.20.1
	if-addrs@0.10.2
	futures-channel@0.3.30
	fastrand@1.9.0
	instant@0.1.13
	xdg-home@1.2.0
	pin-utils@0.1.0
	memmap2@0.9.4
	tokio-tungstenite@0.20.1
	khronos_api@3.1.0
	wgpu-types@0.20.0
	quote@1.0.36
	android_log-sys@0.3.1
	presser@0.3.1
	allocator-api2@0.2.18
	glutin-winit@0.4.2
	tokio-util@0.7.11
	ab_glyph_rasterizer@0.1.8
	egui-wgpu@0.28.1
	num-traits@0.2.19
	deflate64@0.1.8
	async-trait@0.1.81
	pkg-config@0.3.30
	ntapi@0.4.1
	zvariant@4.1.2
	derive_arbitrary@1.3.2
	windows_x86_64_gnu@0.48.5
	tungstenite@0.20.1
	typenum@1.17.0
	gpu-alloc-types@0.3.0
	egui@0.28.1
	safe_arch@0.7.2
	glutin_glx_sys@0.5.0
	http-body-util@0.1.2
	ab_glyph@0.2.28
	sync_wrapper@0.1.2
	zbus_macros@4.3.1
	zerocopy-derive@0.7.35
	document-features@0.2.8
	tower-service@0.3.2
	generator@0.8.1
	shlex@1.3.0
	tungstenite@0.21.0
	wayland-protocols@0.31.2
	scoped-tls@1.0.1
	objc2-core-image@0.2.2
	ordered-stream@0.2.0
	png@0.17.13
	slotmap@1.0.7
	windows-targets@0.42.2
	windows_x86_64_msvc@0.42.2
	xshell-macros@0.2.6
	ogg@0.8.0
	gpu-alloc@0.6.0
	windows-result@0.2.0
	httpdate@1.0.3
	signal-hook-registry@1.4.2
	spin@0.9.8
	calloop@0.12.4
	tokio-macros@2.3.0
	pin-project@1.1.5
	claxon@0.4.3
	sysinfo@0.30.13
	quinn-udp@0.5.2
	cookie-factory@0.3.3
	statrs@0.17.1
	rustversion@1.0.17
	rand_chacha@0.3.1
	hmac@0.12.1
	openssl@0.10.64
	rand_core@0.6.4
	anstyle@1.0.7
	regex@1.10.5
	calloop-wayland-source@0.2.0
	wayland-protocols-plasma@0.2.0
	rustix@0.37.27
	wayland-client@0.31.4
	x11rb@0.13.1
	regex-automata@0.4.7
	com_macros@0.6.0
	quick-xml@0.34.0
	futures@0.3.30
	webbrowser@1.0.1
	windows_i686_gnu@0.48.5
	tracy-client@0.17.0
	cgl@0.3.2
	coreaudio-rs@0.11.3
	xkeysym@0.2.1
	bitflags@2.6.0
	hyper@0.14.30
	foreign-types@0.3.2
	percent-encoding@2.3.1
	ndk@0.8.0
	schannel@0.1.23
	memchr@2.7.4
	http-body@1.0.0
	rawpointer@0.2.1
	zbus@3.15.2
	powerfmt@0.2.0
	pico-args@0.5.0
	loom@0.7.2
	futures-core@0.3.30
	com@0.6.0
	gimli@0.29.0
	tracing@0.1.40
	futures-io@0.3.30
	serde@1.0.204
	nix@0.26.4
	pathdiff@0.2.1
	windows_aarch64_msvc@0.48.5
	mio@0.8.11
	redox_syscall@0.3.5
	objc2-encode@2.0.0-pre.2
	windows_i686_gnu@0.42.2
	async-process@2.2.3
	neli@0.6.4
	jack@0.11.4
	objc_id@0.1.1
	windows@0.48.0
	wasm-bindgen-futures@0.4.42
	windows_aarch64_gnullvm@0.52.6
	bindgen@0.69.4
	option-ext@0.2.0
	wgpu-core@0.21.1
	windows-implement@0.58.0
	matchers@0.1.0
	cursor-icon@1.1.0
	clang-sys@1.8.1
	constant_time_eq@0.3.0
	raw-window-handle@0.6.2
	strsim@0.11.1
	winnow@0.6.13
	wasm-bindgen-macro@0.2.92
	cesu8@1.1.0
	rustls-webpki@0.102.5
	http@1.1.0
	xshell@0.2.6
	deranged@0.3.11
"

inherit desktop cargo rust-toolchain xdg git-r3

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
	virtual/jack
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
		-p alvr_server_openvr
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
	newexe target/$(rust_abi)/release/alvr_vrcompositor_wrapper vrcompositor-wrapper
	doexe target/$(rust_abi)/release/alvr_drm_lease_shim.so

	# OpenVR Driver
	exeinto /usr/lib/steamvr/alvr/bin/linux64/
	newexe target/$(rust_abi)/release/libalvr_server_openvr.so driver_alvr_server.so

	insinto /usr/lib/steamvr/alvr/
	doins alvr/xtask/resources/driver.vrdrivermanifest

	# Vulkan layer
	dolib.so target/$(rust_abi)/release/libalvr_vulkan_layer.so
	insinto /usr/share/vulkan/explicit_layer.d/
	doins alvr/vulkan_layer/layer/alvr_x86_64.json

	# Launcher
	dobin target/$(rust_abi)/release/alvr_dashboard

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
}
