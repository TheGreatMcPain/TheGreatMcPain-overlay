EAPI=5

PYTHON_COMPAT=( python{2_{6,7},3_{4,5,6,7}} )

inherit eutils multilib python-single-r1 cmake-utils vim-plugin git-r3

EGIT_REPO_URI="https://github.com/Valloric/YouCompleteMe.git"
DESCRIPTION="vim plugin: a code-completion engine for Vim"
HOMEPAGE="https://valloric.github.io/YouCompleteMe/"

LICENSE="GPL-3"
IUSE="+clang test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

COMMON_DEPEND="
	${PYTHON_DEPS}
	clang? ( >=sys-devel/clang-3.3 )
	dev-libs/boost[python,threads,${PYTHON_USEDEP}]
	|| (
		app-editors/vim[python,${PYTHON_USEDEP}]
		app-editors/gvim[python,${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${COMMON_DEPEND}
	dev-python/bottle[${PYTHON_USEDEP}]
	virtual/python-futures[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/sh[${PYTHON_USEDEP}]
	dev-python/waitress[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/jedi[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/futures[${PYTHON_USEDEP}]' 'python2*')
"
DEPEND="
	${COMMON_DEPEND}
	test? (
		>=dev-python/mock-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/nose-1.3.0[${PYTHON_USEDEP}]
		dev-cpp/gmock
		>=dev-cpp/gtest-1.8.0
	)
"

CMAKE_IN_SOURCE_BUILD=1
CMAKE_USE_DIR=${S}/third_party/ycmd/cpp

VIM_PLUGIN_HELPFILES="${PN}"

src_prepare() {
	if ! use test ; then
		sed -i '/^add_subdirectory( tests )/d' third_party/ycmd/cpp/ycm/CMakeLists.txt || die
	fi

	sed -i '/^#! python3.7/d' third_party/ycmd/third_party/cregex/tools/build_regex_unicode.py

	# Argparse is included in python 2.7 / 3
	for third_party_module in pythonfutures; do
		rm -r "${S}"/third_party/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	done
	for third_party_module in bottle waitress; do
		rm -r "${S}"/third_party/ycmd/third_party/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	done
	for third_party_module in jedi parso numpydoc; do
		rm -r "${S}"/third_party/ycmd/third_party/jedi_deps/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	done
	for third_party_module in requests idna certifi chardet urllib3; do
		rm -r "${S}"/third_party/requests_deps/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
		rm -r "${S}"/third_party/ycmd/third_party/requests_deps/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	done
	rm -r "${S}"/third_party/ycmd/cpp/BoostParts || die "Failed to remove bundled boost"

	# Stupidity: boost::python is installed as is on Gentoo for both python2 & python3. YCM is stupidly trying to find a module called python3.
	sed -i 's/APPEND Boost_COMPONENTS python3/APPEND Boost_COMPONENTS python/g' "${S}"/third_party/ycmd/cpp/ycm/CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_use clang CLANG_COMPLETER)
		$(cmake-utils_use_use clang SYSTEM_LIBCLANG)
		-DUSE_SYSTEM_BOOST=ON
		-DUSE_SYSTEM_GMOCK=ON
	)
	if [ echo ${EPYTHON} | grep python2 > /dev/null ]
	then
		mycmakeargs+=( -DUSE_PYTHON2=ON )
	else
		mycmakeargs+=( -DUSE_PYTHON2=OFF )
	fi
	cmake-utils_src_configure
}

src_test() {
	cd "${S}/third_party/ycmd/cpp/ycm/tests" || die
	LD_LIBRARY_PATH="${EROOT}"/usr/$(get_libdir)/llvm \
		./ycm_core_tests || die

	cd "${S}"/python/ycm || die

	local dirs=( "${S}"/third_party/*/ "${S}"/third_party/ycmd/third_party/*/ )
	local -x PYTHONPATH=${PYTHONPATH}:$(IFS=:; echo "${dirs[*]}")

	nosetests --verbose || die
}

src_install() {
	dodoc *.md third_party/ycmd/*.md
	rm -r *.md *.sh COPYING.txt third_party/ycmd/cpp || die
	rm -r third_party/ycmd/{*.md,*.sh,examples} || die
	find python third_party -name '*test*' -exec rm -rf {} + || die
	find python third_party -name '*doc*' -exec rm -rf {} + || die
	egit_clean
	rm third_party/ycmd/third_party/clang/lib/libclang.so* || die

	vim-plugin_src_install

	python_optimize "${ED}"
	python_fix_shebang "${ED}"
}
