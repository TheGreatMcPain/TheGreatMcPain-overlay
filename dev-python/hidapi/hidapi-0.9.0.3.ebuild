# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PV=$(ver_cut 1-3).post$(ver_cut 4)

DESCRIPTION="Reactive Extensions for Python"
HOMEPAGE="http://reactivex.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${MY_PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	virtual/libusb
	virtual/libudev"

S="${WORKDIR}"/"${PN}-${MY_PV}"
