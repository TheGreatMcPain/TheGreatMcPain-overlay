# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake

DESCRIPTION="An argon2id miner. Supports TurtleCoin and WrkzCoin, among others."
HOMEPAGE="https://github.com/turtlecoin/violetminer"

if ver_test -eq "9999"; then
	EGIT_REPO_URI="https://github.com/turtlecoin/violetminer.git"
	KEYWORDS=""
else
	EGIT_COMMIT="v${PV}"
	EGIT_REPO_URI="https://github.com/turtlecoin/violetminer.git"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="cuda ssl"

DEPEND="
	cuda? (
		dev-util/nvidia-cuda-toolkit:=
	)
	ssl? (
		dev-libs/openssl:=
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	# Disable shared libs
	local mycmakeargs=(
		-DENABLE_SSL=$(usex ssl)
		-DENABLE_NVIDIA=$(usex cuda)
		-DBUILD_SHARED_LIBS=OFF
	)

	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}/violetminer"
}
