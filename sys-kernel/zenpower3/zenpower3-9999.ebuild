# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
_PN=zenpower

inherit linux-mod-r1
DESCRIPTION="Linux kernel driver for reading sensors of AMD Zen family CPUs"
HOMEPAGE="
	https://github.com/koweda/zenpower3
	https://github.com/ocerman/zenpower
	https://github.com/AliEmreSenel/zenpower3
"

inherit git-r3
# Mantain fork of zenpower3
EGIT_REPO_URI="https://github.com/AliEmreSenel/zenpower3.git"

LICENSE="GPL-2"
SLOT="0"

CONFIG_CHECK="HWMON PCI AMD_NB"

src_compile() {
	MODULES_MAKEARGS+=(
		TARGET="${KV_FULL}"
	)
	local modlist=(
		${_PN}=kernel/drivers/hwmon:::all
	)
	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install
	dodoc README.md
}
