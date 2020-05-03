# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit pax-utils

DESCRIPTION="OmniSharp server (HTTP) based on Roslyn workspaces"
HOMEPAGE="https://github.com/OmniSharp/omnisharp-roslyn"
SRC_URI="https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${PV}/omnisharp.http-mono.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/mono
	dev-libs/libuv
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /opt/${PN}
	doins -r ./
	fperms +x /opt/${PN}/OmniSharp.exe

	pax-mark -m "${ED}"/opt/${PN}/OmniSharp.exe
}
