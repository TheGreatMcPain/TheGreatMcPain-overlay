# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	ab_glyph@0.2.29
	ab_glyph_rasterizer@0.1.8
	accesskit@0.17.1
	accesskit_atspi_common@0.10.1
	accesskit_consumer@0.26.0
	accesskit_macos@0.18.1
	accesskit_unix@0.13.1
	accesskit_windows@0.24.1
	accesskit_winit@0.23.1
	addr2line@0.24.2
	adler2@2.0.0
	aes@0.8.4
	ahash@0.8.11
	aho-corasick@1.1.3
	alsa-sys@0.3.1
	alsa@0.9.1
	android-activity@0.6.0
	android-properties@0.2.2
	android-tzdata@0.1.1
	android_log-sys@0.3.1
	android_logger@0.14.1
	android_system_properties@0.1.5
	annotate-snippets@0.9.2
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	anyhow@1.0.96
	app_dirs2@2.5.5
	approx@0.5.1
	arbitrary@1.4.1
	arboard@3.4.1
	arrayref@0.3.9
	arrayvec@0.7.6
	as-raw-xcb-connection@1.0.1
	ash@0.38.0+1.3.281
	ashpd@0.8.1
	async-broadcast@0.7.2
	async-channel@2.3.1
	async-executor@1.13.1
	async-fs@2.1.2
	async-io@2.4.0
	async-lock@3.4.0
	async-net@2.0.0
	async-process@2.3.0
	async-recursion@1.1.1
	async-signal@0.2.10
	async-task@4.7.1
	async-trait@0.1.86
	atomic-waker@1.1.2
	atspi-common@0.6.0
	atspi-connection@0.6.0
	atspi-proxies@0.6.0
	atspi@0.22.0
	autocfg@1.4.0
	backtrace@0.3.74
	base64@0.21.7
	base64@0.22.1
	bincode@1.3.3
	bindgen@0.69.5
	bindgen@0.70.1
	bindgen@0.71.1
	bit-set@0.8.0
	bit-vec@0.8.0
	bitflags@1.3.2
	bitflags@2.8.0
	block-buffer@0.10.4
	block2@0.5.1
	block@0.1.6
	blocking@1.6.1
	bumpalo@3.17.0
	bytemuck@1.21.0
	bytemuck_derive@1.8.1
	byteorder-lite@0.1.0
	byteorder@1.5.0
	bytes@1.10.0
	bzip2-sys@0.1.12+1.0.8
	bzip2@0.5.1
	calloop-wayland-source@0.3.0
	calloop@0.13.0
	cc@1.2.15
	cesu8@1.1.0
	cexpr@0.6.0
	cfg-expr@0.15.8
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	cgl@0.3.2
	chrono@0.4.40
	cipher@0.4.4
	clang-sys@1.8.1
	claxon@0.4.3
	clipboard-win@5.4.0
	codespan-reporting@0.11.1
	colorchoice@1.0.3
	combine@4.6.7
	concurrent-queue@2.5.0
	constant_time_eq@0.3.1
	convert_case@0.6.0
	cookie-factory@0.3.3
	cookie@0.18.1
	cookie_store@0.21.1
	core-foundation-sys@0.8.7
	core-foundation@0.10.0
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.23.2
	coreaudio-rs@0.11.3
	coreaudio-sys@0.2.16
	cpal@0.15.3
	cpufeatures@0.2.17
	crc-catalog@2.4.0
	crc32fast@1.4.2
	crc@3.2.1
	cros-libva@0.0.7
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crypto-common@0.1.6
	cursor-icon@1.1.0
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	dasp_sample@0.11.0
	data-encoding@2.8.0
	deflate64@0.1.9
	deranged@0.3.11
	derive_arbitrary@1.4.1
	digest@0.10.7
	dirs-sys@0.5.0
	dirs@6.0.0
	dispatch@0.2.0
	displaydoc@0.2.5
	dlib@0.5.2
	document-features@0.2.11
	downcast-rs@1.2.1
	dpi@0.1.1
	ecolor@0.31.0
	eframe@0.31.0
	egui-wgpu@0.31.0
	egui-winit@0.31.0
	egui@0.31.0
	egui_glow@0.31.0
	either@1.14.0
	emath@0.31.0
	encoding_rs@0.8.35
	encoding_rs_io@0.1.7
	endi@1.1.0
	enumflags2@0.7.11
	enumflags2_derive@0.7.11
	env_filter@0.1.3
	env_logger@0.11.6
	epaint@0.31.0
	epaint_default_fonts@0.31.0
	equivalent@1.0.2
	errno-dragonfly@0.1.2
	errno@0.2.8
	errno@0.3.10
	error-code@3.3.1
	event-listener-strategy@0.5.3
	event-listener@5.4.0
	exec@0.3.1
	fastrand@2.3.0
	fdeflate@0.3.7
	fern@0.7.1
	filetime@0.2.25
	flate2@1.1.0
	flume@0.11.1
	fnv@1.0.7
	foldhash@0.1.4
	foreign-types-macros@0.2.3
	foreign-types-shared@0.1.1
	foreign-types-shared@0.3.1
	foreign-types@0.3.2
	foreign-types@0.5.0
	form_urlencoded@1.2.1
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-lite@2.6.0
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	generator@0.8.4
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.15
	getrandom@0.3.1
	gimli@0.31.1
	gl_generator@0.14.0
	glam@0.30.0
	glob@0.3.2
	glow@0.16.0
	glutin-winit@0.5.0
	glutin@0.32.2
	glutin_egl_sys@0.7.1
	glutin_glx_sys@0.6.1
	glutin_wgl_sys@0.6.1
	glyph_brush_layout@0.2.4
	gpu-alloc-types@0.3.0
	gpu-alloc@0.6.0
	gpu-allocator@0.27.0
	gpu-descriptor-types@0.2.0
	gpu-descriptor@0.3.1
	h2@0.3.26
	h2@0.4.8
	hashbrown@0.15.2
	headers-core@0.2.0
	headers@0.3.9
	heck@0.5.0
	hermit-abi@0.4.0
	hex@0.4.3
	hexf-parse@0.2.1
	hmac@0.12.1
	home@0.5.11
	hound@3.5.1
	http-body-util@0.1.2
	http-body@0.4.6
	http-body@1.0.1
	http@0.2.12
	http@1.2.0
	httparse@1.10.0
	httpdate@1.0.3
	humantime@2.1.0
	hyper-rustls@0.27.5
	hyper-tls@0.5.0
	hyper-util@0.1.10
	hyper@0.14.32
	hyper@1.6.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	ico@0.4.0
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	ident_case@1.0.1
	idna@1.0.3
	idna_adapter@1.2.0
	if-addrs@0.13.3
	image@0.25.5
	immutable-chunkmap@2.0.6
	indexmap@2.7.1
	inout@0.1.4
	ipnet@2.11.0
	is-docker@0.2.0
	is-wsl@0.4.0
	is_terminal_polyfill@1.70.1
	itertools@0.12.1
	itertools@0.13.0
	itoa@1.0.14
	jni-sys@0.3.0
	jni@0.21.1
	jobserver@0.1.32
	jpeg-decoder@0.3.1
	js-sys@0.3.77
	khronos-egl@6.0.0
	khronos_api@3.1.0
	lazy_static@1.5.0
	lazycell@1.3.0
	lewton@0.10.2
	libc@0.2.170
	libloading@0.8.6
	libm@0.2.11
	libredox@0.1.3
	libspa-sys@0.8.0
	libspa@0.8.0
	linux-raw-sys@0.4.15
	litemap@0.7.5
	litrs@0.4.1
	local-ip-address@0.6.3
	lock_api@0.4.12
	lockfree-object-pool@0.1.6
	log@0.4.26
	loom@0.7.2
	lzma-rs@0.3.0
	mach2@0.4.2
	malloc_buf@0.0.6
	matchers@0.1.0
	matrixmultiply@0.3.9
	mdns-sd@0.13.2
	memchr@2.7.4
	memmap2@0.9.5
	memoffset@0.9.1
	metal@0.31.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.8.5
	mio@1.0.3
	naga@24.0.0
	nalgebra@0.33.2
	nanorand@0.7.0
	native-tls@0.2.14
	ndk-context@0.1.1
	ndk-sys@0.5.0+25.2.9519653
	ndk-sys@0.6.0+11769913
	ndk@0.8.0
	ndk@0.9.0
	neli-proc-macros@0.1.4
	neli@0.6.5
	nix@0.27.1
	nix@0.29.0
	nohash-hasher@0.2.0
	nom@7.1.3
	ntapi@0.4.1
	nu-ansi-term@0.46.0
	num-bigint@0.4.6
	num-complex@0.4.6
	num-conv@0.1.0
	num-derive@0.4.2
	num-integer@0.1.46
	num-rational@0.4.2
	num-traits@0.2.19
	num_enum@0.7.3
	num_enum_derive@0.7.3
	nvml-wrapper-sys@0.8.0
	nvml-wrapper@0.10.0
	objc-foundation@0.1.1
	objc-sys@0.3.5
	objc2-app-kit@0.2.2
	objc2-cloud-kit@0.2.2
	objc2-contacts@0.2.2
	objc2-core-data@0.2.2
	objc2-core-image@0.2.2
	objc2-core-location@0.2.2
	objc2-encode@4.1.0
	objc2-foundation@0.2.2
	objc2-link-presentation@0.2.2
	objc2-metal@0.2.2
	objc2-quartz-core@0.2.2
	objc2-symbols@0.2.2
	objc2-ui-kit@0.2.2
	objc2-uniform-type-identifiers@0.2.2
	objc2-user-notifications@0.2.2
	objc2@0.5.2
	objc@0.2.7
	objc_id@0.1.1
	object@0.36.7
	oboe-sys@0.6.1
	oboe@0.6.1
	ogg@0.8.0
	once_cell@1.20.3
	open@5.3.2
	openssl-macros@0.1.1
	openssl-probe@0.1.6
	openssl-sys@0.9.106
	openssl@0.10.71
	option-ext@0.2.0
	orbclient@0.3.48
	ordered-float@4.6.0
	ordered-stream@0.2.0
	overload@0.1.1
	owned_ttf_parser@0.25.0
	parking@2.2.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	pathdiff@0.2.3
	pbkdf2@0.12.2
	percent-encoding@2.3.1
	pico-args@0.5.0
	pin-project-internal@1.1.9
	pin-project-lite@0.2.16
	pin-project@1.1.9
	pin-utils@0.1.0
	piper@0.2.4
	pipewire-sys@0.8.0
	pipewire@0.8.0
	pkg-config@0.3.31
	png@0.17.16
	polling@3.7.4
	pollster@0.3.0
	pollster@0.4.0
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	presser@0.3.1
	prettyplease@0.2.29
	proc-macro-crate@3.2.0
	proc-macro2@1.0.93
	profiling-procmacros@1.0.16
	profiling@1.0.16
	quick-xml@0.30.0
	quick-xml@0.37.2
	quinn-proto@0.11.9
	quinn-udp@0.5.10
	quinn@0.11.6
	quote@1.0.38
	rand@0.8.5
	rand@0.9.0
	rand_chacha@0.3.1
	rand_chacha@0.9.0
	rand_core@0.6.4
	rand_core@0.9.2
	rand_distr@0.4.3
	range-alloc@0.1.4
	raw-window-handle@0.6.2
	rawpointer@0.2.1
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.4.1
	redox_syscall@0.5.9
	redox_users@0.5.0
	regex-automata@0.1.10
	regex-automata@0.4.9
	regex-syntax@0.6.29
	regex-syntax@0.8.5
	regex@1.11.1
	renderdoc-sys@1.1.0
	reqwest@0.11.27
	reqwest@0.12.12
	rfd@0.14.1
	ring@0.17.11
	rodio@0.20.1
	rosc@0.10.1
	runas@1.2.0
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustc-hash@2.1.1
	rustix@0.38.44
	rustls-pemfile@1.0.4
	rustls-pemfile@2.2.0
	rustls-pki-types@1.11.0
	rustls-webpki@0.102.8
	rustls@0.23.23
	rustversion@1.0.19
	ryu@1.0.19
	safe_arch@0.7.4
	same-file@1.0.6
	schannel@0.1.27
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sctk-adwaita@0.10.1
	security-framework-sys@2.14.0
	security-framework@2.11.1
	semver@1.0.25
	serde@1.0.218
	serde_derive@1.0.218
	serde_json@1.0.139
	serde_repr@0.1.19
	serde_spanned@0.6.8
	serde_urlencoded@0.7.1
	sha1@0.10.6
	sharded-slab@0.1.7
	shlex@1.3.0
	signal-hook-registry@1.4.2
	simba@0.9.0
	simd-adler32@0.3.7
	slab@0.4.9
	slotmap@1.0.7
	smallvec@1.14.0
	smithay-client-toolkit@0.19.2
	smithay-clipboard@0.7.2
	smol_str@0.2.2
	socket2@0.5.8
	spin@0.9.8
	spirv@0.3.0+sdk-1.3.268.0
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	statrs@0.18.0
	strict-num@0.1.1
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	symphonia-bundle-mp3@0.5.4
	symphonia-core@0.5.4
	symphonia-metadata@0.5.4
	symphonia@0.5.4
	syn@1.0.109
	syn@2.0.98
	sync_wrapper@0.1.2
	sync_wrapper@1.0.2
	synstructure@0.13.1
	sysinfo@0.33.1
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	system-deps@6.2.2
	tar@0.4.44
	target-lexicon@0.12.16
	tempfile@3.17.1
	termcolor@1.4.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.11
	thiserror@1.0.69
	thiserror@2.0.11
	thread_local@1.1.8
	tiff@0.9.1
	time-core@0.1.2
	time-macros@0.2.19
	time@0.3.37
	tiny-skia-path@0.11.4
	tiny-skia@0.11.4
	tinystr@0.7.6
	tinyvec@1.8.1
	tinyvec_macros@0.1.1
	tokio-macros@2.5.0
	tokio-native-tls@0.3.1
	tokio-rustls@0.26.1
	tokio-tungstenite@0.20.1
	tokio-util@0.7.13
	tokio@1.43.0
	toml@0.5.11
	toml@0.8.20
	toml_datetime@0.6.8
	toml_edit@0.22.24
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.2
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing-log@0.2.0
	tracing-subscriber@0.3.19
	tracing@0.1.41
	tracy-client-sys@0.24.3
	tracy-client@0.17.6
	try-lock@0.2.5
	ttf-parser@0.25.1
	tungstenite@0.20.1
	tungstenite@0.26.2
	type-map@0.5.0
	typenum@1.18.0
	uds_windows@1.1.0
	unicode-ident@1.0.17
	unicode-segmentation@1.12.0
	unicode-width@0.1.14
	unicode-xid@0.2.6
	untrusted@0.9.0
	ureq-proto@0.3.2
	ureq@3.0.6
	url@2.5.4
	urlencoding@2.1.3
	utf-8@0.7.6
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.2
	valuable@0.1.1
	vcpkg@0.2.15
	version-compare@0.2.0
	version_check@0.9.5
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.13.3+wasi-0.2.2
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-futures@0.4.50
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	wasm-streams@0.4.2
	wayland-backend@0.3.8
	wayland-client@0.31.8
	wayland-csd-frame@0.3.0
	wayland-cursor@0.31.8
	wayland-protocols-plasma@0.3.6
	wayland-protocols-wlr@0.3.6
	wayland-protocols@0.32.6
	wayland-scanner@0.31.6
	wayland-sys@0.31.6
	web-sys@0.3.77
	web-time@1.1.0
	webbrowser@1.0.3
	webpki-roots@0.26.8
	weezl@0.1.8
	wgpu-core@24.0.0
	wgpu-hal@24.0.0
	wgpu-types@24.0.0
	wgpu@24.0.1
	which@4.4.2
	wide@0.7.32
	widestring@1.1.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-collections@0.1.1
	windows-core@0.52.0
	windows-core@0.54.0
	windows-core@0.57.0
	windows-core@0.58.0
	windows-core@0.60.1
	windows-future@0.1.1
	windows-implement@0.57.0
	windows-implement@0.58.0
	windows-implement@0.59.0
	windows-interface@0.57.0
	windows-interface@0.58.0
	windows-interface@0.59.0
	windows-link@0.1.0
	windows-numerics@0.1.1
	windows-registry@0.2.0
	windows-result@0.1.2
	windows-result@0.2.0
	windows-result@0.3.1
	windows-strings@0.1.0
	windows-strings@0.3.1
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.54.0
	windows@0.57.0
	windows@0.58.0
	windows@0.60.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winit@0.30.9
	winnow@0.7.3
	winreg@0.50.0
	winres@0.1.12
	wit-bindgen-rt@0.33.0
	wrapcenum-derive@0.4.1
	write16@1.0.0
	writeable@0.5.5
	x11-dl@2.21.0
	x11rb-protocol@0.13.1
	x11rb@0.13.1
	xattr@1.4.0
	xcursor@0.3.8
	xdg-home@1.3.0
	xdg@2.5.2
	xi-unicode@0.3.0
	xkbcommon-dl@0.4.2
	xkeysym@0.2.1
	xml-rs@0.8.25
	xshell-macros@0.2.7
	xshell@0.2.7
	yansi-term@0.1.2
	yoke-derive@0.7.5
	yoke@0.7.5
	zbus-lockstep-macros@0.4.4
	zbus-lockstep@0.4.4
	zbus@4.4.0
	zbus_macros@4.4.0
	zbus_names@3.0.0
	zbus_xml@4.0.0
	zerocopy-derive@0.7.35
	zerocopy-derive@0.8.20
	zerocopy@0.7.35
	zerocopy@0.8.20
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zeroize@1.8.1
	zeroize_derive@1.4.2
	zerovec-derive@0.10.3
	zerovec@0.10.4
	zip@2.2.3
	zopfli@0.8.1
	zstd-safe@7.2.3
	zstd-sys@2.0.14+zstd.1.5.7
	zstd@0.13.3
	zvariant@4.2.0
	zvariant_derive@4.2.0
	zvariant_utils@2.1.0
"

inherit flag-o-matic desktop cargo rust-toolchain xdg git-r3

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

	cp "${FILESDIR}/0001-configure-fix-nvcc.patch" "${S}/alvr/xtask/patches/" || die
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
		magick alvr/dashboard/resources/dashboard.ico \
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
