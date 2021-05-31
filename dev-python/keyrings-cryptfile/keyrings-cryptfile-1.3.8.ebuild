# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

DESCRIPTION="Encrypted plain file keyring backend for the python keyring package"
HOMEPAGE="https://github.com/frispete/keyrings.cryptfile"
SRC_URI="
	https://github.com/frispete/keyrings.cryptfile/archive/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/argon2-cffi
	dev-python/keyring
	dev-python/pycryptodome
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/keyrings.cryptfile-${PV}"
