# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	target-lexicon-0.12.7
	errno-0.3.1
	tungstenite-0.17.3
	sha-1-0.10.1
	parking_lot_core-0.9.7
	objc2-0.3.0-beta.3.patch-leaks.3
	cfg-if-1.0.0
	gdk-sys-0.15.1
	ident_case-1.0.1
	jni-sys-0.3.0
	cpal-0.15.2
	wgpu-types-0.16.0
	base64-0.13.1
	headers-0.3.8
	spirv-0.2.0+1.5.4
	egui-winit-0.22.0
	async-channel-1.8.0
	ash-0.37.3+1.3.251
	glutin_wgl_sys-0.4.0
	windows_x86_64_gnullvm-0.48.0
	alsa-sys-0.3.1
	num_enum-0.5.11
	windows_i686_msvc-0.42.2
	bit-vec-0.6.3
	tower-service-0.3.2
	pango-0.15.10
	windows_x86_64_gnu-0.48.0
	same-file-1.0.6
	hassle-rs-0.10.0
	toml_datetime-0.6.2
	lewton-0.10.2
	strsim-0.10.0
	enumflags2_derive-0.7.7
	windows_aarch64_gnullvm-0.48.0
	rand_core-0.6.4
	cgl-0.3.2
	windows_aarch64_msvc-0.48.0
	xshell-0.2.3
	accesskit_consumer-0.15.0
	fnv-1.0.7
	glib-sys-0.15.10
	arboard-3.2.0
	alsa-0.7.0
	num_cpus-1.15.0
	wayland-client-0.29.5
	naga-0.12.2
	jni-0.21.1
	eframe-0.22.0
	scopeguard-1.1.0
	smithay-client-toolkit-0.16.0
	bumpalo-3.13.0
	windows_aarch64_gnullvm-0.42.2
	fern-0.6.2
	jack-0.11.4
	wasm-bindgen-backend-0.2.86
	webbrowser-0.8.10
	signal-hook-registry-1.4.1
	crypto-common-0.1.6
	memchr-2.5.0
	wasi-0.10.0+wasi-snapshot-preview1
	errno-dragonfly-0.1.2
	glutin_egl_sys-0.5.0
	combine-4.6.6
	waker-fn-1.1.0
	pango-sys-0.15.10
	security-framework-2.9.1
	windows-sys-0.48.0
	num-integer-0.1.45
	atk-sys-0.15.1
	range-alloc-0.1.3
	tokio-tungstenite-0.17.2
	unicode-normalization-0.1.22
	unicode-width-0.1.10
	uds_windows-1.0.2
	gl_generator-0.14.0
	adler-1.0.2
	android-tzdata-0.1.1
	objc2-encode-2.0.0-pre.2
	async-io-1.13.0
	lazy_static-1.4.0
	bitflags-1.3.2
	str-buf-1.0.6
	windows-targets-0.42.2
	nohash-hasher-0.2.0
	num_enum_derive-0.5.11
	ico-0.3.0
	atomic_refcell-0.1.10
	gio-0.15.12
	getrandom-0.2.9
	rustc_version-0.4.0
	windows_i686_gnu-0.48.0
	wayland-protocols-0.29.5
	smallvec-1.10.0
	objc-0.2.7
	hermit-abi-0.2.6
	socket2-0.5.3
	version_check-0.9.4
	event-listener-2.5.3
	slab-0.4.8
	rustc-demangle-0.1.23
	lock_api-0.4.9
	wasm-logger-0.2.0
	nom-7.1.3
	x11rb-0.10.1
	rustls-0.20.8
	app_dirs2-2.5.5
	wayland-sys-0.29.5
	wgpu-hal-0.16.1
	atk-0.15.1
	cairo-rs-0.15.12
	gimli-0.27.2
	digest-0.10.7
	gethostname-0.2.3
	byteorder-1.4.3
	wasi-0.11.0+wasi-snapshot-preview1
	once_cell-1.17.2
	coreaudio-rs-0.11.2
	rand_chacha-0.3.1
	quote-1.0.28
	peeking_take_while-0.1.2
	parking-2.1.0
	color_quant-1.1.0
	gpu-allocator-0.22.0
	prettyplease-0.2.6
	try-lock-0.2.4
	oboe-sys-0.5.0
	want-0.3.0
	xml-rs-0.8.14
	windows_x86_64_msvc-0.48.0
	js-sys-0.3.63
	num-derive-0.3.3
	futures-sink-0.3.28
	paste-1.0.12
	lazycell-1.3.0
	syn-1.0.109
	raw-window-handle-0.5.2
	encoding_rs_io-0.1.7
	untrusted-0.7.1
	bytemuck_derive-1.4.1
	winapi-util-0.1.5
	wayland-scanner-0.29.5
	egui_glow-0.22.0
	smithay-clipboard-0.6.6
	regex-syntax-0.7.2
	ring-0.16.20
	claxon-0.4.3
	jni-0.19.0
	url-2.3.1
	sctk-adwaita-0.5.4
	futures-io-0.3.28
	jack-sys-0.5.1
	windows_i686_gnu-0.42.2
	com-rs-0.2.1
	autocfg-1.1.0
	tokio-util-0.7.8
	backtrace-0.3.67
	is-terminal-0.4.7
	io-lifetimes-1.0.11
	windows_x86_64_msvc-0.42.2
	strict-num-0.1.1
	zbus_names-2.5.1
	zbus_macros-3.10.0
	zvariant_derive-3.14.0
	home-0.5.5
	tinyvec_macros-0.1.1
	mime-0.3.17
	core-foundation-sys-0.6.2
	pin-utils-0.1.0
	cexpr-0.6.0
	hexf-parse-0.2.1
	serde-1.0.163
	core-foundation-sys-0.8.4
	khronos-egl-4.1.0
	futures-lite-1.13.0
	rustix-0.37.19
	renderdoc-sys-1.0.0
	cfg-expr-0.15.1
	hashbrown-0.12.3
	atspi-0.10.1
	egui-0.22.0
	symphonia-0.5.3
	either-1.8.1
	miniz_oxide-0.6.2
	vec_map-0.8.2
	tokio-1.28.2
	bytemuck-1.13.1
	async-stream-0.3.5
	glutin-0.30.8
	iana-time-zone-0.1.56
	windows_i686_msvc-0.48.0
	downcast-rs-1.2.0
	mio-0.8.8
	ndk-context-0.1.1
	wasm-bindgen-macro-support-0.2.86
	ahash-0.8.3
	vcpkg-0.2.15
	msgbox-0.7.0
	httpdate-1.0.2
	wasm-bindgen-macro-0.2.86
	polling-2.8.0
	winreg-0.10.1
	hermit-abi-0.3.1
	wayland-sys-0.30.1
	gpu-alloc-types-0.2.0
	option-ext-0.2.0
	proc-macro-error-1.0.4
	d3d12-0.6.0
	glutin-winit-0.3.0
	ipnet-2.7.2
	serde_derive-1.0.163
	cairo-sys-rs-0.15.1
	symphonia-metadata-0.5.3
	pin-project-lite-0.2.9
	mach2-0.4.1
	scoped-tls-1.0.1
	foreign-types-shared-0.1.1
	object-0.30.3
	toml-0.5.11
	neli-proc-macros-0.1.3
	rand-0.8.5
	ppv-lite86-0.2.17
	native-tls-0.2.11
	tokio-tungstenite-0.19.0
	ewebsock-0.2.0
	cocoa-foundation-0.1.1
	dasp_sample-0.11.0
	type-map-0.5.0
	tracing-attributes-0.1.24
	emath-0.22.0
	openssl-probe-0.1.5
	bitflags-2.3.1
	shlex-1.1.0
	pkg-config-0.3.27
	khronos_api-3.1.0
	xshell-macros-0.2.3
	codespan-reporting-0.11.1
	core-graphics-types-0.1.1
	encoding_rs-0.8.32
	bindgen-0.64.0
	dlib-0.5.0
	objc_exception-0.1.2
	errno-0.2.8
	async-lock-2.7.0
	reqwest-0.11.18
	toml-0.7.4
	libloading-0.8.0
	which-4.4.0
	humantime-2.1.0
	hex-0.4.3
	android_log-sys-0.3.0
	ndk-sys-0.4.1+23.1.7779620
	crossbeam-utils-0.8.15
	coreaudio-sys-0.2.12
	serde_repr-0.1.12
	futures-channel-0.3.28
	glib-0.15.12
	pin-project-1.1.0
	windows-0.46.0
	zvariant_utils-1.0.1
	regex-1.8.3
	tiny-skia-0.8.4
	ndk-0.7.0
	proc-macro-error-attr-1.0.4
	winres-0.1.12
	ureq-2.6.2
	zbus-3.10.0
	block2-0.2.0-alpha.6
	wayland-cursor-0.29.5
	pico-args-0.5.0
	runas-1.1.0
	rosc-0.10.1
	idna-0.3.0
	calloop-0.10.5
	symphonia-bundle-mp3-0.5.3
	metal-0.24.0
	linux-raw-sys-0.3.8
	percent-encoding-2.2.0
	aho-corasick-1.0.1
	gdk-0.15.4
	sct-0.7.0
	wasm-bindgen-futures-0.4.36
	fastrand-1.9.0
	chrono-0.4.26
	serde_json-1.0.96
	xcursor-0.3.4
	gpu-descriptor-types-0.1.1
	proc-macro2-1.0.59
	time-0.1.45
	schannel-0.1.21
	static_assertions-1.1.0
	redox_syscall-0.2.16
	wasm-bindgen-0.2.86
	syn-2.0.18
	windows_x86_64_gnullvm-0.42.2
	openssl-macros-0.1.1
	tracing-core-0.1.31
	ryu-1.0.13
	hyper-0.14.26
	gobject-sys-0.15.10
	indexmap-1.9.3
	async-task-4.4.0
	parking_lot-0.12.1
	epaint-0.22.0
	http-0.2.9
	async-broadcast-0.5.1
	futures-task-0.3.28
	async-executor-1.5.1
	gtk3-macros-0.15.6
	jni-0.20.0
	arrayvec-0.7.2
	env_logger-0.10.0
	gtk-0.15.5
	glib-macros-0.15.13
	pin-project-internal-1.1.0
	system-deps-6.1.0
	itoa-1.0.6
	windows-implement-0.44.0
	enumflags2-0.7.7
	accesskit_windows-0.14.0
	image-0.24.6
	httparse-1.8.0
	malloc_buf-0.0.6
	ordered-stream-0.2.0
	error-code-2.3.1
	dirs-5.0.1
	ahash-0.7.6
	wgpu-0.16.1
	futures-executor-0.3.28
	tiny-skia-path-0.8.4
	socket2-0.4.9
	serde_spanned-0.6.2
	tokio-macros-2.1.0
	block-0.1.6
	android_system_properties-0.1.5
	winnow-0.4.6
	gpu-alloc-0.5.4
	data-encoding-2.4.0
	windows_x86_64_gnu-0.42.2
	dispatch-0.2.0
	bytes-1.4.0
	gio-sys-0.15.10
	profiling-1.0.8
	block-buffer-0.10.4
	symphonia-core-0.5.3
	neli-0.6.4
	oboe-0.5.0
	derivative-2.2.0
	winit-0.28.6
	crc32fast-1.3.2
	cfg_aliases-0.1.1
	thiserror-impl-1.0.40
	security-framework-sys-2.9.0
	http-body-0.4.5
	dirs-sys-0.4.1
	nix-0.25.1
	gloo-net-0.2.6
	slotmap-1.0.6
	nix-0.24.3
	instant-0.1.12
	gdk-pixbuf-0.15.11
	utf-8-0.7.6
	console_error_panic_hook-0.1.7
	windows_aarch64_msvc-0.42.2
	hyper-tls-0.5.0
	bit-set-0.5.3
	cc-1.0.79
	form_urlencoded-1.1.0
	cesu8-1.1.0
	unicode-xid-0.2.4
	memmap2-0.5.10
	android_logger-0.13.1
	async-trait-0.1.68
	dirs-4.0.0
	thiserror-1.0.40
	wgpu-core-0.16.1
	serde_urlencoded-0.7.1
	darling_macro-0.14.4
	libc-0.2.144
	core-graphics-0.22.3
	spin_sleep-1.1.1
	tinyvec-1.6.0
	gpu-descriptor-0.2.3
	webpki-0.22.0
	flate2-1.0.26
	darling-0.14.4
	dirs-sys-0.3.7
	walkdir-2.3.3
	tracing-0.1.37
	winapi-i686-pc-windows-gnu-0.4.0
	tempfile-3.5.0
	anyhow-1.0.71
	heck-0.4.1
	ttf-parser-0.19.0
	xi-unicode-0.3.0
	atspi-macros-0.2.0
	glam-0.24.0
	cocoa-0.24.1
	miniz_oxide-0.7.1
	accesskit_macos-0.7.0
	android-activity-0.4.1
	glyph_brush_layout-0.2.3
	approx-0.5.1
	bindgen-0.65.1
	windows-0.44.0
	gdk-pixbuf-sys-0.15.10
	unicode-ident-1.0.9
	orbclient-0.3.45
	openssl-sys-0.9.88
	rodio-0.17.1
	windows-targets-0.48.0
	clang-sys-1.6.1
	headers-core-0.2.0
	ntapi-0.4.1
	windows-sys-0.45.0
	openssl-0.10.54
	block-sys-0.1.0-beta.1
	version-compare-0.1.1
	sha1-0.10.5
	ogg-0.8.0
	xdg-2.5.0
	gtk-sys-0.15.3
	foreign-types-0.3.2
	hound-3.5.0
	x11-dl-2.21.0
	accesskit-0.11.0
	futures-macro-0.3.28
	redox_users-0.4.3
	spin-0.5.2
	memoffset-0.8.0
	proc-macro-crate-1.3.1
	memoffset-0.6.5
	arrayref-0.3.7
	png-0.17.8
	webpki-roots-0.22.6
	windows-0.48.0
	bincode-1.3.3
	android-properties-0.2.2
	accesskit_winit-0.14.0
	addr2line-0.19.0
	glob-0.3.1
	fdeflate-0.3.0
	windows-interface-0.44.0
	ecolor-0.22.0
	local-ip-address-0.5.3
	core-foundation-0.9.3
	egui-wgpu-0.22.0
	semver-1.0.17
	cpufeatures-0.2.7
	darling_core-0.14.4
	async-stream-impl-0.3.5
	futures-util-0.3.28
	generic-array-0.14.7
	clipboard-win-4.5.0
	async-recursion-1.0.4
	typenum-1.16.0
	futures-core-0.3.28
	exec-0.3.1
	toml_edit-0.19.10
	winapi-0.3.9
	simd-adler32-0.3.5
	widestring-1.0.2
	minimal-lexical-0.2.1
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.42.0
	num-rational-0.4.1
	rustc-hash-1.1.0
	ab_glyph-0.2.21
	objc_id-0.1.1
	pollster-0.3.0
	wayland-commons-0.29.5
	accesskit_unix-0.5.0
	libloading-0.7.4
	ab_glyph_rasterizer-0.1.8
	glutin_glx_sys-0.4.0
	x11rb-protocol-0.10.0
	owned_ttf_parser-0.19.0
	redox_syscall-0.3.5
	tungstenite-0.19.0
	unicode-bidi-0.3.13
	jobserver-0.1.26
	wasm-bindgen-shared-0.2.86
	log-0.4.18
	termcolor-1.2.0
	zvariant-3.14.0
	futures-0.3.28
	h2-0.3.19
	sysinfo-0.29.0
	tokio-native-tls-0.3.1
	num-traits-0.2.15
	field-offset-0.3.5
	winapi-wsapoll-0.1.1
	objc-foundation-0.1.1
	objc-sys-0.2.0-beta.2
	concurrent-queue-2.2.0
	web-sys-0.3.63
	gloo-utils-0.1.6
	iana-time-zone-haiku-0.1.2
	base64-0.21.2
	glow-0.12.2
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
	"${FILESDIR}/0001-Tweaks-for-Gentoo-ebuild.patch"
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
