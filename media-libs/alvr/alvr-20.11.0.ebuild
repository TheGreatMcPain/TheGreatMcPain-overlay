# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	windows-strings@0.1.0
	derive_arbitrary@1.3.2
	zeroize_derive@1.4.2
	yansi-term@0.1.2
	zvariant@3.15.2
	windows-result@0.2.0
	widestring@1.1.0
	emath@0.28.1
	proc-macro-crate@3.1.0
	hmac@0.12.1
	h2@0.3.26
	accesskit_macos@0.10.1
	mach2@0.4.2
	gloo-utils@0.2.0
	blocking@1.6.1
	toml@0.5.11
	wasm-bindgen-shared@0.2.92
	dispatch@0.2.0
	tracing@0.1.40
	atspi-connection@0.3.0
	tokio-native-tls@0.3.1
	block-sys@0.1.0-beta.1
	cursor-icon@1.1.0
	indexmap@2.2.6
	pathdiff@0.2.1
	backtrace@0.3.73
	winit@0.29.15
	com@0.6.0
	futures-io@0.3.30
	ndk-context@0.1.1
	hassle-rs@0.11.0
	event-listener@3.1.0
	lazycell@1.3.0
	futures-sink@0.3.30
	quick-xml@0.34.0
	async-broadcast@0.5.1
	windows_i686_gnu@0.42.2
	idna@0.5.0
	objc@0.2.7
	tokio-tungstenite@0.20.1
	profiling-procmacros@1.0.15
	async-recursion@1.1.1
	hex@0.4.3
	winnow@0.5.40
	wayland-sys@0.31.3
	memchr@2.7.4
	time-core@0.1.2
	tinyvec@1.8.0
	headers-core@0.2.0
	objc2-app-kit@0.2.2
	wayland-protocols@0.31.2
	regex-syntax@0.8.4
	headers@0.3.9
	futures@0.3.30
	pipewire-sys@0.8.0
	quinn-proto@0.11.3
	rand_distr@0.4.3
	document-features@0.2.8
	zbus_names@3.0.0
	cpufeatures@0.2.12
	piper@0.2.3
	http@0.2.12
	spin@0.9.8
	anstream@0.6.14
	futures-channel@0.3.30
	winapi@0.3.9
	http-body@1.0.0
	zerocopy-derive@0.7.35
	anstyle-parse@0.2.4
	glob@0.3.1
	hashbrown@0.14.5
	winapi-util@0.1.8
	enumflags2_derive@0.7.10
	glutin-winit@0.4.2
	env_logger@0.11.3
	android-tzdata@0.1.1
	async-trait@0.1.81
	crc@3.2.1
	bytes@1.6.0
	encoding_rs_io@0.1.7
	range-alloc@0.1.3
	async-io@2.3.3
	smithay-clipboard@0.7.1
	num_enum@0.7.2
	bitflags@2.6.0
	windows-implement@0.48.0
	windows@0.48.0
	digest@0.10.7
	gethostname@0.4.3
	toml_edit@0.22.15
	windows_i686_msvc@0.48.5
	wasm-bindgen-futures@0.4.42
	encoding_rs@0.8.34
	num-traits@0.2.19
	concurrent-queue@2.5.0
	objc-foundation@0.1.1
	sha1@0.10.6
	ewebsock@0.5.0
	urlencoding@2.1.3
	ntapi@0.4.1
	try-lock@0.2.5
	ureq@2.10.0
	waker-fn@1.2.0
	windows_x86_64_msvc@0.48.5
	matrixmultiply@0.3.8
	dirs-sys@0.4.1
	combine@4.6.7
	fdeflate@0.3.4
	humantime@2.1.0
	accesskit_windows@0.15.1
	unicode-xid@0.2.4
	zbus@3.15.2
	wayland-protocols-wlr@0.2.0
	matchers@0.1.0
	rodio@0.19.0
	serde@1.0.204
	calloop-wayland-source@0.2.0
	windows-targets@0.42.2
	async-signal@0.2.8
	equivalent@1.0.1
	wgpu-types@0.20.0
	ring@0.17.8
	windows_x86_64_gnu@0.42.2
	base64@0.22.1
	tracy-client@0.17.0
	openssl-macros@0.1.1
	xattr@1.3.1
	d3d12@0.20.0
	foreign-types@0.5.0
	event-listener@5.3.1
	anstyle-wincon@3.0.3
	windows_x86_64_gnu@0.52.6
	rustls-pemfile@2.1.2
	x11rb@0.13.1
	option-ext@0.2.0
	bzip2@0.4.4
	gpu-descriptor@0.3.0
	presser@0.3.1
	native-tls@0.2.12
	hexf-parse@0.2.1
	wgpu@0.20.1
	crypto-common@0.1.6
	egui-winit@0.28.1
	polling@3.7.2
	system-configuration-sys@0.5.0
	windows-implement@0.58.0
	objc2-core-image@0.2.2
	async-channel@2.3.1
	toml_edit@0.19.15
	iana-time-zone-haiku@0.1.2
	pin-project-lite@0.2.14
	utf-8@0.7.6
	wasite@0.1.0
	parking_lot@0.12.3
	windows_i686_gnullvm@0.52.6
	ashpd@0.8.1
	windows_aarch64_gnullvm@0.52.6
	wayland-backend@0.3.5
	windows-core@0.52.0
	block-sys@0.2.1
	is-wsl@0.4.0
	pkg-config@0.3.30
	prettyplease@0.2.20
	glam@0.28.0
	arbitrary@1.3.2
	oboe-sys@0.6.1
	windows-targets@0.52.6
	jni@0.21.1
	shlex@1.3.0
	tower-layer@0.3.2
	windows-interface@0.48.0
	darling@0.20.10
	quinn@0.11.2
	claxon@0.4.3
	getrandom@0.2.15
	orbclient@0.3.47
	glyph_brush_layout@0.2.4
	zopfli@0.8.1
	crossbeam-utils@0.8.20
	ppv-lite86@0.2.17
	gpu-descriptor-types@0.2.0
	rustls@0.23.11
	objc2-foundation@0.2.2
	which@4.4.2
	cc@1.1.0
	paste@1.0.15
	xi-unicode@0.3.0
	env_filter@0.1.0
	lock_api@0.4.12
	socket2@0.5.7
	tempfile@3.10.1
	futures-task@0.3.30
	pin-utils@0.1.0
	rosc@0.10.1
	glutin@0.31.3
	symphonia-metadata@0.5.4
	dirs@5.0.1
	zvariant_derive@3.15.2
	rustls-pemfile@1.0.4
	ndk@0.9.0
	windows-result@0.1.2
	addr2line@0.22.0
	fnv@1.0.7
	parking@2.2.0
	ttf-parser@0.24.0
	regex@1.10.5
	tracing-core@0.1.32
	block2@0.2.0-alpha.6
	wayland-cursor@0.31.4
	anstyle@1.0.7
	loom@0.7.2
	cpal@0.15.3
	wayland-csd-frame@0.3.0
	hyper-tls@0.5.0
	itertools@0.12.1
	linux-raw-sys@0.3.8
	accesskit_unix@0.6.2
	wgpu-core@0.21.1
	libm@0.2.8
	event-listener-strategy@0.5.2
	overload@0.1.1
	ryu@1.0.18
	unicode-ident@1.0.12
	once_cell@1.19.0
	android_system_properties@0.1.5
	async-lock@2.8.0
	atomic-waker@1.1.2
	crc-catalog@2.4.0
	percent-encoding@2.3.1
	ab_glyph@0.2.28
	generic-array@0.14.7
	log@0.4.22
	libloading@0.8.4
	slotmap@1.0.7
	num-derive@0.4.2
	nalgebra@0.32.6
	itoa@1.0.11
	regex-automata@0.4.7
	ico@0.3.0
	walkdir@2.5.0
	unicode-width@0.1.13
	proc-macro-crate@1.3.1
	tokio-macros@2.3.0
	metal@0.28.0
	darling_macro@0.20.10
	eframe@0.28.1
	lzma-rs@0.3.0
	semver@1.0.23
	uds_windows@1.1.0
	wayland-scanner@0.31.3
	rand@0.8.5
	async-executor@1.12.0
	objc2@0.5.2
	accesskit@0.12.3
	jni-sys@0.3.0
	hound@3.5.1
	foreign-types-macros@0.2.3
	sync_wrapper@1.0.1
	dlib@0.5.2
	tower@0.4.13
	windows_aarch64_msvc@0.42.2
	if-addrs@0.10.2
	allocator-api2@0.2.18
	async-task@4.7.1
	android_logger@0.14.1
	async-fs@1.6.0
	http-body-util@0.1.2
	rustls-pki-types@1.7.0
	tiny-skia-path@0.11.4
	windows_x86_64_gnullvm@0.52.6
	gloo-net@0.5.0
	zeroize@1.8.1
	async-broadcast@0.7.1
	async-once-cell@0.5.3
	nix@0.27.1
	thread_local@1.1.8
	atspi-proxies@0.3.0
	jobserver@0.1.31
	anyhow@1.0.86
	glutin_wgl_sys@0.5.0
	mdns-sd@0.11.1
	futures-lite@2.3.0
	minimal-lexical@0.2.1
	png@0.17.13
	tungstenite@0.21.0
	arrayvec@0.7.4
	heck@0.5.0
	errno@0.3.9
	symphonia-bundle-mp3@0.5.4
	errno@0.2.8
	windows-core@0.54.0
	aho-corasick@1.1.3
	linux-raw-sys@0.4.14
	ndk@0.8.0
	serde_derive@1.0.204
	khronos-egl@6.0.0
	profiling@1.0.15
	httparse@1.9.4
	oboe@0.6.1
	tracing-log@0.2.0
	object@0.36.1
	winapi-x86_64-pc-windows-gnu@0.4.0
	async-lock@3.4.0
	regex-automata@0.1.10
	parking_lot_core@0.9.10
	smithay-client-toolkit@0.18.1
	console_error_panic_hook@0.1.7
	either@1.13.0
	data-encoding@2.6.0
	chrono@0.4.38
	num_enum_derive@0.7.2
	openssl@0.10.64
	winreg@0.50.0
	async-process@2.2.3
	tungstenite@0.20.1
	windows_aarch64_msvc@0.52.6
	hermit-abi@0.3.9
	foreign-types-shared@0.3.1
	h2@0.4.5
	smallvec@1.13.2
	socket2@0.4.10
	tungstenite@0.23.0
	unicode-normalization@0.1.23
	url@2.5.2
	ahash@0.8.11
	android_log-sys@0.3.1
	xkbcommon-dl@0.4.2
	xshell-macros@0.2.6
	wasm-bindgen-macro-support@0.2.92
	rustc-hash@1.1.0
	tokio-rustls@0.26.0
	spirv@0.3.0+sdk-1.3.268.0
	async-fs@2.1.2
	bzip2-sys@0.1.11+1.0.8
	libredox@0.0.2
	zerocopy@0.7.35
	windows-core@0.58.0
	block2@0.3.0
	termcolor@1.4.1
	tinyvec_macros@0.1.1
	base64@0.21.7
	miniz_oxide@0.7.4
	objc-sys@0.2.0-beta.2
	flate2@1.0.30
	zbus@4.3.1
	libspa@0.8.0
	jack@0.11.4
	openssl-sys@0.9.102
	accesskit_consumer@0.16.1
	ogg@0.8.0
	hyper@1.4.1
	app_dirs2@2.5.5
	rustix@0.37.27
	zbus_names@2.6.1
	generator@0.8.1
	nalgebra-macros@0.2.2
	zstd-safe@7.2.0
	scoped-tls@1.0.1
	ipnet@2.9.0
	rustls-webpki@0.102.5
	signal-hook-registry@1.4.2
	futures-core@0.3.30
	icrate@0.0.4
	foreign-types-shared@0.1.1
	version_check@0.9.4
	serde_urlencoded@0.7.1
	coreaudio-rs@0.11.3
	wasi@0.11.0+wasi-snapshot-preview1
	windows_aarch64_gnullvm@0.48.5
	crc32fast@1.4.2
	utf8parse@0.2.2
	xml-rs@0.8.20
	jack-sys@0.5.1
	redox_users@0.4.5
	xkeysym@0.2.1
	reqwest@0.11.27
	runas@1.2.0
	owned_ttf_parser@0.24.0
	byteorder@1.5.0
	pin-project-internal@1.1.5
	serde_repr@0.1.19
	type-map@0.5.0
	objc_id@0.1.1
	nohash-hasher@0.2.0
	strict-num@0.1.1
	cfg_aliases@0.1.1
	event-listener@2.5.3
	polling@2.8.0
	raw-window-handle@0.5.2
	sync_wrapper@0.1.2
	typenum@1.17.0
	memoffset@0.9.1
	symphonia@0.5.4
	windows-sys@0.52.0
	ab_glyph_rasterizer@0.1.8
	objc2@0.4.1
	windows-interface@0.58.0
	hyper-rustls@0.27.2
	proc-macro2@1.0.86
	approx@0.5.1
	fern@0.6.2
	objc2-encode@3.0.0
	smol_str@0.2.2
	xdg-home@1.2.0
	lockfree-object-pool@0.1.6
	objc2-core-data@0.2.2
	is_terminal_polyfill@1.70.0
	android-properties@0.2.2
	endi@1.1.0
	http@1.1.0
	nvml-wrapper@0.10.0
	rand_core@0.6.4
	sharded-slab@0.1.7
	toml@0.8.14
	home@0.5.9
	windows_i686_msvc@0.42.2
	zbus_macros@3.15.2
	deflate64@0.1.8
	objc2-quartz-core@0.2.2
	objc-sys@0.3.5
	futures-macro@0.3.30
	safe_arch@0.7.2
	nix@0.26.4
	windows@0.54.0
	ident_case@1.0.1
	cexpr@0.6.0
	vcpkg@0.2.15
	glutin_glx_sys@0.5.0
	bindgen@0.69.4
	zvariant@4.1.2
	is-docker@0.2.0
	futures-util@0.3.30
	local-ip-address@0.6.1
	tiny-skia@0.11.4
	unicode-bidi@0.3.15
	block2@0.5.1
	io-lifetimes@1.0.11
	darling_core@0.20.10
	alsa-sys@0.3.1
	renderdoc-sys@1.1.0
	toml_edit@0.21.1
	async-process@1.8.1
	num-complex@0.4.6
	windows@0.58.0
	cesu8@1.1.0
	ndk-sys@0.6.0+11769913
	libc@0.2.155
	num_cpus@1.16.0
	errno-dragonfly@0.1.2
	zip@2.1.3
	wasm-streams@0.4.0
	fastrand@1.9.0
	ash@0.37.3+1.3.251
	static_assertions@1.1.0
	displaydoc@0.2.5
	xcursor@0.3.5
	unicode-segmentation@1.11.0
	accesskit_winit@0.16.1
	hermit-abi@0.4.0
	pico-args@0.5.0
	egui_glow@0.28.1
	fastrand@2.1.0
	web-sys@0.3.69
	web-time@0.2.4
	windows-sys@0.45.0
	zstd@0.13.2
	filetime@0.2.23
	untrusted@0.9.0
	alsa@0.9.0
	target-lexicon@0.12.15
	windows_aarch64_msvc@0.48.5
	winreg@0.52.0
	sctk-adwaita@0.8.3
	adler@1.0.2
	windows_x86_64_gnu@0.48.5
	wasm-bindgen-backend@0.2.92
	time@0.3.36
	winapi-i686-pc-windows-gnu@0.4.0
	memoffset@0.7.1
	serde_spanned@0.6.6
	ecolor@0.28.1
	zstd-sys@2.0.12+zstd.1.5.6
	symphonia-core@0.5.4
	mime@0.3.17
	pin-project@1.1.5
	objc2-metal@0.2.2
	toml_datetime@0.6.6
	android-activity@0.5.2
	pipewire@0.8.0
	pollster@0.3.0
	syn@2.0.70
	atspi-common@0.3.0
	nanorand@0.7.0
	arrayref@0.3.7
	rustix@0.38.34
	core-foundation@0.9.4
	http-body@0.4.6
	nix@0.29.0
	deranged@0.3.11
	ndk-sys@0.5.0+25.2.9519653
	strsim@0.11.1
	clipboard-win@5.4.0
	objc2-encode@4.0.3
	raw-window-handle@0.6.2
	windows_aarch64_gnullvm@0.42.2
	bit-vec@0.6.3
	cfg_aliases@0.2.1
	num-rational@0.4.2
	cgl@0.3.2
	async-io@1.13.0
	cookie-factory@0.3.3
	downcast-rs@1.2.1
	atspi@0.19.0
	quote@1.0.36
	wasm-bindgen-macro@0.2.92
	wide@0.7.25
	dasp_sample@0.11.0
	egui-wgpu@0.28.1
	x11rb-protocol@0.13.1
	lazy_static@1.5.0
	serde_json@1.0.120
	core-graphics@0.23.2
	gimli@0.29.0
	anstyle-query@1.1.0
	webbrowser@1.0.1
	block-buffer@0.10.4
	windows_x86_64_msvc@0.42.2
	cros-libva@0.0.6
	tower-service@0.3.2
	xdg@2.5.2
	bit-set@0.5.3
	zbus_macros@4.3.1
	objc2@0.3.0-beta.3.patch-leaks.3
	inout@0.1.3
	nom@7.1.3
	same-file@1.0.6
	rawpointer@0.2.1
	windows_x86_64_gnullvm@0.48.5
	futures-executor@0.3.30
	coreaudio-sys@0.2.15
	system-configuration@0.5.1
	egui@0.28.1
	want@0.3.1
	windows_x86_64_msvc@0.52.6
	hyper@0.14.30
	windows@0.52.0
	foreign-types@0.3.2
	lewton@0.10.2
	zvariant_utils@2.0.0
	slab@0.4.9
	com_macros@0.6.0
	bincode@1.3.3
	wasm-bindgen@0.2.92
	ash@0.38.0+1.3.281
	bitflags@1.3.2
	js-sys@0.3.69
	windows_i686_msvc@0.52.6
	clang-sys@1.8.1
	simd-adler32@0.3.7
	hyper-util@0.1.6
	zvariant_derive@4.1.2
	aes@0.8.4
	tracing-attributes@0.1.27
	flume@0.11.0
	iana-time-zone@0.1.60
	litrs@0.4.1
	gpu-alloc-types@0.3.0
	schannel@0.1.23
	openssl-probe@0.1.5
	wayland-client@0.31.4
	thiserror-impl@1.0.61
	neli@0.6.4
	redox_syscall@0.3.5
	ordered-stream@0.2.0
	tracy-client-sys@0.22.2
	com_macros_support@0.6.0
	android-activity@0.6.0
	nu-ansi-term@0.46.0
	objc2-encode@2.0.0-pre.2
	form_urlencoded@1.2.1
	wayland-protocols-plasma@0.2.0
	reqwest@0.12.5
	rfd@0.14.1
	whoami@1.5.1
	cipher@0.4.4
	pbkdf2@0.12.2
	sysinfo@0.30.13
	rustversion@1.0.17
	error-code@3.2.0
	num-integer@0.1.46
	redox_syscall@0.5.2
	colorchoice@1.0.1
	gl_generator@0.14.0
	windows-targets@0.48.5
	async-net@2.0.0
	cfg-if@1.0.0
	epaint@0.28.1
	exec@0.3.1
	xshell@0.2.6
	image@0.25.1
	thiserror@1.0.61
	bytemuck_derive@1.7.0
	derivative@2.2.0
	tokio-util@0.7.11
	glow@0.13.1
	version-compare@0.2.0
	rustc-demangle@0.1.24
	as-raw-xcb-connection@1.0.1
	khronos_api@3.1.0
	malloc_buf@0.0.6
	valuable@0.1.0
	annotate-snippets@0.9.2
	system-deps@6.2.2
	wrapcenum-derive@0.4.1
	windows_x86_64_gnullvm@0.42.2
	regex-syntax@0.6.29
	x11-dl@2.21.0
	statrs@0.17.1
	gpu-allocator@0.25.0
	autocfg@1.3.0
	winres@0.1.12
	convert_case@0.6.0
	block@0.1.6
	nvml-wrapper-sys@0.8.0
	powerfmt@0.2.0
	arboard@3.4.0
	memmap2@0.9.4
	neli-proc-macros@0.1.3
	security-framework@2.11.0
	constant_time_eq@0.3.0
	core-graphics-types@0.1.3
	futures-lite@1.13.0
	redox_syscall@0.4.1
	naga@0.20.0
	zvariant_utils@1.0.1
	winnow@0.6.13
	codespan-reporting@0.11.1
	windows-sys@0.48.0
	mio@0.8.11
	subtle@2.6.1
	num-conv@0.1.0
	glutin_egl_sys@0.6.0
	simba@0.8.1
	libredox@0.1.3
	open@5.3.0
	wasm-logger@0.2.0
	wgpu-hal@0.21.1
	windows_i686_gnu@0.52.6
	libloading@0.7.4
	core-foundation-sys@0.8.6
	rand_chacha@0.3.1
	tokio@1.38.0
	instant@0.1.13
	bytemuck@1.16.1
	gpu-alloc@0.6.0
	syn@1.0.109
	windows_i686_gnu@0.48.5
	libspa-sys@0.8.0
	tar@0.4.41
	scopeguard@1.2.0
	tracing-subscriber@0.3.18
	bumpalo@3.16.0
	quinn-udp@0.5.2
	cfg-expr@0.15.8
	webpki-roots@0.26.3
	httpdate@1.0.3
	enumflags2@0.7.10
	calloop@0.12.4
	security-framework-sys@2.11.0
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
