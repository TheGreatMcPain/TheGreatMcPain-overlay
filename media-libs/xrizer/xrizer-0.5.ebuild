# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Pulled from fem-overlay
CARGO_DEP_ARCHIVE_VER="2026-04-16"
CARGO_DEP_ARCHIVE_PV="${PV}+${CARGO_DEP_ARCHIVE_VER}"
CARGO_DEP_ARCHIVE_P="${PN}-deps-${CARGO_DEP_ARCHIVE_PV}"
CARGO_VENDOR_BASEURI="https://gitlab.com/api/v4/projects/42159594/packages/generic"
CARGO_VENDOR_ARCHIVE_NAME="${P}-deps.tar.xz"
CARGO_VENDOR_SRC_URI="${CARGO_VENDOR_BASEURI}/${PN}/${CARGO_DEP_ARCHIVE_PV//+/%2B}/${CARGO_VENDOR_ARCHIVE_NAME} -> ${CARGO_DEP_ARCHIVE_P}.tar.xz"

RUST_MULTILIB=1
RUST_MIN_VER="1.83.0"
inherit cargo multilib-minimal

DESCRIPTION="OpenVR over OpenXR compatibility layer"
HOMEPAGE="https://github.com/Supreeeme/xrizer/"
OPENXR_SDK_VER="1.1.40"

SRC_URI="
	${CARGO_VENDOR_SRC_URI}
	https://github.com/Supreeeme/xrizer/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.tar.gz
"
LICENSE="GPL-3+"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD Boost-1.0 ISC MIT OFL-1.1 UbuntuFontLicense-1.0
	Unicode-3.0 ZLIB
"
SLOT="0"

KEYWORDS="~amd64"

src_unpack() {
	cargo_src_unpack

	ln -s "${WORKDIR}/vendor" "${S}/" || die

	sed -i "${ECARGO_HOME}/config.toml" -e '/source.crates-io/d'  || die
	sed -i "${ECARGO_HOME}/config.toml" -e '/replace-with = "gentoo"/d'  || die
	sed -i "${ECARGO_HOME}/config.toml" -e '/local-registry = "\/nonexistent"/d'  || die
	cat "${WORKDIR}/vendor/vendor-config.toml" >> "${ECARGO_HOME}/config.toml" || die
}

src_prepare() {
	default
	multilib_copy_sources
}

multilib_src_compile() {
	cargo_src_compile
}

multilib_src_install() {
	# OpenVR expects this particular directory structure.
	exeinto "/opt/${PN}/bin$(multilib_is_native_abi && echo /linux64)"
	newexe "$(cargo_target_dir)"/libxrizer.so vrclient.so
	touch "${ED}/opt/${PN}/version.txt"
}
