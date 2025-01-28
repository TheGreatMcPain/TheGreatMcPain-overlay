EAPI=8

DESCRIPTION="Equibop is a fork of Vesktop."

HOMEPAGE="https://github.com/Equicord/Equibop"

SRC_URI="https://github.com/Equicord/Equibop/archive/refs/tags/v2.1.1.tar.gz"

S="${WORKDIR}"

LICENSE="GPL-3"

SLOT="0"

RESTRICT=network-sandbox

KEYWORDS="~amd64"

inherit desktop
src_unpack() {
	unpack v2.1.1.tar.gz
	cd "${S}/${P}"
}

src_configure() {
	npm i pnpm
	cd ${P}
	pnpm i
	pnpm package:dir
}

src_install() {
	dodir /opt/equibop
	cp -rp ${P}/* "${D}/opt/equibop"
	cd ${P}
	newicon static/icon.png equibop.png
	make_desktop_entry /opt/equibop/dist/linux-unpacked/equibop ${PN} equibop
	dosym "/opt/equibop/dist/linux-unpacked/equibop" "/usr/bin/equibop"
}
