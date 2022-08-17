# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MULTILIB_COMPAT=( abi_x86_{32,64} )
inherit flag-o-matic meson-multilib

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jp7677/dxvk-nvapi.git"
else
	#SRC_URI="https://github.com/jp7677/dxvk-nvapi/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jp7677/dxvk-nvapi.git"
	EGIT_COMMIT="v${PV}"
	KEYWORDS="-* ~amd64 ~x86"
fi

DESCRIPTION="Alternative NVAPI implementation on top of DXVK"
HOMEPAGE="https://github.com/jp7677/dxvk-nvapi"

LICENSE="MIT"
SLOT="0"
IUSE="+abi_x86_32 crossdev-mingw debug"

BDEPEND="
	dev-util/glslang
	!crossdev-mingw? ( dev-util/mingw64-toolchain[${MULTILIB_USEDEP}] )"

pkg_pretend() {
	[[ ${MERGE_TYPE} == binary ]] && return

	if use crossdev-mingw && [[ ! -v MINGW_BYPASS ]]; then
		local tool=-w64-mingw32-g++
		for tool in $(usev abi_x86_64 x86_64${tool}) $(usev abi_x86_32 i686${tool}); do
			if ! type -P ${tool} >/dev/null; then
				eerror "With USE=crossdev-mingw, it is necessary to setup the mingw toolchain."
				eerror "For instructions, please see: https://wiki.gentoo.org/wiki/Mingw"
				use abi_x86_32 && use abi_x86_64 &&
					eerror "Also, with USE=abi_x86_32, will need both i686 and x86_64 toolchains."
				die "USE=crossdev-mingw is set but ${tool} was not found"
			elif [[ ! $(LC_ALL=C ${tool} -v 2>&1) =~ "Thread model: posix" ]]; then
				eerror "${PN} requires GCC to be built with --enable-threads=posix"
				eerror "Please see: https://wiki.gentoo.org/wiki/Mingw#POSIX_threads_for_Windows"
				die "USE=crossdev-mingw is set but ${tool} does not use POSIX threads"
			fi
		done
	fi
}

src_configure() {
	use crossdev-mingw || PATH=${BROOT}/usr/lib/mingw64-toolchain/bin:${PATH}

	# AVX has a history of causing issues with this package, disable for safety
	# https://github.com/Tk-Glitch/PKGBUILDS/issues/515
	append-flags -mno-avx

	if [[ ${CHOST} != *-mingw* ]]; then
		[[ ! -v MINGW_BYPASS ]] && unset AR CC CXX RC STRIP

		CHOST_amd64=x86_64-w64-mingw32
		CHOST_x86=i686-w64-mingw32
		CHOST=$(usex x86 ${CHOST_x86} ${CHOST_amd64})

		strip-unsupported-flags
	fi

	multilib-minimal_src_configure
}

multilib_src_configure() {
	# multilib's ${CHOST_amd64}-gcc -m32 is unusable with crossdev,
	# unset again so meson eclass will set ${CHOST}-gcc + others
	use crossdev-mingw && [[ ! -v MINGW_BYPASS ]] && unset AR CC CXX RC STRIP

	local emesonargs=(
		--prefix="${EPREFIX}"/usr/lib/${PN}
		--{bin,lib}dir=x${MULTILIB_ABI_FLAG: -2}
		$(usev !debug --strip) # portage won't strip .dll, so allow it here
		-Denable_tests=false # needs wine/vulkan and is intended for manual use
	)

	meson_src_configure
}

multilib_src_install_all() {
	dodoc README.md

	find "${ED}" -type f -name '*.a' -delete || die
}

pkg_postinst() {
	elog "For usage and installation instructions."
	elog "See: ${EROOT}/usr/share/doc/${PF}/README.md"
	elog
	elog "The ${PN} '.dll's are located in ${EROOT}/usr/lib/${PN}"
}
