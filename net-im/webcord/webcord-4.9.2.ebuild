# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils

NODE_MODULES_SRC_URI="
	https://registry.npmjs.org/@spacingbat3/disconnection/-/disconnection-1.3.2.tgz -> webcord-dep--disconnection-1.3.2.tgz
	https://registry.npmjs.org/@spacingbat3/kolor/-/kolor-4.0.0.tgz -> webcord-dep--kolor-4.0.0.tgz
	https://registry.npmjs.org/@spacingbat3/lss/-/lss-1.2.0.tgz -> webcord-dep--lss-1.2.0.tgz
	https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz -> webcord-dep--buffer-from-1.1.2.tgz
	https://registry.npmjs.org/deepmerge-ts/-/deepmerge-ts-5.1.0.tgz -> webcord-dep--deepmerge-ts-5.1.0.tgz
	https://registry.npmjs.org/dompurify/-/dompurify-3.1.3.tgz -> webcord-dep--dompurify-3.1.3.tgz
	https://registry.npmjs.org/github-slugger/-/github-slugger-2.0.0.tgz -> webcord-dep--github-slugger-2.0.0.tgz
	https://registry.npmjs.org/highlight.js/-/highlight.js-11.9.0.tgz -> webcord-dep--highlight.js-11.9.0.tgz
	https://registry.npmjs.org/marked/-/marked-12.0.2.tgz -> webcord-dep--marked-12.0.2.tgz
	https://registry.npmjs.org/marked-gfm-heading-id/-/marked-gfm-heading-id-3.1.3.tgz -> webcord-dep--marked-gfm-heading-id-3.1.3.tgz
	https://registry.npmjs.org/marked-highlight/-/marked-highlight-2.1.1.tgz -> webcord-dep--marked-highlight-2.1.1.tgz
	https://registry.npmjs.org/semver/-/semver-7.6.2.tgz -> webcord-dep--semver-7.6.2.tgz
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz -> webcord-dep--source-map-0.6.1.tgz
	https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.21.tgz -> webcord-dep--source-map-support-0.5.21.tgz
	https://registry.npmjs.org/tslib/-/tslib-2.6.2.tgz -> webcord-dep--tslib-2.6.2.tgz
	https://registry.npmjs.org/twemoji-colr-font/-/twemoji-colr-font-14.1.3.tgz -> webcord-dep--twemoji-colr-font-14.1.3.tgz
	https://registry.npmjs.org/ws/-/ws-8.17.0.tgz -> webcord-dep--ws-8.17.0.tgz
"

DESCRIPTION="A Discord and Fosscord client made with the Electron API."
HOMEPAGE="https://github.com/SpacingBat3/WebCord"
SRC_URI="
	https://github.com/SpacingBat3/WebCord/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${NODE_MODULES_SRC_URI}
"

S="${WORKDIR}/WebCord-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systray"

DEPEND="
	>=dev-util/electron-20.0.0:=
"
RDEPEND="${DEPEND}
	systray? ( dev-libs/libappindicator:3 )
"
BDEPEND="
	dev-util/esbuild
"

src_unpack() {
	# From dev-util/electron from electron overlay
	local a
	local fn

	mkdir -p "${WORKDIR}/npm-cache" || die

	for a in ${A} ; do
		case "${a}" in
			${PN}-dep*)
				# Npm artifact
				fn="${a#${PN}-dep--}"
				fn="${fn#${PN}-dep-}"
				ln -s "${DISTDIR}/${a}" "${WORKDIR}/npm-cache/${fn}" || die
				;;
			*)
				# Fallback to the default unpacker.
				unpack "${a}"
				;;
		esac
	done
}

src_prepare() {
	default

	einfo "Installing nodejs dependencies from cache"
	for npm_tgz in "${WORKDIR}/npm-cache/"*; do
		einfo $(basename ${npm_tgz})
		npm install --no-package-lock --silent --offline "${npm_tgz}"
	done

	npm ci --omit=dev --ignore-scripts --prefix=.
	rm -r "sources/code/build"
	rm "sources/assets/icons/app.ic"*
}

src_compile() {
	shopt -s globstar
	einfo "Compiling typescript with esbuild"
	esbuild "sources/code/"**/*".ts" \
		--outbase="sources" \
		--outdir="app" \
		--minify \
		--platform=node \
		--target=es2022 \
		--format=cjs \
		--supported:dynamic-import=false
	shopt -u globstar
}

src_install() {
	dodir /usr/lib/webcord
	dodir /usr/lib/webcord/sources

	newmenu "${FILESDIR}/app.desktop" webcord.desktop

	insinto /usr/lib/webcord
	doins package.json
	doins "${FILESDIR}/buildInfo.json"
	doins -r app
	doins -r node_modules

	newicon -s 512x512 "sources/assets/icons/app.png" webcord.png

	insinto /usr/lib/webcord/sources
	doins -r sources/assets
	doins -r sources/translations

	dosym "../sources/translations" "/usr/lib/webcord/app/translations"

	echo "#!/bin/sh" > "webcord"
	echo "electron '/usr/lib/webcord' \"\$@\"" >> "webcord"
	dobin "webcord"
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
