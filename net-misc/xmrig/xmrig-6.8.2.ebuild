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
IUSE="cuda +daemon nvml donate libressl opencl ssl"
REQUIRED_USE="nvml? ( cuda )"

# Not sure if the cuda and nvml useflags for hwloc is needed.
DEPEND="
	dev-libs/libuv:=
	sys-apps/hwloc:=[cuda?,nvml?]
	ssl? (
		!libressl? ( dev-libs/openssl:= )
		libressl? ( dev-libs/libressl:= )
	)
	cuda? (
		net-misc/xmrig-cuda
	)"

PATCHES=("${FILESDIR}/${PN}-5.11.2-nonotls.patch")

src_prepare() {
	use donate || eapply "${FILESDIR}/${PN}-6.3.3-nodonate.patch"

	# https://github.com/xmrig/xmrig/commit/b665d2d865efc04998b21a6c54f9ad56622f4872
	# Broke armv7 compilation. (Will get a better fix soon)
	if [ "${ARCH}" = "arm" ]; then
		PATCHES+=("${FILESDIR}/revert-sse2neon.patch")
	fi

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
	# TODO: add openrc init and config.
	dobin "${BUILD_DIR}/xmrig"

	keepdir /var/log/xmrig
	fperms 0755 /var/log/xmrig

	keepdir /etc/xmrig
	fperms 0755 /etc/xmrig

	if use daemon; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/${PN}.logrotate" ${PN}

		newconfd "${FILESDIR}/xmrig.confd" xmrig
		newinitd "${FILESDIR}/xmrig.initd" xmrig
	fi
}

pkg_postinst() {
	einfo "Install sys-apps/msr-tools and load the msr kernel module so that"
	einfo "XMRig can perform CPU specific tweaks like disabling the instruction"
	einfo "prefetcher. Also remember to increase the vm.nr_hugepages sysctl"
	einfo "value so that XMRig can allocate with huge pages."
	einfo
	einfo "You can use 'https://xmrig.com/wizard' to create a configuration."

	if use daemon; then
		einfo
		einfo "For the openrc daemon to work you will need"
		einfo "to create a configuration and place it in: /etc/xmrig/config.json"
	fi

	if use cuda; then
		einfo
		einfo "You've enabled the CUDA backend."
		einfo
		einfo "To use it make sure your config has something like this..."
		einfo '   "cuda": {'
		einfo '       "enabled": true'
		einfo '   }'
	fi
}
