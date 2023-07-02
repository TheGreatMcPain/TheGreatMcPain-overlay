# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	glutin-winit-0.3.0
	once_cell-1.18.0
	try-lock-0.2.4
	glib-0.15.12
	base64-0.13.1
	arrayref-0.3.7
	owned_ttf_parser-0.19.0
	polling-2.8.0
	android_system_properties-0.1.5
	d3d12-0.6.0
	windows_i686_gnu-0.48.0
	wayland-cursor-0.29.5
	ttf-parser-0.19.0
	futures-task-0.3.28
	parking_lot-0.12.1
	zvariant_utils-1.0.1
	mach2-0.4.1
	async-lock-2.7.0
	pkg-config-0.3.27
	vec_map-0.8.2
	android-tzdata-0.1.1
	cocoa-foundation-0.1.1
	generic-array-0.14.7
	num-rational-0.4.1
	windows_i686_msvc-0.48.0
	nohash-hasher-0.2.0
	reqwest-0.11.18
	httparse-1.8.0
	waker-fn-1.1.0
	alsa-sys-0.3.1
	async-stream-0.3.5
	android-properties-0.2.2
	neli-proc-macros-0.1.3
	zbus-3.10.0
	enumflags2_derive-0.7.7
	rustix-0.37.20
	futures-io-0.3.28
	tinyvec_macros-0.1.1
	rustc-hash-1.1.0
	gpu-alloc-0.5.4
	openssl-probe-0.1.5
	android-activity-0.4.1
	zbus_names-2.5.1
	wgpu-types-0.16.0
	crc32fast-1.3.2
	wayland-client-0.29.5
	async-recursion-1.0.4
	headers-core-0.2.0
	log-0.4.19
	windows-sys-0.42.0
	wayland-scanner-0.29.5
	version-compare-0.1.1
	system-deps-6.1.0
	atspi-macros-0.2.0
	quote-1.0.28
	windows-targets-0.48.0
	unicode-normalization-0.1.22
	num-complex-0.4.3
	bindgen-0.66.1
	core-graphics-0.22.3
	serde_repr-0.1.12
	tiny-skia-path-0.8.4
	console_error_panic_hook-0.1.7
	hermit-abi-0.2.6
	crypto-common-0.1.6
	scoped-tls-1.0.1
	xml-rs-0.8.14
	miniz_oxide-0.7.1
	tungstenite-0.17.3
	num_enum-0.5.11
	ndk-0.7.0
	lazy_static-1.4.0
	num_enum_derive-0.6.1
	gdk-pixbuf-0.15.11
	ident_case-1.0.1
	ecolor-0.22.0
	sha1-0.10.5
	symphonia-0.5.3
	wasi-0.11.0+wasi-snapshot-preview1
	accesskit-0.11.0
	iana-time-zone-0.1.57
	futures-executor-0.3.28
	tinyvec-1.6.0
	rand-0.8.5
	ndk-sys-0.4.1+23.1.7779620
	tower-service-0.3.2
	wasm-bindgen-0.2.87
	glam-0.24.0
	windows_aarch64_msvc-0.48.0
	gtk-0.15.5
	winapi-0.3.9
	serde_json-1.0.93
	wayland-protocols-0.29.5
	ab_glyph-0.2.21
	cgl-0.3.2
	parking-2.1.0
	peeking_take_while-0.1.2
	gobject-sys-0.15.10
	jni-0.20.0
	thiserror-impl-1.0.40
	humantime-2.1.0
	atk-0.15.1
	glutin_wgl_sys-0.4.0
	objc2-encode-2.0.0-pre.2
	flate2-1.0.26
	renderdoc-sys-1.0.0
	accesskit_windows-0.14.0
	objc2-0.3.0-beta.3.patch-leaks.3
	itoa-1.0.6
	futures-0.3.28
	encoding_rs-0.8.32
	windows-sys-0.48.0
	ico-0.3.0
	js-sys-0.3.64
	msgbox-0.7.0
	png-0.17.9
	aho-corasick-1.0.2
	ring-0.16.20
	gtk3-macros-0.15.6
	ureq-2.7.0
	minimal-lexical-0.2.1
	num_cpus-1.15.0
	tokio-native-tls-0.3.1
	gio-sys-0.15.10
	instant-0.1.12
	wasm-bindgen-macro-support-0.2.87
	bytes-1.4.0
	form_urlencoded-1.2.0
	oboe-0.5.0
	approx-0.5.1
	bytemuck_derive-1.4.1
	glutin-0.30.9
	core-foundation-sys-0.6.2
	pin-project-1.1.0
	emath-0.22.0
	walkdir-2.3.3
	windows-interface-0.44.0
	combine-4.6.6
	jack-0.11.4
	jack-sys-0.5.1
	proc-macro2-1.0.60
	libloading-0.7.4
	exec-0.3.1
	rustls-0.21.2
	zvariant_derive-3.14.0
	jni-0.19.0
	dlib-0.5.2
	nalgebra-0.29.0
	prettyplease-0.2.8
	windows_aarch64_gnullvm-0.48.0
	glutin_glx_sys-0.4.0
	error-code-2.3.1
	shlex-1.1.0
	openssl-0.10.54
	tungstenite-0.19.0
	type-map-0.5.0
	codespan-reporting-0.11.1
	cpufeatures-0.2.8
	gpu-descriptor-types-0.1.1
	adler-1.0.2
	memchr-2.5.0
	byteorder-1.4.3
	crossbeam-utils-0.8.16
	windows_i686_msvc-0.42.2
	gtk-sys-0.15.3
	coreaudio-sys-0.2.12
	ewebsock-0.2.0
	smithay-clipboard-0.6.6
	rand_chacha-0.3.1
	egui-wgpu-0.22.0
	slotmap-1.0.6
	signal-hook-registry-1.4.1
	wayland-sys-0.30.1
	tokio-tungstenite-0.19.0
	windows_x86_64_gnullvm-0.48.0
	rand_core-0.6.4
	openssl-sys-0.9.88
	ryu-1.0.13
	jobserver-0.1.26
	async-io-1.13.0
	home-0.5.5
	socket2-0.4.9
	either-1.8.1
	windows-sys-0.45.0
	web-sys-0.3.64
	schannel-0.1.21
	nalgebra-macros-0.1.0
	spin_sleep-1.1.1
	ahash-0.7.6
	gpu-alloc-types-0.2.0
	android_logger-0.13.1
	sha-1-0.10.1
	downcast-rs-1.2.0
	tracing-core-0.1.31
	windows_x86_64_gnu-0.48.0
	num_enum-0.6.1
	wasm-bindgen-shared-0.2.87
	darling_core-0.14.4
	orbclient-0.3.45
	statrs-0.16.0
	accesskit_macos-0.7.0
	static_assertions-1.1.0
	accesskit_unix-0.5.0
	ash-0.37.3+1.3.251
	serde_spanned-0.6.2
	libc-0.2.146
	slab-0.4.8
	field-offset-0.3.6
	rosc-0.10.1
	wasm-bindgen-futures-0.4.37
	tracing-attributes-0.1.25
	eframe-0.22.0
	gpu-allocator-0.22.0
	syn-1.0.109
	utf-8-0.7.6
	objc-foundation-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	windows_aarch64_msvc-0.42.2
	gdk-sys-0.15.1
	objc-sys-0.2.0-beta.2
	dirs-4.0.0
	async-trait-0.1.68
	alsa-0.7.0
	http-0.2.9
	nom-7.1.3
	async-stream-impl-0.3.5
	concurrent-queue-2.2.0
	windows-targets-0.42.2
	pin-utils-0.1.0
	xcursor-0.3.4
	security-framework-sys-2.9.0
	redox_syscall-0.2.16
	sctk-adwaita-0.5.4
	arboard-3.2.0
	bindgen-0.64.0
	errno-0.3.1
	http-body-0.4.5
	ogg-0.8.0
	option-ext-0.2.0
	bit-vec-0.6.3
	wasm-logger-0.2.0
	glib-macros-0.15.13
	khronos_api-3.1.0
	target-lexicon-0.12.7
	libloading-0.8.0
	spin-0.5.2
	pango-sys-0.15.10
	errno-dragonfly-0.1.2
	core-graphics-types-0.1.1
	jni-0.21.1
	wasm-bindgen-macro-0.2.87
	objc-0.2.7
	gdk-pixbuf-sys-0.15.10
	async-broadcast-0.5.1
	objc_id-0.1.1
	accesskit_winit-0.14.0
	glow-0.12.2
	url-2.4.0
	redox_syscall-0.3.5
	dispatch-0.2.0
	wgpu-core-0.16.1
	autocfg-1.1.0
	hashbrown-0.12.3
	symphonia-core-0.5.3
	toml_edit-0.19.10
	hexf-parse-0.2.1
	async-channel-1.8.0
	pin-project-internal-1.1.0
	fern-0.6.2
	pollster-0.3.0
	x11rb-0.10.1
	cfg_aliases-0.1.1
	symphonia-bundle-mp3-0.5.3
	cexpr-0.6.0
	fdeflate-0.3.0
	rustc_version-0.4.0
	ndk-context-0.1.1
	getrandom-0.2.10
	raw-window-handle-0.5.2
	objc_exception-0.1.2
	errno-0.2.8
	image-0.24.6
	windows-0.46.0
	egui-winit-0.22.0
	tokio-tungstenite-0.17.2
	profiling-1.0.8
	ppv-lite86-0.2.17
	oboe-sys-0.5.0
	unicode-xid-0.2.4
	cpal-0.15.2
	foreign-types-0.3.2
	serde_derive-1.0.164
	tempfile-3.6.0
	egui_glow-0.22.0
	typenum-1.16.0
	base64-0.21.2
	wasm-bindgen-backend-0.2.87
	darling-0.14.4
	winres-0.1.12
	cesu8-1.1.0
	socket2-0.5.3
	windows_x86_64_gnullvm-0.42.2
	khronos-egl-4.1.0
	strsim-0.10.0
	smithay-client-toolkit-0.16.0
	strict-num-0.1.1
	idna-0.4.0
	tokio-macros-2.1.0
	serde_urlencoded-0.7.1
	dirs-sys-0.3.7
	metal-0.24.0
	percent-encoding-2.3.0
	nix-0.25.1
	wayland-sys-0.29.5
	color_quant-1.1.0
	webpki-roots-0.23.1
	indexmap-1.9.3
	core-foundation-0.9.3
	foreign-types-shared-0.1.1
	wide-0.7.10
	winapi-wsapoll-0.1.1
	block-buffer-0.10.4
	widestring-1.0.2
	bincode-1.3.3
	object-0.30.4
	time-0.1.45
	which-4.4.0
	atomic_refcell-0.1.10
	gdk-0.15.4
	glyph_brush_layout-0.2.3
	thiserror-1.0.40
	block-sys-0.1.0-beta.1
	memoffset-0.9.0
	spirv-0.2.0+1.5.4
	wayland-commons-0.29.5
	futures-channel-0.3.28
	toml-0.5.11
	digest-0.10.7
	zvariant-3.14.0
	local-ip-address-0.5.3
	jni-sys-0.3.0
	lock_api-0.4.10
	enumflags2-0.7.7
	toml_datetime-0.6.2
	sysinfo-0.29.2
	symphonia-metadata-0.5.3
	chrono-0.4.26
	hound-3.5.0
	async-executor-1.5.1
	pango-0.15.10
	cfg-if-1.0.0
	pico-args-0.5.0
	num-traits-0.2.15
	atspi-0.10.1
	io-lifetimes-1.0.11
	fnv-1.0.7
	gimli-0.27.3
	heck-0.4.1
	sct-0.7.0
	dirs-5.0.1
	unicode-bidi-0.3.13
	tokio-1.28.2
	windows-implement-0.44.0
	futures-core-0.3.28
	lewton-0.10.2
	headers-0.3.8
	anyhow-1.0.71
	winnow-0.4.7
	block2-0.2.0-alpha.6
	mime-0.3.17
	simba-0.6.0
	cairo-sys-rs-0.15.1
	hex-0.4.3
	gio-0.15.12
	backtrace-0.3.67
	iana-time-zone-haiku-0.1.2
	glob-0.3.1
	scopeguard-1.1.0
	gethostname-0.2.3
	runas-1.0.0
	httpdate-1.0.2
	native-tls-0.2.11
	proc-macro-crate-1.3.1
	hyper-tls-0.5.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	version_check-0.9.4
	want-0.3.1
	clipboard-win-4.5.0
	gloo-net-0.3.0
	hyper-0.14.26
	tokio-util-0.7.8
	regex-1.8.4
	gpu-descriptor-0.2.3
	winreg-0.10.1
	android_log-sys-0.3.0
	paste-1.0.12
	safe_arch-0.7.0
	windows_aarch64_gnullvm-0.42.2
	security-framework-2.9.1
	pin-project-lite-0.2.9
	encoding_rs_io-0.1.7
	webbrowser-0.8.10
	cocoa-0.24.1
	windows_x86_64_msvc-0.48.0
	is-terminal-0.4.7
	bumpalo-3.13.0
	addr2line-0.19.0
	core-foundation-sys-0.8.4
	data-encoding-2.4.0
	unicode-width-0.1.10
	memmap2-0.5.10
	mio-0.8.8
	parking_lot_core-0.9.8
	serde-1.0.164
	untrusted-0.7.1
	claxon-0.4.3
	fastrand-1.9.0
	ntapi-0.4.1
	gloo-utils-0.1.7
	simd-adler32-0.3.5
	xshell-macros-0.2.3
	range-alloc-0.1.3
	windows_i686_gnu-0.42.2
	arrayvec-0.7.4
	uds_windows-1.0.2
	futures-sink-0.3.28
	windows-0.44.0
	wgpu-hal-0.16.1
	same-file-1.0.6
	num-integer-0.1.45
	naga-0.12.2
	cfg-expr-0.15.3
	wgpu-0.16.1
	dasp_sample-0.11.0
	str-buf-1.0.6
	h2-0.3.19
	darling_macro-0.14.4
	env_logger-0.10.0
	glib-sys-0.15.10
	syn-2.0.18
	wasi-0.10.0+wasi-snapshot-preview1
	bitflags-1.3.2
	num_enum_derive-0.5.11
	winapi-util-0.1.5
	lazycell-1.3.0
	cairo-rs-0.15.12
	openssl-macros-0.1.1
	event-listener-2.5.3
	semver-1.0.17
	app_dirs2-2.5.5
	termcolor-1.2.0
	xshell-0.2.3
	tracing-0.1.37
	ipnet-2.7.2
	zbus_macros-3.10.0
	unicode-ident-1.0.9
	vcpkg-0.2.15
	glutin_egl_sys-0.5.0
	winit-0.28.6
	malloc_buf-0.0.6
	x11-dl-2.21.0
	dirs-sys-0.4.1
	x11rb-protocol-0.10.0
	epaint-0.22.0
	windows-0.48.0
	async-task-4.4.0
	rawpointer-0.2.1
	proc-macro-error-attr-1.0.4
	miniz_oxide-0.6.2
	libm-0.2.7
	matrixmultiply-0.3.7
	bytemuck-1.13.1
	nix-0.24.3
	rodio-0.17.1
	windows_x86_64_msvc-0.42.2
	smallvec-1.10.0
	tiny-skia-0.8.4
	cc-1.0.79
	num-derive-0.3.3
	futures-util-0.3.28
	linux-raw-sys-0.3.8
	windows_x86_64_gnu-0.42.2
	atk-sys-0.15.1
	com-rs-0.2.1
	memoffset-0.6.5
	toml-0.7.4
	calloop-0.10.6
	hassle-rs-0.10.0
	futures-lite-1.13.0
	proc-macro-error-1.0.4
	rustc-demangle-0.1.23
	regex-syntax-0.7.2
	accesskit_consumer-0.15.0
	rustls-webpki-0.100.1
	neli-0.6.4
	ab_glyph_rasterizer-0.1.8
	rand_distr-0.4.3
	ordered-stream-0.2.0
	futures-macro-0.3.28
	ahash-0.8.3
	clang-sys-1.6.1
	bitflags-2.3.2
	bit-set-0.5.3
	egui-0.22.0
	gl_generator-0.14.0
	xdg-2.5.0
	block-0.1.6
	xi-unicode-0.3.0
	hermit-abi-0.3.1
	redox_users-0.4.3
	coreaudio-rs-0.11.2
	derivative-2.2.0
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
	domenu packaging/freedesktop/alvr.desktop

	# Icons
	for size in {16,32,48,64,128,256}; do
		convert alvr/dashboard/resources/dashboard.ico \
			-thumbnail ${size} -alpha on -background none -flatten \
			${PN}-${size}.png || die
		newicon -s ${size} ${PN}-${size}.png ${PN}.png
	done

	# Firewall and SELinux
	insinto /etc/ufw/applications.d/
	doins packaging/firewall/ufw-alvr

	insinto /usr/lib/firewalld/services/
	doins packaging/firewall/alvr-firewalld.xml

	doexe packaging/firewall/alvr_fw_config.sh

	insinto /usr/share/alvr/selinux/
	doins packaging/selinux/*
}
