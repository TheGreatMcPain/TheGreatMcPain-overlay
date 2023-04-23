# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# You will need games-util/steam-client-meta from the steam-overlay for this to work
#
# CRATES list was generated using the script found in 'Documents/alvr_get_crates.py'

EAPI=8

CRATES="
	spirv-0.2.0+1.5.4
	darling_core-0.13.4
	glow-0.11.2
	cocoa-0.24.1
	pkg-config-0.3.26
	nix-0.22.3
	quote-1.0.23
	windows_i686_msvc-0.42.1
	governor-0.3.2
	rhai-1.12.0
	minimp3-0.5.1
	stdweb-internal-runtime-0.1.5
	servo-fontconfig-sys-5.1.0
	block-0.1.6
	tempfile-3.3.0
	bytemuck_derive-1.4.0
	dirs-4.0.0
	sha1-0.10.5
	ab_glyph_rasterizer-0.1.8
	minimp3-sys-0.3.2
	alsa-0.6.0
	memoffset-0.6.5
	slab-0.4.7
	socket2-0.4.7
	libc-0.2.139
	peeking_take_while-0.1.2
	dlib-0.5.0
	gtk-0.15.5
	num_enum-0.5.9
	link-cplusplus-1.0.8
	tokio-util-0.7.4
	gimli-0.27.1
	bitflags-1.3.2
	gpu-alloc-0.5.3
	humantime-2.1.0
	smithay-clipboard-0.6.6
	memmap2-0.5.8
	bit-set-0.5.3
	unicode-bidi-0.3.10
	windows-sys-0.45.0
	nohash-hasher-0.2.0
	d3d12-0.5.0
	cairo-rs-0.15.12
	cxx-build-1.0.89
	wayland-cursor-0.29.5
	ahash-0.7.6
	foreign-types-macros-0.2.2
	futures-core-0.3.26
	darling-0.13.4
	proc-macro2-0.4.30
	tinyvec-1.6.0
	which-4.4.0
	scratch-1.0.3
	num_enum_derive-0.5.9
	winres-0.1.12
	png-0.17.7
	malloc_buf-0.0.6
	raw-window-handle-0.5.0
	glob-0.3.1
	anyhow-1.0.69
	futures-task-0.3.26
	smartstring-1.0.1
	naga-0.10.0
	raw-window-handle-0.4.3
	msgbox-0.7.0
	combine-4.6.6
	proc-macro-hack-0.5.20+deprecated
	no-std-compat-0.4.1
	ash-0.37.2+1.3.238
	heck-0.4.1
	osmesa-sys-0.1.2
	jni-sys-0.3.0
	addr2line-0.19.0
	ndk-glue-0.6.2
	rodio-0.16.0
	regex-1.7.1
	webbrowser-0.7.1
	gobject-sys-0.15.10
	crunchy-0.2.2
	lock_api-0.4.9
	semver-parser-0.10.2
	copyless-0.1.5
	ppv-lite86-0.2.17
	parking_lot_core-0.9.7
	cty-0.2.2
	proc-macro-crate-1.3.0
	semver-0.9.0
	webbrowser-0.8.7
	shlex-1.1.0
	glutin-0.29.1
	autocfg-1.1.0
	oboe-0.4.6
	utf-8-0.7.6
	gl_generator-0.14.0
	wgpu-types-0.14.1
	winit-0.27.5
	idna-0.3.0
	try-lock-0.2.4
	flate2-1.0.25
	dwrote-0.11.0
	const-random-0.1.15
	pico-args-0.5.0
	arrayvec-0.7.2
	cxx-1.0.89
	block-buffer-0.10.3
	stdweb-0.4.20
	backtrace-0.3.67
	http-body-0.4.5
	libloading-0.7.4
	gpu-descriptor-types-0.1.1
	core-graphics-0.22.3
	bincode-1.3.3
	cairo-sys-rs-0.15.1
	heck-0.3.3
	tokio-1.25.0
	thiserror-1.0.38
	syn-0.15.44
	ryu-1.0.12
	wasm-bindgen-macro-0.2.84
	hexf-parse-0.2.1
	winapi-util-0.1.5
	bindgen-0.61.0
	winapi-wsapoll-0.1.1
	fastrand-1.8.0
	windows_x86_64_msvc-0.42.1
	pin-project-lite-0.2.9
	android_logger-0.11.1
	core-text-19.2.0
	hound-3.5.0
	owned_ttf_parser-0.18.1
	version-compare-0.1.1
	glam-0.22.0
	clipboard-win-4.5.0
	env_logger-0.9.3
	objc_id-0.1.1
	settings-schema-derive-0.0.1+alvr
	ahash-0.3.8
	itoa-1.0.5
	stdweb-derive-0.5.3
	winreg-0.10.1
	nonzero_ext-0.3.0
	parking_lot-0.12.1
	atomic_refcell-0.1.9
	nonzero_ext-0.2.0
	pollster-0.2.5
	semver-parser-0.7.0
	scoped-tls-1.0.1
	crossbeam-utils-0.8.14
	wayland-commons-0.29.5
	openssl-probe-0.1.5
	time-0.1.45
	dirs-sys-0.3.7
	vcpkg-0.2.15
	once_cell-1.17.0
	unicode-ident-1.0.6
	tinyvec_macros-0.1.1
	smallvec-1.10.0
	renderdoc-sys-0.7.1
	ndk-0.7.0
	system-deps-6.0.3
	type-map-0.5.0
	wasm-bindgen-macro-support-0.2.84
	ipnet-2.7.1
	gdk-pixbuf-0.15.11
	num-integer-0.1.45
	cexpr-0.6.0
	semver-0.11.0
	wayland-sys-0.29.5
	widestring-0.5.1
	glyph_brush_layout-0.2.3
	chrono-0.4.23
	slice-deque-0.3.0
	termcolor-1.2.0
	windows-targets-0.42.1
	futures-macro-0.3.26
	byteorder-1.4.3
	headers-0.3.8
	tiny-skia-0.7.0
	bytes-1.4.0
	glib-macros-0.15.11
	reqwest-0.11.14
	winapi-i686-pc-windows-gnu-0.4.0
	xi-unicode-0.3.0
	khronos_api-3.1.0
	jack-0.9.2
	syn-1.0.107
	approx-0.5.1
	glutin_gles2_sys-0.1.5
	futures-io-0.3.26
	futures-0.3.26
	fnv-1.0.7
	redox_users-0.4.3
	glutin_glx_sys-0.1.8
	hyper-tls-0.5.0
	base64-0.13.1
	url-2.3.1
	wasi-0.11.0+wasi-snapshot-preview1
	windows_aarch64_gnullvm-0.42.1
	unicode-xid-0.1.0
	dashmap-5.4.0
	futures-util-0.3.26
	nom8-0.2.0
	wgpu-hal-0.13.2
	windows_aarch64_msvc-0.37.0
	encoding_rs_io-0.1.7
	hashbrown-0.12.3
	os_str_bytes-6.4.1
	wasm-bindgen-backend-0.2.84
	tinyfiledialogs-3.9.1
	unicode-segmentation-1.10.1
	windows_i686_msvc-0.36.1
	gtk-sys-0.15.3
	calloop-0.10.5
	sctk-adwaita-0.4.3
	discard-1.0.4
	core-graphics-types-0.1.1
	futures-executor-0.3.26
	objc-foundation-0.1.1
	pest-2.5.5
	tracing-core-0.1.30
	nix-0.24.3
	toml_edit-0.18.1
	settings-schema-0.0.1+alvr
	str-buf-1.0.6
	glutin_wgl_sys-0.1.5
	gethostname-0.2.3
	version_check-0.9.4
	nix-0.23.2
	pango-sys-0.15.10
	cmake-0.1.49
	bumpalo-3.12.0
	futures-channel-0.3.26
	crossbeam-channel-0.5.6
	slotmap-1.0.6
	foreign-types-shared-0.1.1
	downcast-rs-1.2.0
	object-0.30.3
	android_system_properties-0.1.5
	windows_i686_gnu-0.36.1
	gio-sys-0.15.10
	errno-dragonfly-0.1.2
	hermit-abi-0.1.19
	miniz_oxide-0.6.2
	widestring-0.4.3
	same-file-1.0.6
	wgpu-core-0.14.2
	cpal-0.14.2
	indexmap-1.9.2
	wayland-client-0.29.5
	x11rb-0.9.0
	winapi-0.3.9
	runas-0.2.1
	wgpu-types-0.13.2
	ogg-0.8.0
	windows_x86_64_gnu-0.37.0
	cesu8-1.1.0
	rustc-demangle-0.1.21
	lazycell-1.3.0
	hyper-0.14.24
	objc-0.2.7
	expat-sys-2.1.6
	servo-fontconfig-0.5.1
	gdk-pixbuf-sys-0.15.10
	getrandom-0.2.8
	gio-0.15.12
	httpdate-1.0.2
	profiling-1.0.7
	rustc_version-0.3.3
	windows-sys-0.42.0
	local-ip-address-0.5.1
	windows_i686_gnu-0.37.0
	bytemuck-1.13.0
	range-alloc-0.1.2
	unicode-width-0.1.10
	base64-0.21.0
	num_cpus-1.15.0
	single-instance-0.3.3
	neli-0.5.3
	proc-macro2-1.0.51
	arrayvec-0.5.2
	thiserror-impl-1.0.38
	tokio-tungstenite-0.17.2
	failure-0.1.8
	wasi-0.10.0+wasi-snapshot-preview1
	unicode-normalization-0.1.22
	scopeguard-1.1.0
	cc-1.0.79
	jni-0.20.0
	digest-0.10.6
	wgpu-0.14.2
	quanta-0.4.1
	mime-0.3.16
	safe_arch-0.5.2
	foreign-types-0.3.2
	freetype-sys-0.13.1
	proc-macro-error-1.0.4
	tower-service-0.3.2
	gpu-alloc-types-0.2.0
	wgpu-hal-0.14.1
	wayland-protocols-0.29.5
	dispatch-0.2.0
	ndk-macro-0.3.0
	windows-0.42.0
	memchr-2.5.0
	aho-corasick-0.7.20
	iana-time-zone-haiku-0.1.1
	tiny-keccak-2.0.2
	ucd-trie-0.1.5
	windows_x86_64_msvc-0.37.0
	ureq-2.6.2
	security-framework-2.8.2
	instant-0.1.12
	nix-0.25.1
	vec_map-0.8.2
	core-foundation-0.9.3
	parking_lot_core-0.8.6
	clang-sys-1.4.0
	dlopen-0.1.8
	ndk-context-0.1.1
	shared_library-0.1.9
	xshell-macros-0.2.3
	const-random-macro-0.1.15
	ndk-sys-0.4.1+23.1.7779620
	remove_dir_all-0.5.3
	core-foundation-sys-0.8.3
	windows_x86_64_gnu-0.36.1
	unicode-xid-0.2.4
	ident_case-1.0.1
	jni-0.19.0
	wasm-bindgen-0.2.84
	glib-sys-0.15.10
	adler-1.0.2
	gdk-0.15.4
	serde_urlencoded-0.7.1
	num-traits-0.2.15
	wasm-bindgen-futures-0.4.34
	alcro-0.5.4
	glib-0.15.12
	tokio-macros-1.8.2
	jobserver-0.1.25
	winapi-x86_64-pc-windows-gnu-0.4.0
	oboe-sys-0.4.5
	windows_aarch64_msvc-0.42.1
	rustc_version-0.2.3
	x11-dl-2.21.0
	mio-0.8.5
	errno-0.2.8
	http-0.2.8
	ttf-parser-0.18.1
	cocoa-foundation-0.1.0
	signal-hook-registry-1.4.0
	ntapi-0.4.0
	serde-1.0.152
	atk-sys-0.15.1
	xshell-0.2.3
	headers-core-0.2.0
	openssl-0.10.45
	cgl-0.3.2
	schannel-0.1.21
	wgpu-0.13.1
	freetype-rs-0.26.0
	strsim-0.10.0
	pango-0.15.10
	sysinfo-0.26.9
	cpufeatures-0.2.5
	wayland-egl-0.29.5
	num-derive-0.3.3
	pin-utils-0.1.0
	futures-sink-0.3.26
	naga-0.9.0
	foreign-types-0.5.0
	arboard-2.1.1
	redox_syscall-0.2.16
	walkdir-2.3.2
	jack-sys-0.3.4
	windows-0.37.0
	ahash-0.8.3
	serde_derive-1.0.152
	wio-0.2.2
	alsa-sys-0.3.1
	coreaudio-rs-0.10.0
	field-offset-0.3.4
	gdk-sys-0.15.1
	ab_glyph-0.2.20
	xdg-2.4.1
	bit-vec-0.6.3
	codespan-reporting-0.11.1
	glutin_egl_sys-0.1.6
	rhai_codegen-1.5.0
	dashmap-4.0.2
	cfg-if-1.0.0
	windows_i686_gnu-0.42.1
	claxon-0.4.3
	sha1-0.6.1
	openssl-sys-0.9.80
	sha1_smol-1.0.0
	windows_aarch64_msvc-0.36.1
	rand-0.8.5
	semver-1.0.16
	iana-time-zone-0.1.53
	futures-timer-3.0.2
	percent-encoding-2.2.0
	error-code-2.3.1
	h2-0.3.15
	app_dirs2-2.5.4
	hermit-abi-0.2.6
	objc_exception-0.1.2
	windows_x86_64_msvc-0.36.1
	cfg-expr-0.11.0
	gtk3-macros-0.15.4
	android_log-sys-0.2.0
	rustc-hash-1.1.0
	tokio-native-tls-0.3.1
	arrayref-0.3.6
	security-framework-sys-2.8.0
	cxxbridge-macro-1.0.89
	web-sys-0.3.61
	cfg_aliases-0.1.1
	toml-0.5.11
	dlopen_derive-0.1.4
	khronos-egl-4.1.0
	xml-rs-0.8.4
	sha-1-0.10.1
	foreign-types-shared-0.3.1
	static_assertions-1.1.0
	atty-0.2.14
	fxhash-0.2.1
	windows_x86_64_gnu-0.42.1
	rand_chacha-0.3.1
	exec-0.3.1
	rand_core-0.6.4
	lazy_static-1.4.0
	crypto-common-0.1.6
	ndk-0.6.0
	generic-array-0.14.6
	ndk-sys-0.3.0
	hashbrown-0.8.2
	mach-0.3.2
	wayland-scanner-0.29.5
	cxxbridge-flags-1.0.89
	windows_x86_64_gnullvm-0.42.1
	widestring-1.0.2
	toml_datetime-0.5.1
	log-0.4.17
	atk-0.15.1
	either-1.8.1
	fern-0.6.1
	darling_macro-0.13.4
	coreaudio-sys-0.2.11
	serde_json-1.0.93
	gpu-descriptor-0.2.3
	minimal-lexical-0.2.1
	metal-0.24.0
	windows_i686_msvc-0.37.0
	form_urlencoded-1.1.0
	crossfont-0.5.1
	windows-sys-0.36.1
	base-x-0.2.11
	proc-macro-error-attr-1.0.4
	openssl-macros-0.1.0
	stdweb-internal-macros-0.2.9
	typenum-1.16.0
	tiny-skia-path-0.7.0
	want-0.3.0
	tracing-0.1.37
	encoding_rs-0.8.32
	lewton-0.10.2
	which-3.1.1
	wasm-bindgen-shared-0.2.84
	ndk-glue-0.7.0
	crc32fast-1.3.2
	js-sys-0.3.61
	regex-syntax-0.6.28
	nom-7.1.3
	parking_lot-0.11.2
	xcursor-0.3.4
	httparse-1.8.0
	quote-0.6.13
	wgpu-core-0.13.2
	native-tls-0.2.11
	tungstenite-0.17.3
	smithay-client-toolkit-0.16.0
	inplace_it-0.3.5
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
	|| (
		www-client/chromium
		www-client/chromium-bin
	)
"

DEPEND="${RDEPEND}"

BDEPEND="${RDEPEND}
	virtual/pkgconfig
"

PATCHES="${FILESDIR}/0001-vulkan_layer-Use-negotiate-function.patch"

S="${WORKDIR}/ALVR-${PV}"

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
		-p alvr_server
		-p alvr_launcher
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

	# dashboard resources
	insinto /usr/share/alvr/
	doins -r dashboard

	# Launcher
	dobin target/release/alvr_launcher

	# Desktop
	domenu packaging/freedesktop/alvr.desktop

	# Icons
	for size in {16,32,48,64,128,256}; do
		convert alvr/launcher/res/launcher.ico \
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
