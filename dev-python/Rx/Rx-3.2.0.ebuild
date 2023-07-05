# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Reactive Extensions for Python"
HOMEPAGE="http://reactivex.io/"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}")"
S=${WORKDIR}/${P^}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
