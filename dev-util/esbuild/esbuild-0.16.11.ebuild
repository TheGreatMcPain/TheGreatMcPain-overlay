# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

# Pulled from fem-overlay
GO_DEP_ARCHIVE_VER="2022-12-28"
GO_DEP_ARCHIVE_PV="${PV}+${GO_DEP_ARCHIVE_VER}"
GO_DEP_ARCHIVE_P="${PN}-deps-${GO_DEP_ARCHIVE_PV}"
GO_VENDOR_BASEURI="https://gitlab.com/api/v4/projects/42159594/packages/generic"
GO_VENDOR_ARCHIVE_NAME="${P}-deps.tar.xz"
GO_SRC_URI="${GO_VENDOR_BASEURI}/${PN}/${GO_DEP_ARCHIVE_PV//+/%2B}/${GO_VENDOR_ARCHIVE_NAME} -> ${GO_DEP_ARCHIVE_P}.tar.xz"

DESCRIPTION="An extremely fast JavaScript and CSS bundler and minifier"
HOMEPAGE="https://esbuild.github.io/"
SRC_URI="
	https://github.com/evanw/esbuild/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${GO_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin esbuild
}
