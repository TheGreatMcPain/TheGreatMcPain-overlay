# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pkkid/python-plexapi.git"
	KEYWORDS=""
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="${PV}"
	SRC_URI="https://github.com/pkkid/python-plexapi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	S=${WORKDIR}/python-${P}
fi

DESCRIPTION="Python bindings for the Plex API."
HOMEPAGE="https://github.com/pkkid/python-plexapi"

LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
"

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
"
