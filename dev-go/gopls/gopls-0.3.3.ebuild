# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_PN="github.com/golang/tools"

EGO_SUM=(
	"honnef.co/go/tools v0.0.1-2020.1.3"
	"honnef.co/go/tools v0.0.1-2020.1.3/go.mod"
	"gopkg.in/errgo.v2 v2.1.0"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/kisielk/gotool v1.0.0"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/google/renameio v0.1.0"
	"github.com/google/renameio v0.1.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"mvdan.cc/xurls/v2 v2.1.0"
	"mvdan.cc/xurls/v2 v2.1.0/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"github.com/BurntSushi/toml v0.3.1"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/stretchr/testify v1.4.0"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"gopkg.in/yaml.v2 v2.2.2"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1"
	"github.com/kr/pty v1.1.1/go.mod"
)

go-module_set_globals

SRC_URI="https://github.com/golang/tools/archive/gopls/v${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}"

DESCRIPTION="'gopls' is the official language server for the Go language."

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
BDEPEND=">dev-lang/go-1.8.0"

S=${WORKDIR}/tools-gopls-v${PV}/gopls

src_prepare() {
	default
}

src_compile() {
	go build || die "build failed"
}

src_install() {
	dodoc README.md
	dodoc doc/*.md
	dobin gopls
}
