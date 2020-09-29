# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
GNOME_ORG_MODULE="NetworkManager"
GNOME2_LA_PUNT="yes"
VALA_USE_DEPEND="vapigen"
PYTHON_COMPAT=( python{3_6,3_7} )

inherit bash-completion-r1 gnome2 multilib python-any-r1 readme.gentoo-r1 vala udev multilib-minimal

DESCRIPTION="NetworkManager client library (legacy)"
HOMEPAGE="https://wiki.gnome.org/Projects/NetworkManager"

LICENSE="GPL-2+"
SLOT="0" # add subslot if libnm-util.so.2 or libnm-glib.so.4 bumps soname version

IUSE="elogind gnutls +introspection +nss systemd test vala"
RESTRICT="!test? ( test )"

REQUIRED_USE="
	vala? ( introspection )
	|| ( nss gnutls )
	?? ( systemd elogind )
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
	dev-util/gdbus-codegen
	dev-util/glib-utils
	dev-util/gtk-doc-am
	>=dev-util/intltool-0.40
	>=sys-devel/gettext-0.17
	>=sys-kernel/linux-headers-3.18
	virtual/pkgconfig
	introspection? (
		$(python_gen_any_dep 'dev-python/pygobject:3[${PYTHON_USEDEP}]')
		dev-lang/perl
		dev-libs/libxslt
	)
	vala? ( $(vala_depend) )
	test? (
		$(python_gen_any_dep '
			dev-python/dbus-python[${PYTHON_USEDEP}]
			dev-python/pygobject:3[${PYTHON_USEDEP}]')
	)
"

PATCHES=(
	"${FILESDIR}"/${PN}-data-fix-the-ID_NET_DRIVER-udev-rule.patch
	"${FILESDIR}"/1.18.4-iwd1-compat.patch # included in 1.21.3+
)

python_check_deps() {
	if use introspection; then
		has_version "dev-python/pygobject:3[${PYTHON_USEDEP}]" || return
	fi
	if use test; then
		has_version "dev-python/dbus-python[${PYTHON_USEDEP}]" &&
		has_version "dev-python/pygobject:3[${PYTHON_USEDEP}]"
	fi
}

pkg_setup() {
	if use introspection || use test; then
		python-any-r1_pkg_setup
	fi
}

src_prepare() {
	DOC_CONTENTS="To modify system network connections without needing to enter the
		root password, add your user account to the 'plugdev' group."

	use vala && vala_src_prepare
	gnome2_src_prepare
}

multilib_src_configure() {
	local myconf=(
		--disable-more-warnings
		--disable-static
		--localstatedir=/var
		--disable-lto
		--disable-config-plugin-ibft
		--disable-qt
		--without-netconfig
		--with-dbus-sys-dir=/etc/dbus-1/system.d
		# We need --with-libnm-glib (and dbus-glib dep) as reverse deps are
		# still not ready for removing that lib, bug #665338
		--with-libnm-glib
		--without-nmcli
		--with-udev-dir="$(get_udevdir)"
		--with-config-plugins-default=keyfile
		--with-iptables=/sbin/iptables
		--with-ebpf=yes
		--disable-concheck
		--with-crypto=$(usex nss nss gnutls)
		--with-session-tracking=$(multilib_native_usex systemd systemd $(multilib_native_usex elogind elogind no))
		# There is no off switch, use elogind be default.
		--with-suspend-resume=$(multilib_native_usex systemd systemd $(multilib_native_usex elogind elogind consolekit))
		--without-libaudit
		--disable-bluez5-dun
		--without-dhclient
		--without-dhcpcd
		$(multilib_native_use_enable introspection)
		--disable-json-validation
		--disable-ppp
		--without-libpsl
		--without-modem-manager-1
		--without-nmtui
		--without-ofono
		--disable-ovs
		--disable-polkit
		--disable-polkit-agent
		--without-resolvconf
		--without-selinux
		--without-systemd-journal
		--disable-teamdctl
		$(multilib_native_use_enable test tests)
		$(multilib_native_use_enable vala)
		--without-valgrind
		--without-iwd
		--without-wext
		--disable-wifi
	)

	if multilib_is_native_abi; then
		# work-around man out-of-source brokenness, must be done before configure
		ln -s "${S}/docs" docs || die
		ln -s "${S}/man" man || die
	fi

	ECONF_SOURCE=${S} runstatedir="/run" gnome2_src_configure "${myconf[@]}"
}

multilib_src_compile() {
	if multilib_is_native_abi; then
		emake
	else
		local targets=(
			libnm/libnm.la
			libnm-util/libnm-util.la
			libnm-glib/libnm-glib.la
			libnm-glib/libnm-glib-vpn.la
		)
		emake "${targets[@]}"
	fi
}

multilib_src_test() {
	if use test && multilib_is_native_abi; then
		python_setup
		virtx emake check
	fi
}

multilib_src_install() {
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

	local targets=(
		install-libLTLIBRARIES
		install-libnm_glib_libnmvpnHEADERS
		install-libnm_glib_libnmincludeHEADERS
		install-libnm_util_libnm_util_includeHEADERS
		install-nodist_libnm_glib_libnmincludeHEADERS
		install-nodist_libnm_glib_libnmvpnHEADERS
		install-nodist_libnm_util_libnm_util_includeHEADERS
		install-pkgconfigDATA
	)
	emake DESTDIR="${D}" "${targets[@]}"

	# Delete libnm.* library files, and pkgconfig.
	rm "${ED%/}"/usr/$(get_libdir)/libnm.*
	rm "${ED%/}"/usr/$(get_libdir)/pkgconfig/libnm.pc
}
