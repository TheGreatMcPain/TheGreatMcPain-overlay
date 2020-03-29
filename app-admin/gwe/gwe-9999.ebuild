# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )

inherit meson python-single-r1 xdg-utils gnome2-utils

DESCRIPTION="System utility designed to provide information, control the fans and overclock your NVIDIA card"
HOMEPAGE="https://gitlab.com/leinardi/gwe"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://gitlab.com/leinardi/gwe.git"
	EGIT_SUBMODULES=('-*')
	EGIT_BRANCH="master"
	inherit git-r3
	SRC_URI=""
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	dev-libs/appstream-glib
	dev-libs/gobject-introspection
	dev-libs/libappindicator:3
	dev-libs/libdazzle

	$(python_gen_cond_dep '
		dev-python/injector[${PYTHON_MULTI_USEDEP}]
		dev-python/matplotlib[${PYTHON_MULTI_USEDEP}]
		>=dev-python/peewee-3.13.1[${PYTHON_MULTI_USEDEP}]
		dev-python/py3nvml[${PYTHON_MULTI_USEDEP}]
		dev-python/pygobject:3[${PYTHON_MULTI_USEDEP}]
		>=dev-python/python-xlib-0.26[${PYTHON_MULTI_USEDEP}]
		dev-python/pyxdg[${PYTHON_MULTI_USEDEP}]
		dev-python/requests[${PYTHON_MULTI_USEDEP}]
		dev-python/Rx[${PYTHON_MULTI_USEDEP}]
	')
"

DEPEND="${RDEPEND}"

src_prepare() {
	# Prevent meson from running install script.
	sed meson.build \
		-e "s|meson.add_install_script('scripts/meson_post_install.py')||g" \
		-i || die
	default
}

src_configure() {
	meson_src_configure
}

src_install() {
	meson_src_install
	python_optimize
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	gnome2_schemas_update
}
