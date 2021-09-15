# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_SUM=(
	"github.com/ProtonMail/go-crypto v0.0.0-20210707164159-52430bf6b52c"
	"github.com/ProtonMail/go-crypto v0.0.0-20210707164159-52430bf6b52c/go.mod"
	"github.com/boltdb/bolt v1.3.1"
	"github.com/boltdb/bolt v1.3.1/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/emersion/go-bcrypt v0.0.0-20170822072041-6e724a1baa63"
	"github.com/emersion/go-bcrypt v0.0.0-20170822072041-6e724a1baa63/go.mod"
	"github.com/emersion/go-ical v0.0.0-20200224201310-cd514449c39e/go.mod"
	"github.com/emersion/go-imap v1.1.0"
	"github.com/emersion/go-imap v1.1.0/go.mod"
	"github.com/emersion/go-imap-move v0.0.0-20190710073258-6e5a51a5b342"
	"github.com/emersion/go-imap-move v0.0.0-20190710073258-6e5a51a5b342/go.mod"
	"github.com/emersion/go-imap-specialuse v0.0.0-20201101201809-1ab93d3d150e"
	"github.com/emersion/go-imap-specialuse v0.0.0-20201101201809-1ab93d3d150e/go.mod"
	"github.com/emersion/go-mbox v1.0.2"
	"github.com/emersion/go-mbox v1.0.2/go.mod"
	"github.com/emersion/go-message v0.14.1/go.mod"
	"github.com/emersion/go-message v0.15.0"
	"github.com/emersion/go-message v0.15.0/go.mod"
	"github.com/emersion/go-sasl v0.0.0-20200509203442-7bfe0ed36a21"
	"github.com/emersion/go-sasl v0.0.0-20200509203442-7bfe0ed36a21/go.mod"
	"github.com/emersion/go-smtp v0.15.0"
	"github.com/emersion/go-smtp v0.15.0/go.mod"
	"github.com/emersion/go-textwrapper v0.0.0-20200911093747-65d896831594"
	"github.com/emersion/go-textwrapper v0.0.0-20200911093747-65d896831594/go.mod"
	"github.com/emersion/go-vcard v0.0.0-20191221110513-5f81fa0d3cc7/go.mod"
	"github.com/emersion/go-vcard v0.0.0-20210521075357-3445b9171995"
	"github.com/emersion/go-vcard v0.0.0-20210521075357-3445b9171995/go.mod"
	"github.com/emersion/go-webdav v0.3.0"
	"github.com/emersion/go-webdav v0.3.0/go.mod"
	"github.com/howeyc/gopass v0.0.0-20190910152052-7cb4b85ec19c"
	"github.com/howeyc/gopass v0.0.0-20190910152052-7cb4b85ec19c/go.mod"
	"github.com/martinlindhe/base36 v1.1.0/go.mod"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"golang.org/x/crypto v0.0.0-20210322153248-0c34fe9e7dc2/go.mod"
	"golang.org/x/crypto v0.0.0-20210711020723-a769d52b0f97"
	"golang.org/x/crypto v0.0.0-20210711020723-a769d52b0f97/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b"
	"golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.5-0.20201125200606-c27b9fd57aec/go.mod"
	"golang.org/x/text v0.3.6"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	)
go-module_set_globals

DESCRIPTION="A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
HOMEPAGE="https://github.com/emersion/hydroxide"
SRC_URI="https://github.com/emersion/hydroxide/archive/v${PV}.tar.gz -> ${P}.tar.gz
		 ${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${PV}"

src_compile() {
	GO111MODULE=on go build ./cmd/hydroxide || die "build failed"
}

src_install() {
	dobin hydroxide
	dodoc README.md
}
