# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="RandomX, CryptoNight, KawPow, AstroBWT, and Argon2 CPU/GPU miner"
HOMEPAGE="https://xmrig.com https://github.com/xmrig/xmrig"
SRC_URI="https://github.com/xmrig/xmrig/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda nvml donate libressl opencl ssl"

DEPEND="
	dev-libs/libuv:=
	sys-apps/hwloc:=
	ssl? (
		!libressl? ( dev-libs/openssl:= )
		libressl? ( dev-libs/libressl:= )
	)"

PATCHES=("${FILESDIR}/${PN}-5.11.2-nonotls.patch")

src_prepare() {
	use donate || eapply "${FILESDIR}/${PN}-6.3.3-nodonate.patch"

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		# TODO: Create expanded USE flag for all of the PoW algos.

		-DWITH_TLS=$(usex ssl)

		-DWITH_OPENCL=$(usex opencl)

		-DWITH_CUDA=$(usex cuda)

		-DWITH_NVML=$(usex nvml)
	)

	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}/xmrig"
}

pkg_postinst() {
	einfo "Install sys-apps/msr-tools and load the msr kernel module so that"
	einfo "XMRig can perform CPU specific tweaks like disabling the instruction"
	einfo "prefetcher. Also remember to increase the vm.nr_hugepages sysctl"
	einfo "value so that XMRig can allocate with huge pages."
}
