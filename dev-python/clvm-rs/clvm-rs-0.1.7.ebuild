# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit python-r1 flag-o-matic

DESCRIPTION="Rust implementation of clvm"
HOMEPAGE="https://github.com/Chia-Network/clvm_rs"
SRC_URI="https://github.com/Chia-Network/clvm_rs/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="network-sandbox"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/maturin
	dev-python/wheel
"

S="${WORKDIR}/clvm_rs-${PV}"

# TODO use the cargo.eclass

src_configure() {
	# Will fail to import without fat-objects.
	# Only really applicable to LTO.
	append-flags "-ffat-lto-objects"
}

src_compile() {
	cargo build --release -vv
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
