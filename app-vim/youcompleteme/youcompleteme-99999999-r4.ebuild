# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit eutils cmake git-r3 multilib python-single-r1 vim-plugin

# Store Current Eclipse JDT Langauge Server Version
# that will be compared with ycmd during src_prepare().
JDTLS_MILESTONE="0.54.0"
JDTLS_BUILD_STAMP="202004152304"

DESCRIPTION="vim plugin: a code-completion engine for Vim"
HOMEPAGE="http://valloric.github.io/YouCompleteMe/"
EGIT_REPO_URI="https://github.com/Valloric/YouCompleteMe.git"
# I know I could just do EGIT_SUBMODULES=(-* +third_party/ycmd ),
# but listing the submodules gives me an idea on what dependences are needed.
EGIT_SUBMODULES=(
	'*'
	'-third_party/ycmd/third_party/bottle'
	'-third_party/ycmd/third_party/jedi'
	'-third_party/ycmd/third_party/jedi_deps/numpydoc'
	'-third_party/ycmd/third_party/cregex'
	'-third_party/ycmd/third_party/parso'
	'-third_party/ycmd/third_party/python-future'
	'-third_party/ycmd/third_party/go/src/golang.org/x/tools'
	'-third_party/ycmd/third_party/certifi'
	'-third_party/ycmd/third_party/chardet'
	'-third_party/ycmd/third_party/idna'
	'-third_party/ycmd/third_party/requests'
	'-third_party/ycmd/third_party/urllib3'
	'-third_party/ycmd/third_party/waitress'
	'-third_party/ycmd/third_party/watchdog_deps/pathtools'
	'-third_party/ycmd/third_party/watchdog_deps/watchdog'
	'-third_party/ycmd/third_party/watchdog'
	'-third_party/requests_deps/certifi'
	'-third_party/requests_deps/chardet'
	'-third_party/requests_deps/idna'
	'-third_party/requests_deps/requests'
	'-third_party/requests_deps/urllib3'
	'-third_party/requests-futures'
)

LICENSE="
	GPL-3
	java? (
		EPL-2.0
	)
"
SLOT="0"
KEYWORDS=""
IUSE="clang doc rust go typescript mono java"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="test"

SRC_URI="
	java? (
		http://download.eclipse.org/jdtls/snapshots/jdt-language-server-${JDTLS_MILESTONE}-${JDTLS_BUILD_STAMP}.tar.gz
	)
"

COMMON_DEPEND="
	${PYTHON_DEPS}
	clang? ( >=sys-devel/clang-3.9:= )
	$(python_gen_cond_dep '
		dev-libs/boost[python,threads,${PYTHON_MULTI_USEDEP}]
		|| (
			app-editors/vim[python,${PYTHON_SINGLE_USEDEP}]
			app-editors/gvim[python,${PYTHON_SINGLE_USEDEP}]
		)
	')
"

RDEPEND="
	${COMMON_DEPEND}
	$(python_gen_cond_dep '
		dev-python/bottle[${PYTHON_MULTI_USEDEP}]
		dev-python/future[${PYTHON_MULTI_USEDEP}]
		dev-python/regex[${PYTHON_MULTI_USEDEP}]
		>=dev-python/jedi-0.17.0[${PYTHON_MULTI_USEDEP}]
		dev-python/parso[${PYTHON_MULTI_USEDEP}]
		dev-python/requests[${PYTHON_MULTI_USEDEP}]
		dev-python/sh[${PYTHON_MULTI_USEDEP}]
		dev-python/waitress[${PYTHON_MULTI_USEDEP}]
		dev-python/requests-futures[${PYTHON_MULTI_USEDEP}]
		dev-python/watchdog[${PYTHON_MULTI_USEDEP}]
	')
"

# Unfortunatly rust-bin doesn't have an 'rls' binary,
# so we have build rust with the 'rls' useflag.
DEPEND="
	${RDEPEND}
	rust? (
		dev-util/rust-analyzer
	)
	go? (
		dev-go/gopls
	)
	typescript? (
		dev-node/typescript
	)
	mono? (
		dev-dotnet/omnisharp-roslyn-http-bin
	)
	java? (
		>=virtual/jdk-1.8
	)
"

CMAKE_IN_SOURCE_BUILD=1
CMAKE_USE_DIR=${S}/third_party/ycmd/cpp

VIM_PLUGIN_HELPFILES="${PN}"

src_unpack() {
	git-r3_src_unpack
	if use java; then
		mkdir -p "${WORKDIR}/jdt-language-server"
		cd "${WORKDIR}/jdt-language-server"
		unpack "jdt-language-server-${JDTLS_MILESTONE}-${JDTLS_BUILD_STAMP}.tar.gz"
		local JDTLS_LOCATION="${S}/third_party/ycmd/third_party/eclipse.jdt.ls/target/repository"
		elog "Copying JDT files to YouCompleteMe."
		mkdir -p "${JDTLS_LOCATION}"
		cp -r "${WORKDIR}"/jdt-language-server/{config_linux,features,plugins} "${JDTLS_LOCATION}"
	fi
}

src_prepare() {
	default

	if use java; then
		# taken from vim-youcompleteme-git AUR package.
		elog "Checking Eclipse JDT Language Server version."
		local milestone_current=$(egrep '^JDTLS_MILESTONE' "${S}/third_party/ycmd/build.py" | sed -e "s/.* = //g" -e "s/'//g")
		local buildstamp_current=$(egrep '^JDTLS_BUILD_STAMP' "${S}/third_party/ycmd/build.py" | sed -e "s/.* = //g" -e "s/'//g")
		local outofdate=0

		# Check if JDTLS_MILESTONE, and JDTLS_BUILD_STAMP match up with ycmd's build.py
		if [ ${JDTLS_BUILD_STAMP} != ${buildstamp_current} ]; then
			eerror ""
			eerror "JDTLS_BUILD_STAMP is out of date."
			eerror "Please change JDTLS_BUILD_STAMP to '${buildstamp_current}' in the ebuild."
			eerror ""
			outofdate=1
		fi
		if [ ${JDTLS_MILESTONE} != ${milestone_current} ]; then
			eerror ""
			eerror "JDTLS_MILESTONE is out of date."
			eerror "Please change JDTLS_MILESTONE to '${milestone_current}' in the ebuild."
			eerror ""
			outofdate=2
		fi

		if [ $outofdate -eq 1 ]; then
			die "JDTLS_BUILD_STAMP doesn't match ycmd's 'build.py'."
		fi

		if [ $outofdate -eq 2 ]; then
			die "JDTLS_MILESTONE and JDTLS_BUILD_STAMP don't match with ycmd's 'build.py'."
		fi
	fi

	# sed -i '/^#! python3.7/d' third_party/ycmd/third_party/cregex/tools/build_regex_unicode.py

	# for third_party_module in pythonfutures; do
	# 	rm -r "${S}"/third_party/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	# done
	rm -r "${S}"/third_party/ycmd/cpp/BoostParts || die "Failed to remove bundled boost"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_CLANG_COMPLETER="$(usex clang ON OFF)"
		-DEXTERNAL_LIBCLANG_PATH="$(usex clang $(clang --print-file-name=libclang.so) '')"
		-DUSE_SYSTEM_BOOST=ON
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	# Apply patches that force YouCompleteMe to use system
	# versions of 'rls', and 'gopls'.
	if use rust ; then
		cd "${S}"/third_party/ycmd || die "Failed to move to ycmd directory"
		patch -p1 -i "${FILESDIR}"/rust.patch || die "Failed to apply rust.patch"
	fi

	if use go ; then
		cd "${S}"/third_party/ycmd || die "Failed to move to ycmd directory"
		patch -p1 -i "${FILESDIR}"/go.patch || die "Failed to apply go.patch"
	fi

	if use typescript; then
		cd "${S}"/third_party/ycmd || die "Failed to move to ycmd directory"
		patch -p1 -i "${FILESDIR}"/typescript.patch || die "Failed to apply typescript.patch"
	fi

	if use mono; then
		cd "${S}"/third_party/ycmd || die "Failed to move to ycmd directory"
		patch -p1 -i "${FILESDIR}"/omnisharp.patch || die "Failed to apply omnisharp.patch"
	fi
}

src_install() {
	use doc && dodoc *.md third_party/ycmd/*.md
	dodoc *.md third_party/ycmd/*.md
	rm -r *.md *.sh COPYING.txt third_party/ycmd/cpp || die
	rm -r third_party/ycmd/{*.md,*.sh} || die

	find python -name '*test*' -exec rm -rf {} + || die
	egit_clean
	use clang && (rm third_party/ycmd/third_party/clang/lib/libclang.so* || die)

	vim-plugin_src_install

	if use java; then
		# Force the java completion engine to create its workspace at /tmp instead which is writable
		# to everyone. (taken from AUR package.)
		dosym /tmp "/usr/share/vim/vimfiles/third_party/ycmd/third_party/eclipse.jdt.ls/workspace"
	fi

	python_optimize "${ED}"
	python_fix_shebang "${ED}"
}
