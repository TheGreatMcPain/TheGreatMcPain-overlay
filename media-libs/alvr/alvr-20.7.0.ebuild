# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	http-body@1.0.0
	proc-macro-crate@1.3.1
	rawpointer@0.2.1
	glutin-winit@0.4.2
	windows_aarch64_msvc@0.52.4
	fastrand@1.9.0
	accesskit_windows@0.15.1
	oboe@0.6.1
	base64ct@1.6.0
	raw-window-handle@0.6.0
	humantime@2.1.0
	zvariant_derive@4.0.2
	fern@0.6.2
	wasm-bindgen@0.2.92
	block-sys@0.2.1
	foreign-types-shared@0.1.1
	futures-macro@0.3.30
	num-rational@0.4.1
	glutin_egl_sys@0.6.0
	wgpu@0.19.3
	syn@1.0.109
	xml-rs@0.8.19
	bit-vec@0.6.3
	dirs-sys@0.4.1
	anyhow@1.0.81
	zerocopy-derive@0.7.32
	windows-sys@0.45.0
	hyper@0.14.28
	windows_aarch64_msvc@0.42.2
	simba@0.6.0
	rustls@0.22.2
	windows_x86_64_gnullvm@0.48.5
	khronos-egl@6.0.0
	wayland-protocols-plasma@0.2.0
	tokio@1.36.0
	tracing-log@0.2.0
	sync_wrapper@0.1.2
	password-hash@0.4.2
	jni@0.21.1
	nalgebra@0.29.0
	rustc-hash@1.1.0
	anstyle-wincon@3.0.2
	tracing-subscriber@0.3.18
	accesskit_unix@0.6.2
	aes@0.8.4
	errno@0.3.8
	windows_x86_64_msvc@0.48.5
	khronos_api@3.1.0
	winapi@0.3.9
	libloading@0.7.4
	ab_glyph@0.2.23
	mio@0.8.11
	android_logger@0.13.3
	bit-set@0.5.3
	quick-xml@0.31.0
	xi-unicode@0.3.0
	android_system_properties@0.1.5
	bumpalo@3.15.4
	enumflags2_derive@0.7.9
	foreign-types-shared@0.3.1
	h2@0.4.3
	nvml-wrapper-sys@0.8.0
	smallvec@1.13.2
	tower-service@0.3.2
	windows_i686_msvc@0.42.2
	futures@0.3.30
	windows_x86_64_gnullvm@0.52.4
	env_filter@0.1.0
	itoa@1.0.10
	thiserror-impl@1.0.58
	windows_x86_64_gnu@0.48.5
	epaint@0.27.1
	block@0.1.6
	wrapcenum-derive@0.4.1
	objc-sys@0.2.0-beta.2
	ntapi@0.4.1
	gpu-descriptor-types@0.1.2
	paste@1.0.14
	rand_chacha@0.3.1
	security-framework-sys@2.9.1
	tokio-rustls@0.25.0
	wasite@0.1.0
	arrayvec@0.7.4
	safe_arch@0.7.1
	owned_ttf_parser@0.20.0
	allocator-api2@0.2.16
	generic-array@0.14.7
	signal-hook-registry@1.4.1
	zvariant_derive@3.15.1
	error-code@3.2.0
	profiling@1.0.15
	accesskit@0.12.3
	tokio-macros@2.2.0
	unicode-ident@1.0.12
	rand@0.8.5
	tokio-util@0.7.10
	xcursor@0.3.5
	base64@0.21.7
	zip@0.6.6
	nvml-wrapper@0.10.0
	spirv@0.3.0+sdk-1.3.268.0
	redox_users@0.4.4
	tinyvec_macros@0.1.1
	gimli@0.28.1
	unicode-segmentation@1.11.0
	hassle-rs@0.11.0
	piper@0.2.1
	bzip2@0.4.4
	egui-wgpu@0.27.1
	symphonia-core@0.5.4
	symphonia-metadata@0.5.4
	zerocopy@0.7.32
	atspi-connection@0.3.0
	num_enum_derive@0.7.2
	jni-sys@0.3.0
	hex@0.4.3
	async-recursion@1.1.0
	android-activity@0.5.2
	bitflags@2.5.0
	ewebsock@0.5.0
	atspi-common@0.3.0
	core-graphics-types@0.1.3
	proc-macro2@1.0.79
	foreign-types@0.5.0
	ident_case@1.0.1
	scoped-tls@1.0.1
	tracing-attributes@0.1.27
	bytes@1.5.0
	objc-foundation@0.1.1
	iana-time-zone@0.1.60
	option-ext@0.2.0
	windows-interface@0.48.0
	xkbcommon-dl@0.4.2
	exec@0.3.1
	windows-sys@0.52.0
	event-listener@4.0.3
	serde@1.0.197
	httpdate@1.0.3
	socket2@0.4.10
	wasm-bindgen-backend@0.2.92
	flume@0.11.0
	glam@0.26.0
	errno@0.2.8
	ico@0.3.0
	cursor-icon@1.1.0
	rand_distr@0.4.3
	core-graphics@0.23.1
	async-once-cell@0.5.3
	dispatch@0.2.0
	windows_i686_gnu@0.48.5
	waker-fn@1.1.1
	atspi@0.19.0
	anstyle-parse@0.2.3
	cfg_aliases@0.1.1
	matchers@0.1.0
	webpki-roots@0.26.1
	libloading@0.8.3
	native-tls@0.2.11
	memoffset@0.9.0
	xdg@2.5.2
	sharded-slab@0.1.7
	colorchoice@1.0.0
	lewton@0.10.2
	block2@0.2.0-alpha.6
	com@0.6.0
	utf8parse@0.2.1
	png@0.17.13
	rand_core@0.6.4
	spin@0.9.8
	smithay-clipboard@0.7.1
	async-trait@0.1.78
	atomic-waker@1.1.2
	reqwest@0.12.0
	objc-sys@0.3.2
	object@0.32.2
	darling@0.20.8
	windows@0.54.0
	encoding_rs_io@0.1.7
	slotmap@1.0.7
	hyper-util@0.1.3
	digest@0.10.7
	windows_aarch64_msvc@0.48.5
	rustls-webpki@0.102.2
	windows_x86_64_gnu@0.52.4
	futures-sink@0.3.30
	cocoa-foundation@0.1.2
	bindgen@0.69.4
	windows_aarch64_gnullvm@0.48.5
	clipboard-win@5.3.0
	ndk@0.8.0
	anstyle@1.0.6
	time@0.3.34
	xshell-macros@0.2.5
	emath@0.27.1
	ashpd@0.8.1
	wasm-bindgen-macro-support@0.2.92
	concurrent-queue@2.4.0
	ash@0.37.3+1.3.251
	unicode-width@0.1.11
	windows_x86_64_gnu@0.42.2
	constant_time_eq@0.1.5
	num-derive@0.4.2
	event-listener-strategy@0.4.0
	simd-adler32@0.3.7
	tracy-client-sys@0.22.2
	iana-time-zone-haiku@0.1.2
	memmap2@0.9.4
	atspi-proxies@0.3.0
	percent-encoding@2.3.1
	glob@0.3.1
	lazy_static@1.4.0
	objc2@0.4.1
	wayland-protocols-wlr@0.2.0
	neli-proc-macros@0.1.3
	nix@0.28.0
	calloop-wayland-source@0.2.0
	com_macros@0.6.0
	crc32fast@1.4.0
	rustc-demangle@0.1.23
	ryu@1.0.17
	type-map@0.5.0
	tungstenite@0.20.1
	core-foundation@0.9.4
	async-process@1.8.1
	naga@0.19.2
	objc2@0.3.0-beta.3.patch-leaks.3
	indexmap@2.2.5
	rosc@0.10.1
	generator@0.7.5
	nix@0.26.4
	android_log-sys@0.3.1
	x11-dl@2.21.0
	autocfg@1.1.0
	calloop@0.12.4
	wayland-sys@0.31.1
	xdg-home@1.1.0
	async-lock@2.8.0
	ahash@0.8.11
	equivalent@1.0.1
	zstd-sys@2.0.9+zstd.1.5.5
	blocking@1.5.1
	system-configuration@0.5.1
	rustls-pki-types@1.3.1
	futures-io@0.3.30
	socket2@0.5.6
	alsa@0.9.0
	futures-lite@1.13.0
	serde_json@1.0.114
	schannel@0.1.23
	orbclient@0.3.47
	http@0.2.12
	env_logger@0.10.2
	thread_local@1.1.8
	windows-targets@0.42.2
	wayland-csd-frame@0.3.0
	http-body@0.4.6
	zvariant@4.0.2
	foreign-types@0.3.2
	fastrand@2.0.1
	tinyvec@1.6.0
	gl_generator@0.14.0
	dlib@0.5.2
	tiny-skia@0.11.4
	ndk-context@0.1.1
	gloo-utils@0.2.0
	anstyle-query@1.0.2
	sctk-adwaita@0.8.1
	num-conv@0.1.0
	cocoa@0.25.0
	tower-layer@0.3.2
	aho-corasick@1.1.3
	tracy-client@0.17.0
	objc2-encode@2.0.0-pre.2
	pkg-config@0.3.30
	encoding_rs@0.8.33
	x11rb@0.13.0
	nom@7.1.3
	bzip2-sys@0.1.11+1.0.8
	event-listener@5.2.0
	is-docker@0.2.0
	dasp_sample@0.11.0
	untrusted@0.9.0
	windows-core@0.52.0
	security-framework@2.9.2
	async-fs@2.1.1
	bitflags@1.3.2
	malloc_buf@0.0.6
	powerfmt@0.2.0
	sha1@0.10.6
	async-io@2.3.2
	subtle@2.5.0
	loom@0.7.1
	zvariant_utils@1.1.0
	egui-winit@0.27.1
	crossbeam-utils@0.8.19
	strsim@0.10.0
	lazycell@1.3.0
	tungstenite@0.21.0
	windows-targets@0.52.4
	parking@2.2.0
	hyper@1.2.0
	neli@0.6.4
	glow@0.13.1
	xattr@1.3.1
	darling_core@0.20.8
	wayland-scanner@0.31.1
	pin-project-internal@1.1.5
	urlencoding@2.1.3
	regex-automata@0.1.10
	tower@0.4.13
	foreign-types-macros@0.2.3
	unicode-xid@0.2.4
	zbus@4.1.2
	winapi-x86_64-pc-windows-gnu@0.4.0
	ecolor@0.27.1
	addr2line@0.21.0
	egui@0.27.1
	env_logger@0.11.3
	winreg@0.50.0
	libredox@0.0.1
	gpu-descriptor@0.2.4
	sha2@0.10.8
	fdeflate@0.3.4
	pin-utils@0.1.0
	document-features@0.2.8
	deranged@0.3.11
	polling@2.8.0
	app_dirs2@2.5.5
	async-net@2.0.0
	syn@2.0.53
	winit@0.29.15
	coreaudio-rs@0.11.3
	icrate@0.0.4
	num_enum@0.7.2
	pbkdf2@0.11.0
	windows_i686_gnu@0.42.2
	windows_aarch64_gnullvm@0.42.2
	log@0.4.21
	enumflags2@0.7.9
	ab_glyph_rasterizer@0.1.8
	hermit-abi@0.3.9
	windows@0.52.0
	hexf-parse@0.2.1
	http@1.1.0
	backtrace@0.3.69
	rustix@0.38.32
	form_urlencoded@1.2.1
	openssl-sys@0.9.101
	arboard@3.3.2
	jack-sys@0.5.1
	oboe-sys@0.6.1
	downcast-rs@1.2.0
	rustix@0.37.27
	block-sys@0.1.0-beta.1
	httparse@1.8.0
	libc@0.2.153
	tracing@0.1.40
	jack@0.11.4
	libm@0.2.8
	bytemuck_derive@1.6.0
	parking_lot@0.12.1
	winres@0.1.12
	glutin@0.31.3
	rustls-pemfile@1.0.4
	utf-8@0.7.6
	async-task@4.7.0
	windows-implement@0.48.0
	unicode-bidi@0.3.15
	libredox@0.0.2
	nanorand@0.7.0
	windows_x86_64_msvc@0.52.4
	open@5.1.2
	openssl-macros@0.1.1
	futures-task@0.3.30
	renderdoc-sys@1.1.0
	rodio@0.17.3
	zeroize@1.7.0
	miniz_oxide@0.7.2
	ndk-sys@0.5.0+25.2.9519653
	slab@0.4.9
	pico-args@0.5.0
	ordered-stream@0.2.0
	valuable@0.1.0
	memchr@2.7.1
	jobserver@0.1.28
	scopeguard@1.2.0
	crypto-common@0.1.6
	serde_urlencoded@0.7.1
	cc@1.0.90
	if-addrs@0.10.2
	windows@0.48.0
	zstd@0.11.2+zstd.1.5.2
	accesskit_consumer@0.16.1
	windows-sys@0.48.0
	event-listener-strategy@0.5.0
	windows_i686_msvc@0.48.5
	headers@0.3.9
	wayland-client@0.31.2
	android-properties@0.2.2
	zvariant@3.15.1
	tempfile@3.10.1
	cgl@0.3.2
	nu-ansi-term@0.46.0
	nalgebra-macros@0.1.0
	accesskit_macos@0.10.1
	futures-channel@0.3.30
	async-signal@0.2.5
	hound@3.5.1
	hashbrown@0.14.3
	symphonia-bundle-mp3@0.5.4
	hmac@0.12.1
	serde_repr@0.1.18
	combine@4.6.6
	gpu-alloc-types@0.3.0
	inout@0.1.3
	zbus_names@2.6.1
	memoffset@0.7.1
	dirs@5.0.1
	version_check@0.9.4
	mime@0.3.17
	com_macros_support@0.6.0
	cipher@0.4.4
	tracing-core@0.1.32
	rustversion@1.0.14
	is-wsl@0.4.0
	unicode-normalization@0.1.23
	same-file@1.0.6
	system-configuration-sys@0.5.0
	xkeysym@0.2.0
	rfd@0.14.1
	smithay-client-toolkit@0.18.1
	prettyplease@0.2.16
	cpal@0.15.3
	wasm-streams@0.4.0
	reqwest@0.11.27
	async-io@1.13.0
	local-ip-address@0.6.1
	presser@0.3.1
	toml_edit@0.21.1
	coreaudio-sys@0.2.15
	glyph_brush_layout@0.2.3
	flate2@1.0.28
	pollster@0.3.0
	console_error_panic_hook@0.1.7
	gloo-net@0.5.0
	cfg-if@1.0.0
	as-raw-xcb-connection@1.0.1
	endi@1.1.0
	uds_windows@1.1.0
	minimal-lexical@0.2.1
	url@2.5.0
	try-lock@0.2.5
	claxon@0.4.3
	objc@0.2.7
	wasm-bindgen-futures@0.4.42
	matrixmultiply@0.3.8
	once_cell@1.19.0
	zbus_macros@3.15.1
	num-integer@0.1.46
	windows_x86_64_msvc@0.42.2
	js-sys@0.3.69
	raw-window-handle@0.5.2
	tar@0.4.40
	regex@1.10.3
	winapi-i686-pc-windows-gnu@0.4.0
	winnow@0.5.40
	serde_derive@1.0.197
	wasm-bindgen-shared@0.2.92
	core-foundation-sys@0.8.6
	async-lock@3.3.0
	windows-core@0.54.0
	wgpu-types@0.19.2
	openssl-probe@0.1.5
	getrandom@0.2.12
	time-core@0.1.2
	symphonia@0.5.4
	metal@0.27.0
	byteorder@1.5.0
	parking_lot_core@0.9.9
	objc_id@0.1.1
	data-encoding@2.5.0
	web-time@0.2.4
	cexpr@0.6.0
	xshell@0.2.5
	async-broadcast@0.5.1
	wayland-backend@0.3.3
	quote@1.0.35
	linux-raw-sys@0.3.8
	cros-libva@0.0.6
	sysinfo@0.30.7
	wayland-cursor@0.31.1
	chrono@0.4.35
	either@1.10.0
	android-tzdata@0.1.1
	eframe@0.27.1
	toml_edit@0.19.15
	profiling-procmacros@1.0.15
	openssl@0.10.64
	toml@0.5.11
	tokio-tungstenite@0.20.1
	cesu8@1.1.0
	hyper-rustls@0.26.0
	headers-core@0.2.0
	ttf-parser@0.20.0
	hyper-tls@0.5.0
	zstd-safe@5.0.2+zstd.1.5.2
	accesskit_winit@0.16.1
	ogg@0.8.0
	gethostname@0.4.3
	thiserror@1.0.58
	windows_aarch64_gnullvm@0.52.4
	cpufeatures@0.2.12
	http-body-util@0.1.1
	regex-automata@0.4.6
	tiny-skia-path@0.11.4
	semver@1.0.22
	image@0.24.9
	web-sys@0.3.69
	color_quant@1.1.0
	ureq@2.9.6
	nohash-hasher@0.2.0
	proc-macro-crate@3.1.0
	bincode@1.3.3
	num-complex@0.4.5
	async-broadcast@0.7.0
	regex-syntax@0.6.29
	which@4.4.2
	wasi@0.11.0+wasi-snapshot-preview1
	objc_exception@0.1.2
	vcpkg@0.2.15
	event-listener@2.5.3
	mach2@0.4.2
	event-listener@3.1.0
	num_cpus@1.16.0
	typenum@1.17.0
	wide@0.7.15
	arrayref@0.3.7
	walkdir@2.5.0
	codespan-reporting@0.11.1
	gpu-alloc@0.6.0
	webbrowser@0.8.13
	h2@0.3.25
	redox_syscall@0.3.5
	whoami@1.5.1
	ring@0.17.8
	errno-dragonfly@0.1.2
	ipnet@2.9.0
	block2@0.3.0
	wayland-protocols@0.31.2
	zbus@3.15.1
	pin-project-lite@0.2.13
	want@0.3.1
	block-buffer@0.10.4
	alsa-sys@0.3.1
	wgpu-core@0.19.3
	lock_api@0.4.11
	pathdiff@0.2.1
	anstream@0.6.13
	wasm-bindgen-macro@0.2.92
	polling@3.5.0
	objc2-encode@3.0.0
	tokio-native-tls@0.3.1
	fnv@1.0.7
	x11rb-protocol@0.13.0
	egui_glow@0.27.1
	ppv-lite86@0.2.17
	windows_i686_gnu@0.52.4
	linux-raw-sys@0.4.13
	async-channel@2.2.0
	async-fs@1.6.0
	glutin_glx_sys@0.5.0
	windows-targets@0.48.5
	home@0.5.9
	strict-num@0.1.1
	windows_x86_64_gnullvm@0.42.2
	bytemuck@1.15.0
	litrs@0.4.1
	zbus_macros@4.1.2
	static_assertions@1.1.0
	gpu-allocator@0.25.0
	glutin_wgl_sys@0.5.0
	overload@0.1.1
	shlex@1.3.0
	windows_i686_msvc@0.52.4
	d3d12@0.19.0
	futures-executor@0.3.30
	statrs@0.16.0
	zbus_names@3.0.0
	toml_datetime@0.6.5
	filetime@0.2.23
	wgpu-hal@0.19.3
	wasm-logger@0.2.0
	futures-core@0.3.30
	idna@0.5.0
	widestring@1.0.2
	io-lifetimes@1.0.11
	async-executor@1.8.0
	adler@1.0.2
	redox_syscall@0.4.1
	termcolor@1.4.1
	windows-result@0.1.0
	regex-syntax@0.8.2
	runas@1.2.0
	itertools@0.12.1
	smol_str@0.2.1
	async-process@2.1.0
	winapi-util@0.1.6
	instant@0.1.12
	clang-sys@1.7.0
	futures-lite@2.3.0
	num-traits@0.2.18
	range-alloc@0.1.3
	futures-util@0.3.30
	mdns-sd@0.10.4
	approx@0.5.1
	pin-project@1.1.5
	darling_macro@0.20.8
	derivative@2.2.0
"

inherit desktop cargo xdg

DESCRIPTION="ALVR is an open source remote VR display for the Oculus Go/Quest"
HOMEPAGE="https://github.com/alvr-org/ALVR"
SRC_URI="https://github.com/alvr-org/ALVR/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" $(cargo_crate_uris) "
#EGIT_REPO_URI="https://github.com/alvr-org/ALVR.git"
RESTRICT="network-sandbox" # Temp solution for bundled ffmpeg

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${P^^}"

RDEPEND="
	sys-libs/libunwind
"

DEPEND="${RDEPEND}"

BDEPEND="${RDEPEND}
	virtual/pkgconfig
	media-gfx/imagemagick
"

PATCHES=(
	"${FILESDIR}/alvr-20.7.0-Disable_rpath_in_dependencies.rs.patch"
)

S="${WORKDIR}/ALVR-${PV}"

src_unpack() {
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

	PKG_CONFIG_PATH="${FILESDIR}" \
		cargo xtask prepare-deps --platform linux

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
