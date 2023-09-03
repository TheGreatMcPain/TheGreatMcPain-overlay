# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

# Pulled from fem-overlay
GO_DEP_ARCHIVE_VER="2023-09-03"
GO_DEP_ARCHIVE_PV="${PV}+${GO_DEP_ARCHIVE_VER}"
GO_DEP_ARCHIVE_P="${PN}-deps-${GO_DEP_ARCHIVE_PV}"
GO_VENDOR_BASEURI="https://gitlab.com/api/v4/projects/42159594/packages/generic"
GO_VENDOR_ARCHIVE_NAME="${P}-deps.tar.xz"
GO_SRC_URI="${GO_VENDOR_BASEURI}/${PN}/${GO_DEP_ARCHIVE_PV//+/%2B}/${GO_VENDOR_ARCHIVE_NAME} -> ${GO_DEP_ARCHIVE_P}.tar.xz"

DESCRIPTION="MPD client with builtin cover-art view and LastFM integration."
HOMEPAGE="https://github.com/aditya-K2/goMP"
SRC_URI="
	https://github.com/aditya-K2/goMP/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${GO_SRC_URI}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	ego build
}

src_install() {
	dobin gomp
}
