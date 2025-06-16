# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="sampling disk usage profiler for btrfs (binary)"
HOMEPAGE="https://github.com/CyberShadow/btdu"
SRC_URI="
amd64? ( https://github.com/CyberShadow/btdu/releases/download/v${PV}/btdu-static-x86_64 -> ${P}.amd64.bin )
arm64? ( https://github.com/CyberShadow/btdu/releases/download/v${PV}/btdu-glibc-aarch64 -> ${P}.aarch64.bin )
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

src_unpack() {
	mkdir "${S}"
	cp "${DISTDIR}/${A}" "${S}/${PN/-bin/}"
}

src_install() {
	dobin "${PN/-bin/}"
}
