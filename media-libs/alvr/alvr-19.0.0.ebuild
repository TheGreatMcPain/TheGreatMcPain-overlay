# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# You will need games-util/steam-client-meta from the steam-overlay for this to work

# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	log-0.4.17
	android_log-sys-0.2.0
	osmesa-sys-0.1.2
	bindgen-0.61.0
	windows_x86_64_gnu-0.42.0
	wasm-bindgen-0.2.83
	futures-io-0.3.25
	tiny-skia-path-0.7.0
	darling_macro-0.13.4
	settings-schema-derive-0.0.1+alvr
	wayland-client-0.29.5
	rodio-0.16.0
	hexf-parse-0.2.1
	jni-0.19.0
	ndk-macro-0.3.0
	clipboard-win-4.4.2
	sha1-0.10.5
	proc-macro-crate-1.2.1
	downcast-rs-1.2.0
	semver-parser-0.10.2
	rustc_version-0.2.3
	aho-corasick-0.7.19
	parking_lot-0.11.2
	ident_case-1.0.1
	gpu-descriptor-types-0.1.1
	proc-macro-error-attr-1.0.4
	chrono-0.4.22
	gio-0.15.12
	quote-0.6.13
	slotmap-1.0.6
	raw-window-handle-0.5.0
	rand-0.8.5
	cfg-if-1.0.0
	gpu-alloc-types-0.2.0
	cocoa-0.24.0
	hyper-0.14.20
	android_system_properties-0.1.5
	inplace_it-0.3.5
	dispatch-0.2.0
	winres-0.1.12
	glutin-0.29.1
	num_enum-0.5.7
	no-std-compat-0.4.1
	idna-0.3.0
	msgbox-0.7.0
	redox_syscall-0.2.16
	rand_core-0.6.4
	approx-0.5.1
	ndk-0.6.0
	once_cell-1.15.0
	toml-0.5.9
	xi-unicode-0.3.0
	freetype-sys-0.13.1
	windows_x86_64_msvc-0.36.1
	unicode-xid-0.1.0
	serde_json-1.0.87
	minimp3-0.5.1
	profiling-1.0.7
	proc-macro-error-1.0.4
	hermit-abi-0.1.19
	windows_x86_64_gnullvm-0.42.0
	encoding_rs-0.8.31
	foreign-types-0.3.2
	proc-macro2-1.0.47
	walkdir-2.3.2
	cc-1.0.73
	errno-0.2.8
	windows_i686_msvc-0.42.0
	tracing-0.1.37
	rustc_version-0.3.3
	dirs-4.0.0
	bytemuck_derive-1.2.1
	libloading-0.7.3
	object-0.29.0
	wasi-0.10.0+wasi-snapshot-preview1
	wayland-commons-0.29.5
	byteorder-1.4.3
	tinyfiledialogs-3.9.1
	http-0.2.8
	peeking_take_while-0.1.2
	wgpu-core-0.14.0
	getrandom-0.2.8
	bitflags-1.3.2
	cfg-expr-0.11.0
	failure-0.1.8
	lazy_static-1.4.0
	serde_urlencoded-0.7.1
	gpu-alloc-0.5.3
	ndk-glue-0.7.0
	core-foundation-sys-0.8.3
	servo-fontconfig-0.5.1
	rand_chacha-0.3.1
	parking_lot_core-0.8.5
	wasm-bindgen-macro-support-0.2.83
	minimal-lexical-0.2.1
	windows_x86_64_msvc-0.37.0
	xshell-macros-0.2.2
	slab-0.4.7
	wgpu-types-0.13.2
	shlex-1.1.0
	tokio-tungstenite-0.17.2
	futures-core-0.3.25
	cty-0.2.2
	futures-sink-0.3.25
	tungstenite-0.17.3
	hashbrown-0.8.2
	http-body-0.4.5
	jack-0.9.2
	dlopen_derive-0.1.4
	cairo-rs-0.15.12
	field-offset-0.3.4
	miniz_oxide-0.5.4
	smithay-clipboard-0.6.6
	static_assertions-1.1.0
	parking_lot_core-0.9.4
	headers-0.3.8
	semver-0.9.0
	futures-executor-0.3.25
	bit-set-0.5.3
	gpu-descriptor-0.2.3
	cxx-1.0.80
	glib-0.15.12
	adler-1.0.2
	gdk-pixbuf-0.15.11
	openssl-macros-0.1.0
	futures-0.3.25
	cocoa-foundation-0.1.0
	tokio-1.21.2
	openssl-0.10.42
	reqwest-0.11.12
	tracing-core-0.1.30
	xshell-0.2.2
	addr2line-0.17.0
	glyph_brush_layout-0.2.3
	generic-array-0.14.6
	unicode-xid-0.2.4
	version-compare-0.1.0
	version_check-0.9.4
	httpdate-1.0.2
	flate2-1.0.24
	crossbeam-channel-0.5.6
	iana-time-zone-0.1.51
	glutin_gles2_sys-0.1.5
	core-text-19.2.0
	scoped-tls-1.0.0
	digest-0.10.5
	tempfile-3.3.0
	raw-window-handle-0.4.3
	num-integer-0.1.45
	shared_library-0.1.9
	core-graphics-types-0.1.1
	jni-0.20.0
	windows_aarch64_msvc-0.37.0
	wasm-bindgen-shared-0.2.83
	wio-0.2.2
	autocfg-1.1.0
	tinyvec_macros-0.1.0
	calloop-0.10.1
	objc-foundation-0.1.1
	wgpu-0.14.0
	thiserror-1.0.37
	metal-0.24.0
	bindgen-0.59.2
	arboard-2.1.1
	socket2-0.4.7
	nix-0.25.0
	block-0.1.6
	glow-0.11.2
	redox_users-0.4.3
	nonzero_ext-0.2.0
	semver-parser-0.7.0
	alsa-sys-0.3.1
	percent-encoding-2.2.0
	ash-0.37.0+1.3.209
	block-buffer-0.10.3
	cesu8-1.1.0
	chunked_transfer-1.4.0
	xcursor-0.3.4
	memoffset-0.6.5
	lewton-0.10.2
	gdk-pixbuf-sys-0.15.10
	discard-1.0.4
	wgpu-hal-0.13.2
	crc32fast-1.3.2
	nom-7.1.1
	freetype-rs-0.26.0
	app_dirs2-2.5.4
	cfg_aliases-0.1.1
	owned_ttf_parser-0.17.0
	quote-1.0.21
	windows_i686_gnu-0.36.1
	mio-0.8.5
	gobject-sys-0.15.10
	form_urlencoded-1.1.0
	pango-0.15.10
	stdweb-0.4.20
	quanta-0.4.1
	windows_aarch64_gnullvm-0.42.0
	winreg-0.10.1
	which-3.1.1
	gimli-0.26.2
	iana-time-zone-haiku-0.1.1
	arrayref-0.3.6
	sha1_smol-1.0.0
	unicode-bidi-0.3.8
	nohash-hasher-0.2.0
	bit-vec-0.6.3
	atk-sys-0.15.1
	h2-0.3.15
	rustc-demangle-0.1.21
	webbrowser-0.7.1
	errno-dragonfly-0.1.2
	clang-sys-1.4.0
	proc-macro2-0.4.30
	windows_i686_msvc-0.36.1
	claxon-0.4.3
	wgpu-core-0.13.2
	same-file-1.0.6
	base-x-0.2.11
	glam-0.21.3
	mime-0.3.16
	glib-sys-0.15.10
	error-code-2.3.1
	cpal-0.14.1
	which-4.3.0
	heck-0.4.0
	tiny-skia-0.7.0
	windows_i686_msvc-0.37.0
	pin-project-lite-0.2.9
	windows_x86_64_gnu-0.36.1
	wayland-sys-0.29.5
	security-framework-2.7.0
	webbrowser-0.8.0
	cxx-build-1.0.80
	link-cplusplus-1.0.7
	gtk-sys-0.15.3
	sctk-adwaita-0.4.3
	scopeguard-1.1.0
	system-deps-6.0.3
	semver-0.11.0
	coreaudio-rs-0.10.0
	mach-0.3.2
	glob-0.3.0
	jack-sys-0.3.4
	windows-sys-0.36.1
	instant-0.1.12
	tokio-native-tls-0.3.0
	cgl-0.3.2
	num-derive-0.3.3
	gdk-0.15.4
	windows-0.37.0
	windows_x86_64_msvc-0.42.0
	serde_derive-1.0.147
	wayland-cursor-0.29.5
	str-buf-1.0.6
	ntapi-0.4.0
	wgpu-0.13.1
	bincode-1.3.3
	crossfont-0.5.1
	wgpu-hal-0.14.0
	time-0.1.44
	stdweb-internal-runtime-0.1.5
	minimp3-sys-0.3.2
	semver-1.0.14
	ahash-0.3.8
	base64-0.13.1
	objc-0.2.7
	malloc_buf-0.0.6
	oboe-sys-0.4.5
	rustc-hash-1.1.0
	combine-4.6.6
	winapi-wsapoll-0.1.1
	smartstring-1.0.1
	servo-fontconfig-sys-5.1.0
	tinyvec-1.6.0
	scratch-1.0.2
	sha1-0.6.1
	fxhash-0.2.1
	foreign-types-shared-0.3.1
	bumpalo-3.11.1
	dlib-0.5.0
	ipnet-2.5.0
	gdk-sys-0.15.1
	os_str_bytes-6.3.0
	gtk3-macros-0.15.4
	ppv-lite86-0.2.16
	fern-0.6.1
	arrayvec-0.7.2
	windows_i686_gnu-0.42.0
	naga-0.10.0
	alsa-0.6.0
	dashmap-4.0.2
	governor-0.3.2
	windows_x86_64_gnu-0.37.0
	winapi-i686-pc-windows-gnu-0.4.0
	itoa-1.0.4
	hound-3.5.0
	smallvec-1.10.0
	futures-channel-0.3.25
	stdweb-internal-macros-0.2.9
	wasm-bindgen-backend-0.2.83
	d3d12-0.5.0
	security-framework-sys-2.6.1
	smithay-client-toolkit-0.16.0
	cmake-0.1.48
	codespan-reporting-0.11.1
	x11-dl-2.20.0
	renderdoc-sys-0.7.1
	hashbrown-0.12.3
	naga-0.9.0
	single-instance-0.3.3
	url-2.3.1
	darling_core-0.13.4
	cxxbridge-flags-1.0.80
	gtk-0.15.5
	memchr-2.5.0
	darling-0.13.4
	nonzero_ext-0.3.0
	cxxbridge-macro-1.0.80
	pollster-0.2.5
	windows_aarch64_msvc-0.42.0
	ndk-0.7.0
	atk-0.15.1
	xml-rs-0.8.4
	futures-timer-3.0.2
	widestring-1.0.2
	syn-1.0.103
	ab_glyph_rasterizer-0.1.7
	cpufeatures-0.2.5
	safe_arch-0.5.2
	slice-deque-0.3.0
	khronos-egl-4.1.0
	serde-1.0.147
	humantime-2.1.0
	glutin_glx_sys-0.1.8
	atty-0.2.14
	ndk-sys-0.3.0
	schannel-0.1.20
	ahash-0.8.0
	fnv-1.0.7
	native-tls-0.2.10
	libc-0.2.137
	windows-0.42.0
	glutin_wgl_sys-0.1.5
	anyhow-1.0.66
	regex-syntax-0.6.27
	expat-sys-2.1.6
	ndk-glue-0.6.2
	encoding_rs_io-0.1.7
	copyless-0.1.5
	rhai-1.10.1
	ttf-parser-0.17.1
	gio-sys-0.15.10
	indexmap-1.9.1
	runas-0.2.1
	xdg-2.4.1
	utf-8-0.7.6
	syn-0.15.44
	objc_id-0.1.1
	thiserror-impl-1.0.37
	atomic_refcell-0.1.8
	foreign-types-macros-0.2.2
	wgpu-types-0.14.0
	windows_i686_gnu-0.37.0
	core-graphics-0.22.3
	futures-util-0.3.25
	winapi-util-0.1.5
	windows-sys-0.42.0
	objc_exception-0.1.2
	stdweb-derive-0.5.3
	openssl-sys-0.9.77
	winit-0.27.5
	bytemuck-1.12.1
	winapi-0.3.9
	gethostname-0.2.3
	wayland-protocols-0.29.5
	headers-core-0.2.0
	ndk-sys-0.4.0
	unicode-segmentation-1.10.0
	oboe-0.4.6
	widestring-0.5.1
	glib-macros-0.15.11
	pico-args-0.5.0
	tokio-util-0.7.4
	ogg-0.8.0
	type-map-0.5.0
	nix-0.24.2
	futures-macro-0.3.25
	regex-1.6.0
	tower-service-0.3.2
	glutin_egl_sys-0.1.6
	wasm-bindgen-futures-0.4.33
	dirs-sys-0.3.7
	hyper-tls-0.5.0
	jobserver-0.1.25
	sha-1-0.10.0
	either-1.8.0
	try-lock-0.2.3
	cexpr-0.6.0
	ndk-context-0.1.1
	rhai_codegen-1.4.2
	gl_generator-0.14.0
	sysinfo-0.26.6
	num-traits-0.2.15
	foreign-types-shared-0.1.1
	want-0.3.0
	backtrace-0.3.66
	pin-utils-0.1.0
	heck-0.3.3
	ryu-1.0.11
	pango-sys-0.15.10
	crossbeam-utils-0.8.12
	bytes-1.2.1
	openssl-probe-0.1.5
	spirv-0.2.0+1.5.4
	ab_glyph-0.2.18
	settings-schema-0.0.1+alvr
	remove_dir_all-0.5.3
	tokio-macros-1.8.0
	pest-2.4.0
	lazycell-1.3.0
	coreaudio-sys-0.2.10
	typenum-1.15.0
	android_logger-0.11.1
	alcro-0.5.4
	foreign-types-0.5.0
	num_enum_derive-0.5.7
	ahash-0.7.6
	wayland-egl-0.29.5
	env_logger-0.9.1
	vec_map-0.8.2
	jni-sys-0.3.0
	memmap2-0.5.7
	dwrote-0.11.0
	nix-0.23.1
	lock_api-0.4.9
	vcpkg-0.2.15
	winapi-x86_64-pc-windows-gnu-0.4.0
	wayland-scanner-0.29.5
	nix-0.22.3
	futures-task-0.3.25
	unicode-ident-1.0.5
	dashmap-5.4.0
	termcolor-1.1.3
	core-foundation-0.9.3
	web-sys-0.3.60
	wasm-bindgen-macro-0.2.83
	arrayvec-0.5.2
	khronos_api-3.1.0
	range-alloc-0.1.2
	ureq-2.5.0
	widestring-0.4.3
	js-sys-0.3.60
	crypto-common-0.1.6
	wasi-0.11.0+wasi-snapshot-preview1
	strsim-0.10.0
	unicode-normalization-0.1.22
	signal-hook-registry-1.4.0
	httparse-1.8.0
	cairo-sys-rs-0.15.1
	pkg-config-0.3.26
	parking_lot-0.12.1
	exec-0.3.1
	unicode-width-0.1.10
	dlopen-0.1.8
	num_cpus-1.13.1
	fastrand-1.8.0
	ucd-trie-0.1.5
	png-0.17.6
	windows_aarch64_msvc-0.36.1
	x11rb-0.9.0
"

inherit desktop cargo xdg

DESCRIPTION="ALVR is an open source remote VR display for the Oculus Go/Quest"
HOMEPAGE="https://github.com/alvr-org/ALVR"
SRC_URI="https://github.com/alvr-org/ALVR/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" $(cargo_crate_uris) "

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="network-sandbox" # Required for 'cargo fetch'

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

src_unpack() {
	cargo_src_unpack

	# ALVR requires some dependencies not on crate.io (forks of other libraries)
	# so will just have to fetch them here.
	pushd "${S}"
	cargo -v --config "net.offline = false" fetch
	popd
}

src_configure() {
	local ECARGO_EXTRA_ARGS="
		-p alvr_vrcompositor_wrapper
		$(usex server "-p alvr_server" "" )
		$(usex client "-p alvr_client_core -p alvr_launcher" "" )
		$(usex vulkan "-p alvr_vulkan_layer" "" )
		"
	cargo_src_configure
}

src_install() {
	if use client; then
		dobin target/release/alvr_launcher
		dolib.so target/release/libalvr_client_core.so
		domenu packaging/freedesktop/alvr.desktop
		for size in {16,32,48,64,128,256}; do
			convert alvr/launcher/res/launcher.ico \
				-thumbnail ${size} -alpha on -background none -flatten \
				${PN}-${size}.png || die
			newicon -s ${size} ${PN}-${size}.png ${PN}.png
		done
	fi

	if use server; then
		exeinto /usr/lib64/alvr/bin/linux64/
		newexe target/release/libalvr_server.so driver_alvr_server.so

		insinto /usr/lib64/alvr/
		doins alvr/xtask/resources/driver.vrdrivermanifest

	fi

	if use vulkan; then
		dolib.so target/release/libalvr_vulkan_layer.so
		insinto /usr/share/vulkan/explicit_layer.d/
		doins alvr/vulkan_layer/layer/alvr_x86_64.json
	fi

	exeinto /usr/libexec/alvr
	newexe target/release/alvr_vrcompositor_wrapper vrcompositor-wrapper
	doexe packaging/firewall/alvr_fw_config.sh

	insinto /usr/share/${PN}/selinux/
	doins packaging/selinux/*

	insinto /usr/share/${PN}/
	doins -r dashboard

	insinto /usr/lib/firewalld/services/
	doins packaging/firewall/alvr-firewalld.xml

	insinto /etc/ufw/applications.d/
	doins packaging/firewall/ufw-alvr
}
