# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

# MY_PV=$(ver_cut 1-3).post$(ver_cut 4)

DESCRIPTION="Python wrapper for the HIDAPI"
HOMEPAGE="https://github.com/trezor/cython-hidapi"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	virtual/libusb
	virtual/libudev"

S="${WORKDIR}"/"${P}"
