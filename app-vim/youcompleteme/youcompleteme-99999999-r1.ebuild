# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit eutils cmake-utils git-r3 multilib python-single-r1 vim-plugin

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
	'-third_party/python-future'
)

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="clang doc test rust go typescript"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

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
		dev-python/jedi[${PYTHON_MULTI_USEDEP}]
		dev-python/parso[${PYTHON_MULTI_USEDEP}]
		dev-python/requests[${PYTHON_MULTI_USEDEP}]
		dev-python/sh[${PYTHON_MULTI_USEDEP}]
		dev-python/waitress[${PYTHON_MULTI_USEDEP}]
		dev-python/requests-futures[${PYTHON_MULTI_USEDEP}]
		dev-python/watchdog[${PYTHON_MULTI_USEDEP}]
		virtual/python-futures[${PYTHON_MULTI_USEDEP}]
	')
"

# Unfortunatly rust-bin doesn't have an 'rls' binary,
# so we have build rust with the 'rls' useflag.
DEPEND="
	${RDEPEND}
	rust? (
		dev-lang/rust[rls]
	)
	go? (
		dev-go/gopls
	)
	typescript? (
		dev-node/typescript
	)
	test? (
		$(python_gen_cond_dep '
			>=dev-python/mock-1.0.1[${PYTHON_MULTI_USEDEP}]
			>=dev-python/nose-1.3.0[${PYTHON_MULTI_USEDEP}]
			dev-cpp/gmock
			dev-cpp/gtest
		')
	)
"

CMAKE_IN_SOURCE_BUILD=1
CMAKE_USE_DIR=${S}/third_party/ycmd/cpp

VIM_PLUGIN_HELPFILES="${PN}"

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	default

	if ! use test ; then
		sed -i '/^add_subdirectory( tests )/d' third_party/ycmd/cpp/ycm/CMakeLists.txt || die
	fi

	# sed -i '/^#! python3.7/d' third_party/ycmd/third_party/cregex/tools/build_regex_unicode.py

	# for third_party_module in pythonfutures; do
	# 	rm -r "${S}"/third_party/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	# done
	rm -r "${S}"/third_party/ycmd/cpp/BoostParts || die "Failed to remove bundled boost"
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_CLANG_COMPLETER="$(usex clang ON OFF)"
		-DEXTERNAL_LIBCLANG_PATH="$(usex clang $(clang --print-file-name=libclang.so) '')"
		-DUSE_SYSTEM_BOOST=ON
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile

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
}

src_test() {
	cd "${S}/third_party/ycmd/cpp/ycm/tests"
	LD_LIBRARY_PATH="${EROOT}"/usr/$(get_libdir)/llvm \
		./ycm_core_tests || die

	cd "${S}"/python/ycm

	local dirs=( "${S}"/third_party/*/ "${S}"/third_party/ycmd/third_party/*/ )
	local -x PYTHONPATH=${PYTHONPATH}:$(IFS=:; echo "${dirs[*]}")

	nosetests --verbose || die
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

	python_optimize "${ED}"
	python_fix_shebang "${ED}"
}
