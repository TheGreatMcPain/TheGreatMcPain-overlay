# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
autocfg-1.0.1
bitflags-1.2.1
bitvec-0.20.1
block-buffer-0.7.3
block-padding-0.1.5
bls12_381-0.4.0
byte-tools-0.3.1
byteorder-1.4.2
cc-1.0.67
cfg-if-1.0.0
ctor-0.1.19
digest-0.8.1
fake-simd-0.1.2
ff-0.9.0
foreign-types-0.3.2
foreign-types-shared-0.1.1
funty-1.1.0
generic-array-0.12.4
ghost-0.1.2
group-0.9.0
hex-0.4.2
indoc-0.3.6
indoc-impl-0.3.6
instant-0.1.9
inventory-0.1.10
inventory-impl-0.1.10
lazy_static-1.4.0
libc-0.2.86
lock_api-0.4.2
num-bigint-0.3.1
num-integer-0.1.44
num-traits-0.2.14
opaque-debug-0.2.3
openssl-0.10.32
openssl-src-111.14.0+1.1.1j
openssl-sys-0.9.60
pairing-0.19.0
parking_lot-0.11.1
parking_lot_core-0.8.3
paste-0.1.18
paste-impl-0.1.18
pkg-config-0.3.19
proc-macro-hack-0.5.19
proc-macro2-1.0.24
pyo3-0.13.2
pyo3-macros-0.13.2
pyo3-macros-backend-0.13.2
quote-1.0.9
radium-0.6.2
rand_core-0.6.2
redox_syscall-0.2.5
scopeguard-1.1.0
sha2-0.8.2
smallvec-1.6.1
subtle-2.4.0
syn-1.0.60
tap-1.0.1
typenum-1.12.0
unicode-xid-0.2.1
unindent-0.1.7
vcpkg-0.2.11
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wyz-0.2.0
"

PYTHON_COMPAT=( python3_{6..9} )
inherit python-r1 flag-o-matic cargo

DESCRIPTION="Rust implementation of clvm"
HOMEPAGE="https://github.com/Chia-Network/clvm_rs"
SRC_URI="
	https://github.com/Chia-Network/clvm_rs/archive/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="Apache-2.0 BSD MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/maturin
	dev-python/wheel
"

S="${WORKDIR}/clvm_rs-${PV}"

src_configure() {
	# Will fail to import without fat-objects.
	# Only really applicable to LTO.
	append-flags "-ffat-lto-objects"

	cargo_src_configure
}

src_install() {
	install_from_wheels() {
		# Create wheel with maturin
		maturin build --release \
			--no-sdist \
			--manylinux "off" \
			--interpreter ${EPYTHON}

		# Unpack wheel
		whl_dir=$(ls "target/wheels/"*whl)
		wheel unpack ${whl_dir}

		# Delete whl
		rm -v ${whl_dir}

		# Install module
		insinto "$(python_get_sitedir)"
		doins -r "clvm_rs-${PV}"/*
	}

	python_foreach_impl install_from_wheels
}
