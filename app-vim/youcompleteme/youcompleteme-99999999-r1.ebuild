# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

#PYTHON_COMPAT=( python2_7 )
PYTHON_COMPAT=( python3_{6,7} )

inherit eutils cmake-utils git-r3 multilib python-single-r1 vim-plugin

DESCRIPTION="vim plugin: a code-completion engine for Vim"
HOMEPAGE="http://valloric.github.io/YouCompleteMe/"
EGIT_REPO_URI="https://github.com/Valloric/YouCompleteMe.git"
EGIT_SUBMODULES=(
	'*'
	'-third_party/OmniSharpServer'
	'-third_party/argparse'
	'-third_party/bottle'
	'-third_party/waitress'
	'-third_party/gocode'
	'-third_party/godef'
	'-third_party/jedi'
	'-third_party/parso'
	'-third_party/python-future'
	'-third_party/requests'
)

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="clang doc test rust go"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

COMMON_DEPEND="
	${PYTHON_DEPS}
	clang? ( >=sys-devel/clang-3.9:= )
	dev-libs/boost[python,threads,${PYTHON_USEDEP}]
	|| (
		app-editors/vim[python,${PYTHON_USEDEP}]
		app-editors/gvim[python,${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${COMMON_DEPEND}
	dev-python/bottle[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/jedi[${PYTHON_USEDEP}]
	dev-python/parso[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/sh[${PYTHON_USEDEP}]
	dev-python/waitress[${PYTHON_USEDEP}]
	virtual/python-futures[${PYTHON_USEDEP}]
"
DEPEND="
	${COMMON_DEPEND}
	rust? (
		|| ( dev-lang/rust[rls] dev-lang/rust-bin )
	)
	go? (
		dev-go/gopls
	)
	test? (
		>=dev-python/mock-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/nose-1.3.0[${PYTHON_USEDEP}]
		dev-cpp/gtest
	)
"

CMAKE_IN_SOURCE_BUILD=1
CMAKE_USE_DIR=${S}/third_party/ycmd/cpp

VIM_PLUGIN_HELPFILES="${PN}"

src_unpack() {
	use rust || EGIT_SUBMODULES+=('-third_party/racerd')
	git-r3_src_unpack
}

src_prepare() {
	default

	if ! use test ; then
		sed -i '/^add_subdirectory( tests )/d' third_party/ycmd/cpp/ycm/CMakeLists.txt || die
	fi

	sed -i '/^#! python3.7/d' third_party/ycmd/third_party/cregex/tools/build_regex_unicode.py

	for third_party_module in pythonfutures; do
		rm -r "${S}"/third_party/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	done
	rm -r "${S}"/third_party/ycmd/cpp/BoostParts || die "Failed to remove bundled boost"
}

src_configure() {
	local mycmakeargs=(
		-DUSE_CLANG_COMPLETER="$(usex clang ON OFF)"
		-DEXTERNAL_LIBCLANG_PATH="$(usex clang $(clang --print-file-name=libclang.so) '')"
		-DUSE_SYSTEM_BOOST=ON
		-DUSE_PYTHON2=OFF
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile

	if use rust ; then
		cd "${S}"/third_party/ycmd || die "Failed to move to ycmd directory"
		patch -p1 -i "${FILESDIR}"/rust.patch || die "Failed to apply rust.patch"
	fi

	if use go ; then
		cd "${S}"/third_party/ycmd || die "Failed to move to ycmd directory"
		patch -p1 -i "${FILESDIR}"/go.patch || die "Failed to apply go.patch"
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
	#find python -name *test* -exec rm -rf {} + || die
	egit_clean

	cp -v .ycm_extra_conf.py /usr/share/vim/vimfiles/

	vim-plugin_src_install

	python_optimize "${ED}"
	python_fix_shebang "${ED}"
}
