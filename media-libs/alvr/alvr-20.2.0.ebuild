# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	humantime-2.1.0
	serde-1.0.186
	lazycell-1.3.0
	raw-window-handle-0.5.2
	wide-0.7.11
	glutin_egl_sys-0.5.1
	winnow-0.5.15
	bit-vec-0.6.3
	hmac-0.12.1
	objc-sys-0.2.0-beta.2
	enumflags2_derive-0.7.7
	async-task-4.4.0
	error-code-2.3.1
	windows_aarch64_msvc-0.42.2
	wasi-0.11.0+wasi-snapshot-preview1
	dasp_sample-0.11.0
	num_enum-0.5.11
	glutin-winit-0.3.0
	iana-time-zone-haiku-0.1.2
	rustix-0.38.8
	symphonia-0.5.3
	clipboard-win-4.5.0
	sct-0.7.0
	spirv-0.2.0+1.5.4
	num_enum-0.7.0
	windows_x86_64_msvc-0.48.5
	thiserror-impl-1.0.47
	ab_glyph-0.2.21
	time-0.3.27
	vec_map-0.8.2
	accesskit_consumer-0.15.2
	unicode-width-0.1.10
	oboe-sys-0.5.0
	foreign-types-0.3.2
	local-ip-address-0.5.4
	ntapi-0.4.1
	pin-project-internal-1.1.3
	block-sys-0.1.0-beta.1
	pkg-config-0.3.27
	dirs-5.0.1
	serde_json-1.0.105
	tracing-0.1.37
	pango-sys-0.16.3
	atomic_refcell-0.1.11
	rand_distr-0.4.3
	strict-num-0.1.1
	either-1.9.0
	gtk-sys-0.16.0
	png-0.17.10
	unicode-xid-0.2.4
	digest-0.10.7
	sha1-0.10.5
	wayland-commons-0.29.5
	gpu-allocator-0.22.0
	nix-0.26.2
	wasm-bindgen-backend-0.2.87
	ab_glyph_rasterizer-0.1.8
	derivative-2.2.0
	async-recursion-1.0.4
	zstd-sys-2.0.8+zstd.1.5.5
	com-rs-0.2.1
	num-integer-0.1.45
	exec-0.3.1
	d3d12-0.6.0
	accesskit_macos-0.9.0
	claxon-0.4.3
	jack-sys-0.5.1
	wasm-bindgen-macro-support-0.2.87
	core-graphics-types-0.1.2
	glutin_glx_sys-0.4.0
	xdg-2.5.2
	prettyplease-0.2.12
	cexpr-0.6.0
	web-sys-0.3.64
	symphonia-bundle-mp3-0.5.3
	toml-0.7.6
	zip-0.6.6
	sha2-0.10.7
	jni-0.21.1
	rustc-demangle-0.1.23
	windows_aarch64_gnullvm-0.42.2
	jobserver-0.1.26
	futures-lite-1.13.0
	signal-hook-0.3.17
	darling_core-0.14.4
	enumflags2-0.7.7
	cc-1.0.83
	jack-0.11.4
	wayland-scanner-0.29.5
	ogg-0.8.0
	wasm-logger-0.2.0
	iana-time-zone-0.1.57
	is-wsl-0.4.0
	indexmap-1.9.3
	itoa-1.0.9
	proc-macro-crate-1.3.1
	async-stream-0.3.5
	nix-0.25.1
	deranged-0.3.8
	percent-encoding-2.3.0
	widestring-1.0.2
	arrayvec-0.7.4
	generic-array-0.14.7
	openssl-macros-0.1.1
	gpu-alloc-types-0.2.0
	lock_api-0.4.10
	ewebsock-0.2.0
	ndk-context-0.1.1
	version-compare-0.1.1
	proc-macro2-1.0.66
	windows-targets-0.42.2
	serde_derive-1.0.186
	bindgen-0.64.0
	approx-0.5.1
	coreaudio-sys-0.2.12
	memoffset-0.7.1
	async-executor-1.5.1
	gloo-utils-0.2.0
	pollster-0.3.0
	async-io-1.13.0
	profiling-1.0.9
	security-framework-2.9.2
	bitflags-1.3.2
	wayland-protocols-0.29.5
	serde_repr-0.1.16
	sctk-adwaita-0.5.4
	async-stream-impl-0.3.5
	zvariant-3.15.0
	tinyvec_macros-0.1.1
	chrono-0.4.26
	semver-1.0.18
	rawpointer-0.2.1
	shlex-1.1.0
	tungstenite-0.17.3
	libloading-0.7.4
	x11rb-protocol-0.10.0
	num-derive-0.3.3
	futures-sink-0.3.28
	xcursor-0.3.4
	zvariant_derive-3.15.0
	android-activity-0.4.3
	wayland-sys-0.29.5
	mach2-0.4.1
	tracing-attributes-0.1.26
	foreign-types-shared-0.1.1
	alsa-sys-0.3.1
	wayland-cursor-0.29.5
	tokio-tungstenite-0.20.0
	inout-0.1.3
	openssl-sys-0.9.91
	spin-0.5.2
	ident_case-1.0.1
	memmap2-0.5.10
	renderdoc-sys-1.0.0
	tiny-skia-0.8.4
	pin-project-1.1.3
	autocfg-1.1.0
	cfg_aliases-0.1.1
	errno-0.2.8
	reqwest-0.11.20
	atk-sys-0.16.0
	atomic-waker-1.1.1
	errno-0.3.2
	wgpu-core-0.16.1
	jni-0.19.0
	rand_core-0.6.4
	openssl-probe-0.1.5
	rfd-0.11.4
	cfg-if-1.0.0
	schannel-0.1.22
	subtle-2.5.0
	slab-0.4.9
	ttf-parser-0.19.1
	fastrand-2.0.0
	windows_i686_msvc-0.42.2
	atspi-0.10.1
	num_enum_derive-0.6.1
	smallvec-1.11.0
	native-tls-0.2.11
	combine-4.6.6
	indexmap-2.0.0
	strsim-0.10.0
	equivalent-1.0.1
	regex-syntax-0.7.4
	num_enum_derive-0.5.11
	async-channel-1.9.0
	unicode-bidi-0.3.13
	nalgebra-0.29.0
	walkdir-2.3.3
	windows_x86_64_gnullvm-0.42.2
	winres-0.1.12
	tokio-native-tls-0.3.1
	android_logger-0.13.3
	futures-macro-0.3.28
	url-2.4.0
	clang-sys-1.6.1
	base64-0.21.2
	quote-1.0.33
	egui-0.22.0
	metal-0.24.0
	alsa-0.7.1
	windows_x86_64_msvc-0.42.2
	js-sys-0.3.64
	option-ext-0.2.0
	mime-0.3.17
	crypto-common-0.1.6
	h2-0.3.21
	windows-core-0.51.1
	http-body-0.4.5
	tower-service-0.3.2
	rustls-0.21.6
	pathdiff-0.2.1
	linux-raw-sys-0.4.5
	naga-0.12.3
	headers-0.3.8
	open-5.0.0
	rustls-webpki-0.100.2
	http-0.2.9
	neli-proc-macros-0.1.3
	windows-interface-0.48.0
	smithay-client-toolkit-0.16.0
	sysinfo-0.29.8
	mio-0.8.8
	windows-targets-0.48.5
	windows-0.44.0
	time-0.1.45
	zstd-0.11.2+zstd.1.5.2
	libloading-0.8.0
	bindgen-0.66.1
	ash-0.37.3+1.3.251
	byteorder-1.4.3
	unicode-ident-1.0.11
	scopeguard-1.2.0
	untrusted-0.7.1
	core-graphics-0.22.3
	bytemuck-1.13.1
	gpu-descriptor-types-0.1.1
	ecolor-0.22.0
	darling-0.14.4
	dirs-sys-0.4.1
	event-listener-2.5.3
	bit-set-0.5.3
	rand-0.8.5
	winapi-util-0.1.5
	calloop-0.10.6
	bzip2-sys-0.1.11+1.0.8
	jni-0.20.0
	tiny-skia-path-0.8.4
	accesskit_windows-0.14.3
	form_urlencoded-1.2.0
	xshell-macros-0.2.5
	is-terminal-0.4.9
	num_cpus-1.16.0
	futures-task-0.3.28
	libm-0.2.7
	bumpalo-3.13.0
	scoped-tls-1.0.1
	cesu8-1.1.0
	objc_id-0.1.1
	ureq-2.7.1
	fnv-1.0.7
	cpal-0.15.2
	hexf-parse-0.2.1
	tokio-macros-2.1.0
	webbrowser-0.8.11
	android-tzdata-0.1.1
	gpu-descriptor-0.2.3
	windows-0.46.0
	fern-0.6.2
	windows_i686_gnu-0.48.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	serde_spanned-0.6.3
	windows_aarch64_msvc-0.48.5
	syn-1.0.109
	ahash-0.7.6
	unicode-normalization-0.1.22
	windows_i686_msvc-0.48.5
	wgpu-hal-0.16.2
	type-map-0.5.0
	objc2-encode-2.0.0-pre.2
	toml-0.5.11
	xdg-home-1.0.0
	windows_aarch64_gnullvm-0.48.5
	cfg-expr-0.15.4
	glutin_wgl_sys-0.4.0
	encoding_rs_io-0.1.7
	khronos-egl-4.1.0
	termcolor-1.2.0
	oboe-0.5.0
	openssl-0.10.56
	rustls-pemfile-1.0.3
	base64-0.13.1
	hashbrown-0.14.0
	image-0.24.7
	gobject-sys-0.16.3
	futures-channel-0.3.28
	symphonia-metadata-0.5.3
	bitflags-2.4.0
	xml-rs-0.8.16
	fastrand-1.9.0
	dlib-0.5.2
	num-complex-0.4.4
	is-docker-0.2.0
	num-rational-0.4.1
	ico-0.3.0
	xshell-0.2.5
	neli-0.6.4
	errno-dragonfly-0.1.2
	futures-io-0.3.28
	async-fs-1.6.0
	eframe-0.22.0
	dispatch-0.2.0
	version_check-0.9.4
	malloc_buf-0.0.6
	ndk-sys-0.4.1+23.1.7779620
	zvariant_utils-1.0.1
	cocoa-foundation-0.1.1
	wasm-streams-0.3.0
	smithay-clipboard-0.6.6
	instant-0.1.12
	rand_chacha-0.3.1
	backtrace-0.3.69
	windows-0.48.0
	try-lock-0.2.4
	aho-corasick-1.0.4
	target-lexicon-0.12.11
	httparse-1.8.0
	time-core-0.1.1
	hound-3.5.0
	polling-2.8.0
	parking-2.1.0
	nom-7.1.3
	gl_generator-0.14.0
	gloo-net-0.4.0
	constant_time_eq-0.1.5
	aes-0.8.3
	parking_lot_core-0.9.8
	gimli-0.28.0
	memoffset-0.6.5
	heck-0.4.1
	regex-automata-0.3.6
	gpu-alloc-0.5.4
	downcast-rs-1.2.0
	waker-fn-1.1.0
	rustc-hash-1.1.0
	zbus-3.14.1
	redox_users-0.4.3
	async-lock-2.8.0
	objc2-0.3.0-beta.3.patch-leaks.3
	hex-0.4.3
	windows_x86_64_gnu-0.48.5
	bytes-1.4.0
	io-lifetimes-1.0.11
	wasi-0.10.0+wasi-snapshot-preview1
	typenum-1.16.0
	async-process-1.7.0
	rustix-0.37.23
	tokio-tungstenite-0.17.2
	cgl-0.3.2
	objc_exception-0.1.2
	uds_windows-1.0.2
	winapi-i686-pc-windows-gnu-0.4.0
	windows_x86_64_gnu-0.42.2
	arrayref-0.3.7
	windows-0.51.1
	lewton-0.10.2
	blocking-1.3.1
	glow-0.12.3
	gdk-sys-0.16.0
	orbclient-0.3.46
	libc-0.2.147
	cocoa-0.24.1
	regex-1.9.3
	matrixmultiply-0.3.7
	arboard-3.2.0
	accesskit-0.11.2
	system-deps-6.1.1
	webpki-roots-0.23.1
	zstd-safe-5.0.2+zstd.1.5.2
	headers-core-0.2.0
	wasm-bindgen-0.2.87
	jni-sys-0.3.0
	rustls-webpki-0.101.4
	block-buffer-0.10.4
	wasm-bindgen-macro-0.2.87
	gio-sys-0.16.3
	ring-0.16.20
	socket2-0.4.9
	x11rb-0.10.1
	android-properties-0.2.2
	async-broadcast-0.5.1
	num_enum_derive-0.7.0
	webpki-roots-0.25.2
	thiserror-1.0.47
	accesskit_unix-0.5.2
	socket2-0.5.3
	once_cell-1.18.0
	block-0.1.6
	windows-sys-0.45.0
	wasm-bindgen-shared-0.2.87
	egui_glow-0.22.0
	safe_arch-0.7.1
	cairo-sys-rs-0.16.3
	tokio-rustls-0.24.1
	zbus_names-2.6.0
	wgpu-types-0.16.1
	minimal-lexical-0.2.1
	x11-dl-2.21.0
	want-0.3.1
	pbkdf2-0.11.0
	redox_syscall-0.2.16
	sha-1-0.10.1
	wayland-sys-0.30.1
	hassle-rs-0.10.0
	adler-1.0.2
	async-trait-0.1.73
	hashbrown-0.12.3
	gdk-pixbuf-sys-0.16.3
	objc-0.2.7
	password-hash-0.4.2
	base64ct-1.6.0
	android_log-sys-0.3.1
	home-0.5.5
	idna-0.4.0
	str-buf-1.0.6
	encoding_rs-0.8.33
	miniz_oxide-0.7.1
	getrandom-0.2.10
	addr2line-0.21.0
	parking_lot-0.12.1
	signal-hook-registry-1.4.1
	codespan-reporting-0.11.1
	ndk-0.7.0
	nohash-hasher-0.2.0
	owned_ttf_parser-0.19.0
	cipher-0.4.4
	egui-winit-0.22.0
	flate2-1.0.27
	glob-0.3.1
	xi-unicode-0.3.0
	zbus_macros-3.14.1
	glib-sys-0.16.3
	winreg-0.50.0
	coreaudio-rs-0.11.2
	pico-args-0.5.0
	rodio-0.17.1
	bytemuck_derive-1.4.1
	nix-0.24.3
	toml_datetime-0.6.3
	color_quant-1.1.0
	crossbeam-utils-0.8.16
	runas-1.0.0
	app_dirs2-2.5.5
	winit-0.28.6
	bincode-1.3.3
	data-encoding-2.4.0
	windows-implement-0.48.0
	objc-foundation-0.1.1
	ipnet-2.8.0
	crc32fast-1.3.2
	tinyvec-1.6.0
	accesskit_winit-0.14.4
	khronos_api-3.1.0
	redox_syscall-0.3.5
	atspi-macros-0.2.0
	log-0.4.20
	emath-0.22.0
	serde_urlencoded-0.7.1
	rosc-0.10.1
	simba-0.6.0
	glutin-0.30.10
	cpufeatures-0.2.9
	pin-utils-0.1.0
	vcpkg-0.2.15
	fdeflate-0.3.0
	core-foundation-sys-0.8.4
	same-file-1.0.6
	anyhow-1.0.75
	slotmap-1.0.6
	wgpu-0.16.3
	futures-0.3.28
	security-framework-sys-2.9.1
	core-foundation-sys-0.6.2
	memchr-2.5.0
	which-4.4.0
	windows_x86_64_gnullvm-0.48.5
	nalgebra-macros-0.1.0
	ordered-stream-0.2.0
	syn-2.0.29
	ahash-0.8.3
	range-alloc-0.1.3
	ppv-lite86-0.2.17
	tungstenite-0.20.0
	core-foundation-0.9.3
	block2-0.2.0-alpha.6
	winapi-0.3.9
	concurrent-queue-2.2.0
	gethostname-0.2.3
	num-traits-0.2.16
	futures-util-0.3.28
	bzip2-0.4.4
	simd-adler32-0.3.7
	ryu-1.0.15
	darling_macro-0.14.4
	epaint-0.22.0
	hermit-abi-0.3.2
	pin-project-lite-0.2.12
	wasm-bindgen-futures-0.4.37
	linux-raw-sys-0.3.8
	hyper-rustls-0.24.1
	egui-wgpu-0.22.0
	num_enum-0.6.1
	httpdate-1.0.3
	android_system_properties-0.1.5
	object-0.32.0
	futures-core-0.3.28
	windows_i686_gnu-0.42.2
	console_error_panic_hook-0.1.7
	hyper-0.14.27
	static_assertions-1.1.0
	glyph_brush_layout-0.2.3
	hyper-tls-0.5.0
	futures-executor-0.3.28
	paste-1.0.14
	lazy_static-1.4.0
	wayland-client-0.29.5
	glam-0.24.1
	toml_edit-0.19.14
	peeking_take_while-0.1.2
	statrs-0.16.0
	tempfile-3.8.0
	tracing-core-0.1.31
	windows-sys-0.48.0
	winapi-wsapoll-0.1.1
	utf-8-0.7.6
	symphonia-core-0.5.3
	tokio-1.32.0
	tokio-util-0.7.8
	env_logger-0.10.0
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
	"${FILESDIR}/alvr-20.1.0-Disable_rpath_in_dependencies.rs.patch"
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
