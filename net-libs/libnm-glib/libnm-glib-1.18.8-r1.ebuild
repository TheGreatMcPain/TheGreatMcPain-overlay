# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
GNOME_ORG_MODULE="NetworkManager"
GNOME2_LA_PUNT="yes"
VALA_USE_DEPEND="vapigen"
PYTHON_COMPAT=( python3_{6,7,8} )

inherit gnome2 meson multilib python-any-r1 vala udev multilib-minimal

DESCRIPTION="NetworkManager client library (legacy)"
HOMEPAGE="https://wiki.gnome.org/Projects/NetworkManager"

LICENSE="GPL-2+"
SLOT="0" # add subslot if libnm-util.so.2 or libnm-glib.so.4 bumps soname version

IUSE="elogind gnutls +introspection +minimal +nss systemd vala"
RESTRICT="test"

REQUIRED_USE="
	vala? ( introspection )
	|| ( nss gnutls )
	?? ( systemd elogind )
	minimal? ( !vala )
"

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"

# gobject-introspection-0.10.3 is needed due to gnome bug 642300
# wpa_supplicant-0.7.3-r3 is needed due to bug 359271
COMMON_DEPEND="
	>=sys-apps/dbus-1.2[${MULTILIB_USEDEP}]
	>=dev-libs/dbus-glib-0.100[${MULTILIB_USEDEP}]
	>=dev-libs/glib-2.40:2[${MULTILIB_USEDEP}]
	net-libs/libndp[${MULTILIB_USEDEP}]
	sys-apps/util-linux[${MULTILIB_USEDEP}]
	>=virtual/libudev-175:=[${MULTILIB_USEDEP}]
	elogind? ( >=sys-auth/elogind-219 )
	introspection? ( >=dev-libs/gobject-introspection-0.10.3:= )
	nss? ( >=dev-libs/nss-3.11:=[${MULTILIB_USEDEP}] )
	!nss? ( gnutls? (
		dev-libs/libgcrypt:0=[${MULTILIB_USEDEP}]
		>=net-libs/gnutls-2.12:=[${MULTILIB_USEDEP}] ) )
	systemd? ( >=sys-apps/systemd-209:0= )
"

RDEPEND="${COMMON_DEPEND}
	!<=net-misc/networkmanager-1.18.6
"

DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.40
	virtual/pkgconfig
	introspection? (
		$(python_gen_any_dep 'dev-python/pygobject:3[${PYTHON_USEDEP}]')
		dev-lang/perl
		dev-libs/libxslt
	)
	vala? ( $(vala_depend) )
"

PATCHES=(
	"${FILESDIR}"/${PN}-data-fix-the-ID_NET_DRIVER-udev-rule.patch
	"${FILESDIR}"/1.18.4-iwd1-compat.patch # included in 1.21.3+
)

python_check_deps() {
	if use introspection; then
		has_version "dev-python/pygobject:3[${PYTHON_USEDEP}]" || return
	fi
}

pkg_setup() {
	if use introspection; then
		python-any-r1_pkg_setup
	fi
}

src_prepare() {
	use vala && vala_src_prepare
	gnome2_src_prepare
}

multilib_src_configure() {
	local emesonargs=(
		-Dmore_asserts="no"
		-Dmore_logging=false
		-Dqt=false
		-Dnetconfig="no"
		-Ddbus_conf_dir="/etc/dbus-1/system.d"
		# We need --with-libnm-glib (and dbus-glib dep) as reverse deps are
		# still not ready for removing that lib, bug #665338
		-Dlibnm_glib=true
		-Dnmcli=false
		-Dudev_dir="$(get_udevdir)"
		-Dconfig_plugins_default="keyfile"
		-Diptables="/sbin/iptables"
		-Debpf="true"
		-Dconcheck=false
		-Dcrypto="$(usex nss nss gnutls)"
		-Dsession_tracking_consolekit=false
		-Dsession_tracking="$(multilib_native_usex systemd systemd $(multilib_native_usex elogind elogind no))"
		# There is no off switch, use elogind be default.
		-Dsuspend_resume="$(multilib_native_usex systemd systemd $(multilib_native_usex elogind elogind consolekit))"
		-Dlibaudit="no"
		-Dbluez5_dun=false
		-Ddhclient="no"
		-Ddhcpcd="no"
		-Dintrospection=$(multilib_native_usex introspection true false)
		-Djson_validation=false
		-Dppp=false
		-Dlibpsl=false
		-Dmodem_manager=false
		-Dnmtui=false
		-Dofono=false
		-Dovs=false
		-Dpolkit=false
		-Dpolkit_agent=false
		-Dresolveconf="no"
		-Dselinux=false
		-Dsystemd_journal=false
		-Dteamdctl=false
		-Dtests="no"
		-Dvapi="$(multilib_native_usex vala true false)"
		-Dvalgrind="no"
		-Diwd=false
		-Dwext=false
		-Dwifi=false
	)

	if use systemd; then
		emesonargs+=( -Dsystemdsystemunitdir="$(systemd_get_systemunitdir)" )
	else
		emesonargs+=( -Dsystemdsystemunitdir="no" )
	fi

	if multilib_is_native_abi; then
		# work-around man out-of-source brokenness, must be done before configure
		ln -s "${S}/docs" docs || die
		ln -s "${S}/man" man || die
	fi

	meson_src_configure
}

multilib_src_compile() {
	# Main library targets
	local targets=(
		libnm-util/libnm-util.so.2.7.0
		libnm-glib/libnm-glib.so.4.9.0
		libnm-glib/libnm-glib-vpn.so.1.2.0
	)

	# Extra bits
	if ! use minimal; then
		if multilib_is_native_abi; then
			targets+=(
				libnm-util/NetworkManager-1.0.gir
				libnm-util/NetworkManager-1.0.typelib
				libnm-glib/NMClient-1.0.gir
				libnm-glib/NMClient-1.0.typelib
			)

			if use vala; then
				targets+=(
					vapi/libnm-glib.vapi
					vapi/libnm-util.vapi
				)
			fi
		fi
	fi

	meson_src_compile "${targets[@]}"
}

# Since meson_src_install will try to compile everything
# lets just manually install the files.
multilib_src_install() {
	# Install extra bits.
	if ! use minimal; then
		if multilib_is_native_abi; then
			dodir "/usr/$(get_libdir)/girepository-1.0"
			insinto "/usr/$(get_libdir)/girepository-1.0"
			doins libnm-util/NetworkManager-*.typelib
			doins libnm-glib/NMClient-*.typelib

			dodir "/usr/share/gir-1.0"
			insinto "/usr/share/gir-1.0"
			doins libnm-util/NetworkManager-*.gir
			doins libnm-glib/NMClient-*.gir

			if use vala; then
				dodir "/usr/share/vala/vapi"
				insinto "/usr/share/vala/vapi"
				doins vapi/libnm-*
			fi
		fi

		# Install headers
		dodir "/usr/include/libnm-glib"
		insinto "/usr/include/libnm-glib"
		doins libnm-glib/nm-glib-enum-types.h
		doins "${S}"/libnm-glib/*.h

		dodir "/usr/include/NetworkManager"
		insinto "/usr/include/NetworkManager"
		doins libnm-util/nm-utils-enum-types.h
		doins "${S}"/libnm-util/*.h

		# Install pkgconfig files
		dodir "/usr/$(get_libdir)/pkgconfig"
		insinto "/usr/$(get_libdir)/pkgconfig"
		doins meson-private/NetworkManager*.pc
		doins meson-private/libnm-*.pc
	fi

	# Remove this, or dolib won't be happy.
	rm -rf libnm-glib/libnm-*.p
	rm -rf libnm-util/libnm-*.p

	# Install libraries
	dolib libnm-glib/libnm-*.so*
	dolib libnm-util/libnm-*.so*
}
