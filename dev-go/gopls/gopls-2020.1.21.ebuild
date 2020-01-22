# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="golang.org/x/tools"
GOLANG_PKG_NAME="gopls"
GOLANG_PKG_VERSION="f88bd70502673c183446a9f155e6ad648ccf528f"
#GOLANG_PKG_IS_MULTIPLE=0
#GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/net:569280f -> golang.org/x"
	"github.com/golang/sync:cd5d95a -> golang.org/x"
	"github.com/golang/xerrors:9bdfabe -> golang.org/x"
	"github.com/sergi/go-diff:58c5cb1"
	"github.com/golang/mod:accd165 -> golang.org/x"
	"github.com/dominikh/go-tools:2774002 -> honnef.co/go"
	"github.com/mvdan/xurls:b13bca4 -> mvdan.cc/xurls"
	"github.com/BurntSushi/toml:3012a1d"
)

SRC_URI="https://github.com/golang/tools/archive/${GOLANG_PKG_VERSION}.tar.gz -> ${GOLANG_PKG_NAME}-${GOLANG_PKG_VERSION}.tar.gz"

inherit golang-single

DESCRIPTION="gopls from golang.org/x/tools"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="!<dev-lang/go-1.8.0"


src_unpack() {
	local GOLANG_PKG_NAME="tools"
	golang-single_src_unpack
	local S="${WORKDIR}/gopath/src/golang.org/x"
	ls -lha ${S}/tools/gopls
	mv -v ${S}/tools/gopls ${S}/tools.new
	rm -vr ${S}/tools
	mv -v ${S}/tools.new ${S}/tools
}

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"honnef.co/go/go-tools" \
		"honnef.co/go/tools"

	golang_fix_importpath_alias \
		"mvdan.cc/xurls/xurls" \
		"mvdan.cc/xurls/v2"
}

src_compile() {
	golang-single_src_compile
}
