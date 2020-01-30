# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/MaskRay/${PN}"
fi

inherit cmake-utils ${SCM}

DESCRIPTION="C/C++/ObjC language server"
HOMEPAGE="https://github.com/MaskRay/ccls"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/MaskRay/ccls/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="
	>=sys-devel/clang-5.0:=
	>=sys-devel/llvm-7.0:=
	dev-libs/rapidjson
	sys-libs/ncurses
"
RDEPEND="${DEPEND}"
BDEPEND=""
