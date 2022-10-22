# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-wayland}"
MY_PV="${PV/-r*}"

CHROMIUM_LANGS="
	am ar bg bn ca cs da de el en-GB en-US es es-419 et fa fi fil fr gu he hi
	hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr sv
	sw ta te th tr uk vi zh-CN zh-TW
"

inherit chromium-2 desktop linux-info optfeature unpacker xdg

ASAR_V="3.1.0"

DESCRIPTION="All-in-one voice and text chat for gamers (system electron and wayland)"
HOMEPAGE="https://discordapp.com"
SRC_URI="
	https://dl.discordapp.net/apps/linux/${MY_PV}/${MY_PN}-${MY_PV}.tar.gz
	https://github.com/electron/asar/archive/v${ASAR_V}.tar.gz -> discord-electron-asar-${ASAR_V}.tar.gz
"

# asar yarn deps
# sed -r -n -e 's/^[ ]*resolved \"(.*)\#.*\"$/\1/g; s/^https:\/\/registry.yarnpkg.com\/(@([^@/]+))?\/?([^@/]+)\/\-\/([^/]+).tgz$/\0 -> asar-dep-\1-\4.tgz/p' yarn.lock | sort | uniq
SRC_URI+="
	https://registry.yarnpkg.com/abbrev/-/abbrev-1.1.1.tgz -> asar-dep--abbrev-1.1.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-7.1.1.tgz -> asar-dep--acorn-7.1.1.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.2.0.tgz -> asar-dep--acorn-jsx-5.2.0.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-4.2.1.tgz -> asar-dep--agent-base-4.2.1.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-4.3.0.tgz -> asar-dep--agent-base-4.3.0.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-6.0.0.tgz -> asar-dep--agent-base-6.0.0.tgz
	https://registry.yarnpkg.com/agentkeepalive/-/agentkeepalive-3.5.2.tgz -> asar-dep--agentkeepalive-3.5.2.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-2.2.0.tgz -> asar-dep--aggregate-error-2.2.0.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.0.1.tgz -> asar-dep--aggregate-error-3.0.1.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-5.5.2.tgz -> asar-dep--ajv-5.5.2.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.0.tgz -> asar-dep--ajv-6.12.0.tgz
	https://registry.yarnpkg.com/ansi-align/-/ansi-align-2.0.0.tgz -> asar-dep--ansi-align-2.0.0.tgz
	https://registry.yarnpkg.com/ansicolors/-/ansicolors-0.3.2.tgz -> asar-dep--ansicolors-0.3.2.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-3.2.3.tgz -> asar-dep--ansi-colors-3.2.3.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-4.1.1.tgz -> asar-dep--ansi-colors-4.1.1.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-2.0.0.tgz -> asar-dep--ansi-escapes-2.0.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-4.3.0.tgz -> asar-dep--ansi-escapes-4.3.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-4.3.1.tgz -> asar-dep--ansi-escapes-4.3.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz -> asar-dep--ansi-regex-2.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-3.0.0.tgz -> asar-dep--ansi-regex-3.0.0.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-4.1.0.tgz -> asar-dep--ansi-regex-4.1.0.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.0.tgz -> asar-dep--ansi-regex-5.0.0.tgz
	https://registry.yarnpkg.com/ansistyles/-/ansistyles-0.1.3.tgz -> asar-dep--ansistyles-0.1.3.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz -> asar-dep--ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.2.1.tgz -> asar-dep--ansi-styles-4.2.1.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.1.1.tgz -> asar-dep--anymatch-3.1.1.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-1.2.0.tgz -> asar-dep--aproba-1.2.0.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-2.0.0.tgz -> asar-dep--aproba-2.0.0.tgz
	https://registry.yarnpkg.com/archy/-/archy-1.0.0.tgz -> asar-dep--archy-1.0.0.tgz
	https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-1.1.4.tgz -> asar-dep--are-we-there-yet-1.1.4.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz -> asar-dep--argparse-1.0.10.tgz
	https://registry.yarnpkg.com/argv-formatter/-/argv-formatter-1.0.0.tgz -> asar-dep--argv-formatter-1.0.0.tgz
	https://registry.yarnpkg.com/array-find-index/-/array-find-index-1.0.2.tgz -> asar-dep--array-find-index-1.0.2.tgz
	https://registry.yarnpkg.com/array-ify/-/array-ify-1.0.0.tgz -> asar-dep--array-ify-1.0.0.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.1.tgz -> asar-dep--array-includes-3.1.1.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-1.0.2.tgz -> asar-dep--array-union-1.0.2.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-2.1.0.tgz -> asar-dep--array-union-2.1.0.tgz
	https://registry.yarnpkg.com/array-uniq/-/array-uniq-1.0.3.tgz -> asar-dep--array-uniq-1.0.3.tgz
	https://registry.yarnpkg.com/array-unique/-/array-unique-0.3.2.tgz -> asar-dep--array-unique-0.3.2.tgz
	https://registry.yarnpkg.com/arr-diff/-/arr-diff-4.0.0.tgz -> asar-dep--arr-diff-4.0.0.tgz
	https://registry.yarnpkg.com/arr-flatten/-/arr-flatten-1.1.0.tgz -> asar-dep--arr-flatten-1.1.0.tgz
	https://registry.yarnpkg.com/arrify/-/arrify-1.0.1.tgz -> asar-dep--arrify-1.0.1.tgz
	https://registry.yarnpkg.com/arr-union/-/arr-union-3.1.0.tgz -> asar-dep--arr-union-3.1.0.tgz
	https://registry.yarnpkg.com/asap/-/asap-2.0.6.tgz -> asar-dep--asap-2.0.6.tgz
	https://registry.yarnpkg.com/asn1/-/asn1-0.2.4.tgz -> asar-dep--asn1-0.2.4.tgz
	https://registry.yarnpkg.com/assert-plus/-/assert-plus-1.0.0.tgz -> asar-dep--assert-plus-1.0.0.tgz
	https://registry.yarnpkg.com/assign-symbols/-/assign-symbols-1.0.0.tgz -> asar-dep--assign-symbols-1.0.0.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-1.0.0.tgz -> asar-dep--astral-regex-1.0.0.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz -> asar-dep--asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/atob/-/atob-2.1.2.tgz -> asar-dep--atob-2.1.2.tgz
	https://registry.yarnpkg.com/atob-lite/-/atob-lite-2.0.0.tgz -> asar-dep--atob-lite-2.0.0.tgz
	https://registry.yarnpkg.com/aws4/-/aws4-1.8.0.tgz -> asar-dep--aws4-1.8.0.tgz
	https://registry.yarnpkg.com/aws-sign2/-/aws-sign2-0.7.0.tgz -> asar-dep--aws-sign2-0.7.0.tgz
	https://registry.yarnpkg.com/axios/-/axios-0.18.1.tgz -> asar-dep--axios-0.18.1.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.8.3.tgz -> asar-dep-@babel-code-frame-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.8.3.tgz -> asar-dep-@babel-highlight-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.8.4.tgz -> asar-dep-@babel-runtime-7.8.4.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.0.tgz -> asar-dep--balanced-match-1.0.0.tgz
	https://registry.yarnpkg.com/base/-/base-0.11.2.tgz -> asar-dep--base-0.11.2.tgz
	https://registry.yarnpkg.com/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz -> asar-dep--bcrypt-pbkdf-1.0.2.tgz
	https://registry.yarnpkg.com/before-after-hook/-/before-after-hook-2.1.0.tgz -> asar-dep--before-after-hook-2.1.0.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-2.0.0.tgz -> asar-dep--binary-extensions-2.0.0.tgz
	https://registry.yarnpkg.com/bin-links/-/bin-links-1.1.6.tgz -> asar-dep--bin-links-1.1.6.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.5.5.tgz -> asar-dep--bluebird-3.5.5.tgz
	https://registry.yarnpkg.com/bottleneck/-/bottleneck-2.19.5.tgz -> asar-dep--bottleneck-2.19.5.tgz
	https://registry.yarnpkg.com/boxen/-/boxen-1.3.0.tgz -> asar-dep--boxen-1.3.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz -> asar-dep--brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/braces/-/braces-2.3.2.tgz -> asar-dep--braces-2.3.2.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.2.tgz -> asar-dep--braces-3.0.2.tgz
	https://registry.yarnpkg.com/browser-stdout/-/browser-stdout-1.3.1.tgz -> asar-dep--browser-stdout-1.3.1.tgz
	https://registry.yarnpkg.com/btoa-lite/-/btoa-lite-1.0.0.tgz -> asar-dep--btoa-lite-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.1.tgz -> asar-dep--buffer-from-1.1.1.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-1.1.1.tgz -> asar-dep--builtin-modules-1.1.1.tgz
	https://registry.yarnpkg.com/builtins/-/builtins-1.0.3.tgz -> asar-dep--builtins-1.0.3.tgz
	https://registry.yarnpkg.com/byline/-/byline-5.0.0.tgz -> asar-dep--byline-5.0.0.tgz
	https://registry.yarnpkg.com/byte-size/-/byte-size-5.0.1.tgz -> asar-dep--byte-size-5.0.1.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-12.0.3.tgz -> asar-dep--cacache-12.0.3.tgz
	https://registry.yarnpkg.com/cache-base/-/cache-base-1.0.1.tgz -> asar-dep--cache-base-1.0.1.tgz
	https://registry.yarnpkg.com/call-limit/-/call-limit-1.1.1.tgz -> asar-dep--call-limit-1.1.1.tgz
	https://registry.yarnpkg.com/call-me-maybe/-/call-me-maybe-1.0.1.tgz -> asar-dep--call-me-maybe-1.0.1.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz -> asar-dep--callsites-3.1.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-2.1.1.tgz -> asar-dep--camelcase-2.1.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-4.1.0.tgz -> asar-dep--camelcase-4.1.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-5.3.1.tgz -> asar-dep--camelcase-5.3.1.tgz
	https://registry.yarnpkg.com/camelcase-keys/-/camelcase-keys-2.1.0.tgz -> asar-dep--camelcase-keys-2.1.0.tgz
	https://registry.yarnpkg.com/camelcase-keys/-/camelcase-keys-4.2.0.tgz -> asar-dep--camelcase-keys-4.2.0.tgz
	https://registry.yarnpkg.com/capture-stack-trace/-/capture-stack-trace-1.0.1.tgz -> asar-dep--capture-stack-trace-1.0.1.tgz
	https://registry.yarnpkg.com/cardinal/-/cardinal-2.1.1.tgz -> asar-dep--cardinal-2.1.1.tgz
	https://registry.yarnpkg.com/caseless/-/caseless-0.12.0.tgz -> asar-dep--caseless-0.12.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz -> asar-dep--chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-3.0.0.tgz -> asar-dep--chalk-3.0.0.tgz
	https://registry.yarnpkg.com/chardet/-/chardet-0.7.0.tgz -> asar-dep--chardet-0.7.0.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.3.0.tgz -> asar-dep--chokidar-3.3.0.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-1.1.3.tgz -> asar-dep--chownr-1.1.3.tgz
	https://registry.yarnpkg.com/chromium-pickle-js/-/chromium-pickle-js-0.2.0.tgz -> asar-dep--chromium-pickle-js-0.2.0.tgz
	https://registry.yarnpkg.com/cidr-regex/-/cidr-regex-2.0.10.tgz -> asar-dep--cidr-regex-2.0.10.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-1.6.0.tgz -> asar-dep--ci-info-1.6.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-2.0.0.tgz -> asar-dep--ci-info-2.0.0.tgz
	https://registry.yarnpkg.com/class-utils/-/class-utils-0.3.6.tgz -> asar-dep--class-utils-0.3.6.tgz
	https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.1.0.tgz -> asar-dep--clean-stack-2.1.0.tgz
	https://registry.yarnpkg.com/cli-boxes/-/cli-boxes-1.0.0.tgz -> asar-dep--cli-boxes-1.0.0.tgz
	https://registry.yarnpkg.com/cli-columns/-/cli-columns-3.1.2.tgz -> asar-dep--cli-columns-3.1.2.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-3.1.0.tgz -> asar-dep--cli-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/cli-table3/-/cli-table3-0.5.1.tgz -> asar-dep--cli-table3-0.5.1.tgz
	https://registry.yarnpkg.com/cli-table/-/cli-table-0.3.1.tgz -> asar-dep--cli-table-0.3.1.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-4.1.0.tgz -> asar-dep--cliui-4.1.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-5.0.0.tgz -> asar-dep--cliui-5.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-6.0.0.tgz -> asar-dep--cliui-6.0.0.tgz
	https://registry.yarnpkg.com/cli-width/-/cli-width-2.2.0.tgz -> asar-dep--cli-width-2.2.0.tgz
	https://registry.yarnpkg.com/clone/-/clone-1.0.4.tgz -> asar-dep--clone-1.0.4.tgz
	https://registry.yarnpkg.com/cmd-shim/-/cmd-shim-3.0.3.tgz -> asar-dep--cmd-shim-3.0.3.tgz
	https://registry.yarnpkg.com/co/-/co-4.6.0.tgz -> asar-dep--co-4.6.0.tgz
	https://registry.yarnpkg.com/code-point-at/-/code-point-at-1.1.0.tgz -> asar-dep--code-point-at-1.1.0.tgz
	https://registry.yarnpkg.com/collection-visit/-/collection-visit-1.0.0.tgz -> asar-dep--collection-visit-1.0.0.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz -> asar-dep--color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz -> asar-dep--color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz -> asar-dep--color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz -> asar-dep--color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colors/-/colors-1.0.3.tgz -> asar-dep--colors-1.0.3.tgz
	https://registry.yarnpkg.com/colors/-/colors-1.3.3.tgz -> asar-dep--colors-1.3.3.tgz
	https://registry.yarnpkg.com/columnify/-/columnify-1.5.4.tgz -> asar-dep--columnify-1.5.4.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.6.tgz -> asar-dep--combined-stream-1.0.6.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz -> asar-dep--commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-5.0.0.tgz -> asar-dep--commander-5.0.0.tgz
	https://registry.yarnpkg.com/compare-func/-/compare-func-1.3.2.tgz -> asar-dep--compare-func-1.3.2.tgz
	https://registry.yarnpkg.com/component-emitter/-/component-emitter-1.2.1.tgz -> asar-dep--component-emitter-1.2.1.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz -> asar-dep--concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.6.2.tgz -> asar-dep--concat-stream-1.6.2.tgz
	https://registry.yarnpkg.com/config-chain/-/config-chain-1.1.12.tgz -> asar-dep--config-chain-1.1.12.tgz
	https://registry.yarnpkg.com/configstore/-/configstore-3.1.2.tgz -> asar-dep--configstore-3.1.2.tgz
	https://registry.yarnpkg.com/console-control-strings/-/console-control-strings-1.1.0.tgz -> asar-dep--console-control-strings-1.1.0.tgz
	https://registry.yarnpkg.com/contains-path/-/contains-path-0.1.0.tgz -> asar-dep--contains-path-0.1.0.tgz
	https://registry.yarnpkg.com/@continuous-auth/client/-/client-1.2.3.tgz -> asar-dep-@continuous-auth-client-1.2.3.tgz
	https://registry.yarnpkg.com/@continuous-auth/semantic-release-npm/-/semantic-release-npm-2.0.0.tgz -> asar-dep-@continuous-auth-semantic-release-npm-2.0.0.tgz
	https://registry.yarnpkg.com/conventional-changelog-angular/-/conventional-changelog-angular-5.0.6.tgz -> asar-dep--conventional-changelog-angular-5.0.6.tgz
	https://registry.yarnpkg.com/conventional-changelog-writer/-/conventional-changelog-writer-4.0.11.tgz -> asar-dep--conventional-changelog-writer-4.0.11.tgz
	https://registry.yarnpkg.com/conventional-commits-filter/-/conventional-commits-filter-2.0.2.tgz -> asar-dep--conventional-commits-filter-2.0.2.tgz
	https://registry.yarnpkg.com/conventional-commits-parser/-/conventional-commits-parser-3.0.8.tgz -> asar-dep--conventional-commits-parser-3.0.8.tgz
	https://registry.yarnpkg.com/copy-concurrently/-/copy-concurrently-1.0.5.tgz -> asar-dep--copy-concurrently-1.0.5.tgz
	https://registry.yarnpkg.com/copy-descriptor/-/copy-descriptor-0.1.1.tgz -> asar-dep--copy-descriptor-0.1.1.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz -> asar-dep--core-util-is-1.0.2.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-6.0.0.tgz -> asar-dep--cosmiconfig-6.0.0.tgz
	https://registry.yarnpkg.com/create-error-class/-/create-error-class-3.0.2.tgz -> asar-dep--create-error-class-3.0.2.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-5.1.0.tgz -> asar-dep--cross-spawn-5.1.0.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-6.0.5.tgz -> asar-dep--cross-spawn-6.0.5.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.1.tgz -> asar-dep--cross-spawn-7.0.1.tgz
	https://registry.yarnpkg.com/crypto-random-string/-/crypto-random-string-1.0.0.tgz -> asar-dep--crypto-random-string-1.0.0.tgz
	https://registry.yarnpkg.com/crypto-random-string/-/crypto-random-string-2.0.0.tgz -> asar-dep--crypto-random-string-2.0.0.tgz
	https://registry.yarnpkg.com/currently-unhandled/-/currently-unhandled-0.4.1.tgz -> asar-dep--currently-unhandled-0.4.1.tgz
	https://registry.yarnpkg.com/cyclist/-/cyclist-0.2.2.tgz -> asar-dep--cyclist-0.2.2.tgz
	https://registry.yarnpkg.com/dashdash/-/dashdash-1.14.1.tgz -> asar-dep--dashdash-1.14.1.tgz
	https://registry.yarnpkg.com/dateformat/-/dateformat-3.0.3.tgz -> asar-dep--dateformat-3.0.3.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.9.tgz -> asar-dep--debug-2.6.9.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.1.0.tgz -> asar-dep--debug-3.1.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.6.tgz -> asar-dep--debug-3.2.6.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.1.1.tgz -> asar-dep--debug-4.1.1.tgz
	https://registry.yarnpkg.com/debug-log/-/debug-log-1.0.1.tgz -> asar-dep--debug-log-1.0.1.tgz
	https://registry.yarnpkg.com/debuglog/-/debuglog-1.0.1.tgz -> asar-dep--debuglog-1.0.1.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-1.2.0.tgz -> asar-dep--decamelize-1.2.0.tgz
	https://registry.yarnpkg.com/decamelize-keys/-/decamelize-keys-1.1.0.tgz -> asar-dep--decamelize-keys-1.1.0.tgz
	https://registry.yarnpkg.com/decode-uri-component/-/decode-uri-component-0.2.0.tgz -> asar-dep--decode-uri-component-0.2.0.tgz
	https://registry.yarnpkg.com/deep-extend/-/deep-extend-0.6.0.tgz -> asar-dep--deep-extend-0.6.0.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.3.tgz -> asar-dep--deep-is-0.1.3.tgz
	https://registry.yarnpkg.com/defaults/-/defaults-1.0.3.tgz -> asar-dep--defaults-1.0.3.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.1.3.tgz -> asar-dep--define-properties-1.1.3.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-0.2.5.tgz -> asar-dep--define-property-0.2.5.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-1.0.0.tgz -> asar-dep--define-property-1.0.0.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-2.0.2.tgz -> asar-dep--define-property-2.0.2.tgz
	https://registry.yarnpkg.com/deglob/-/deglob-4.0.1.tgz -> asar-dep--deglob-4.0.1.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz -> asar-dep--delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/delegates/-/delegates-1.0.0.tgz -> asar-dep--delegates-1.0.0.tgz
	https://registry.yarnpkg.com/deprecation/-/deprecation-2.3.1.tgz -> asar-dep--deprecation-2.3.1.tgz
	https://registry.yarnpkg.com/detect-indent/-/detect-indent-5.0.0.tgz -> asar-dep--detect-indent-5.0.0.tgz
	https://registry.yarnpkg.com/detect-newline/-/detect-newline-2.1.0.tgz -> asar-dep--detect-newline-2.1.0.tgz
	https://registry.yarnpkg.com/dezalgo/-/dezalgo-1.0.3.tgz -> asar-dep--dezalgo-1.0.3.tgz
	https://registry.yarnpkg.com/diff/-/diff-3.5.0.tgz -> asar-dep--diff-3.5.0.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-2.2.2.tgz -> asar-dep--dir-glob-2.2.2.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-3.0.1.tgz -> asar-dep--dir-glob-3.0.1.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-1.5.0.tgz -> asar-dep--doctrine-1.5.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz -> asar-dep--doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz -> asar-dep--doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-5.0.1.tgz -> asar-dep--dotenv-5.0.1.tgz
	https://registry.yarnpkg.com/dot-prop/-/dot-prop-3.0.0.tgz -> asar-dep--dot-prop-3.0.0.tgz
	https://registry.yarnpkg.com/dot-prop/-/dot-prop-4.2.0.tgz -> asar-dep--dot-prop-4.2.0.tgz
	https://registry.yarnpkg.com/duplexer2/-/duplexer2-0.1.4.tgz -> asar-dep--duplexer2-0.1.4.tgz
	https://registry.yarnpkg.com/duplexer3/-/duplexer3-0.1.4.tgz -> asar-dep--duplexer3-0.1.4.tgz
	https://registry.yarnpkg.com/duplexify/-/duplexify-3.6.0.tgz -> asar-dep--duplexify-3.6.0.tgz
	https://registry.yarnpkg.com/ecc-jsbn/-/ecc-jsbn-0.1.2.tgz -> asar-dep--ecc-jsbn-0.1.2.tgz
	https://registry.yarnpkg.com/editor/-/editor-1.0.0.tgz -> asar-dep--editor-1.0.0.tgz
	https://registry.yarnpkg.com/electron-download/-/electron-download-4.1.1.tgz -> asar-dep--electron-download-4.1.1.tgz
	https://registry.yarnpkg.com/electron/-/electron-5.0.0.tgz -> asar-dep--electron-5.0.0.tgz
	https://registry.yarnpkg.com/electron-mocha/-/electron-mocha-8.2.1.tgz -> asar-dep--electron-mocha-8.2.1.tgz
	https://registry.yarnpkg.com/electron-window/-/electron-window-0.8.1.tgz -> asar-dep--electron-window-0.8.1.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-7.0.3.tgz -> asar-dep--emoji-regex-7.0.3.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz -> asar-dep--emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/encoding/-/encoding-0.1.12.tgz -> asar-dep--encoding-0.1.12.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.1.tgz -> asar-dep--end-of-stream-1.4.1.tgz
	https://registry.yarnpkg.com/env-ci/-/env-ci-5.0.1.tgz -> asar-dep--env-ci-5.0.1.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-1.0.0.tgz -> asar-dep--env-paths-1.0.0.tgz
	https://registry.yarnpkg.com/err-code/-/err-code-1.1.2.tgz -> asar-dep--err-code-1.1.2.tgz
	https://registry.yarnpkg.com/errno/-/errno-0.1.7.tgz -> asar-dep--errno-0.1.7.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz -> asar-dep--error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/es6-promise/-/es6-promise-4.2.8.tgz -> asar-dep--es6-promise-4.2.8.tgz
	https://registry.yarnpkg.com/es6-promisify/-/es6-promisify-5.0.0.tgz -> asar-dep--es6-promisify-5.0.0.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.13.0.tgz -> asar-dep--es-abstract-1.13.0.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.17.5.tgz -> asar-dep--es-abstract-1.17.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz -> asar-dep--escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/eslint-config-standard/-/eslint-config-standard-14.1.0.tgz -> asar-dep--eslint-config-standard-14.1.0.tgz
	https://registry.yarnpkg.com/eslint-config-standard-jsx/-/eslint-config-standard-jsx-8.1.0.tgz -> asar-dep--eslint-config-standard-jsx-8.1.0.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-6.8.0.tgz -> asar-dep--eslint-6.8.0.tgz
	https://registry.yarnpkg.com/eslint-formatter-pretty/-/eslint-formatter-pretty-1.3.0.tgz -> asar-dep--eslint-formatter-pretty-1.3.0.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.3.tgz -> asar-dep--eslint-import-resolver-node-0.3.3.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.5.2.tgz -> asar-dep--eslint-module-utils-2.5.2.tgz
	https://registry.yarnpkg.com/eslint-plugin-es/-/eslint-plugin-es-2.0.0.tgz -> asar-dep--eslint-plugin-es-2.0.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.18.2.tgz -> asar-dep--eslint-plugin-import-2.18.2.tgz
	https://registry.yarnpkg.com/eslint-plugin-node/-/eslint-plugin-node-10.0.0.tgz -> asar-dep--eslint-plugin-node-10.0.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-promise/-/eslint-plugin-promise-4.2.1.tgz -> asar-dep--eslint-plugin-promise-4.2.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-react/-/eslint-plugin-react-7.14.3.tgz -> asar-dep--eslint-plugin-react-7.14.3.tgz
	https://registry.yarnpkg.com/eslint-plugin-standard/-/eslint-plugin-standard-4.0.1.tgz -> asar-dep--eslint-plugin-standard-4.0.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.0.0.tgz -> asar-dep--eslint-scope-5.0.0.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-1.4.3.tgz -> asar-dep--eslint-utils-1.4.3.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-1.1.0.tgz -> asar-dep--eslint-visitor-keys-1.1.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-6.2.1.tgz -> asar-dep--espree-6.2.1.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz -> asar-dep--esprima-4.0.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.2.0.tgz -> asar-dep--esquery-1.2.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.2.1.tgz -> asar-dep--esrecurse-4.2.1.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.0.tgz -> asar-dep--es-to-primitive-1.2.0.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz -> asar-dep--es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz -> asar-dep--estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.0.0.tgz -> asar-dep--estraverse-5.0.0.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz -> asar-dep--esutils-2.0.3.tgz
	https://registry.yarnpkg.com/execa/-/execa-0.7.0.tgz -> asar-dep--execa-0.7.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-1.0.0.tgz -> asar-dep--execa-1.0.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-4.0.0.tgz -> asar-dep--execa-4.0.0.tgz
	https://registry.yarnpkg.com/expand-brackets/-/expand-brackets-2.1.4.tgz -> asar-dep--expand-brackets-2.1.4.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.2.tgz -> asar-dep--extend-3.0.2.tgz
	https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-2.0.1.tgz -> asar-dep--extend-shallow-2.0.1.tgz
	https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-3.0.2.tgz -> asar-dep--extend-shallow-3.0.2.tgz
	https://registry.yarnpkg.com/external-editor/-/external-editor-3.1.0.tgz -> asar-dep--external-editor-3.1.0.tgz
	https://registry.yarnpkg.com/extglob/-/extglob-2.0.4.tgz -> asar-dep--extglob-2.0.4.tgz
	https://registry.yarnpkg.com/extract-zip/-/extract-zip-1.6.7.tgz -> asar-dep--extract-zip-1.6.7.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.3.0.tgz -> asar-dep--extsprintf-1.3.0.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-1.1.0.tgz -> asar-dep--fast-deep-equal-1.1.0.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.1.tgz -> asar-dep--fast-deep-equal-3.1.1.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-2.2.6.tgz -> asar-dep--fast-glob-2.2.6.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.1.1.tgz -> asar-dep--fast-glob-3.1.1.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.0.0.tgz -> asar-dep--fast-json-stable-stringify-2.0.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz -> asar-dep--fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.6.0.tgz -> asar-dep--fastq-1.6.0.tgz
	https://registry.yarnpkg.com/fd-slicer/-/fd-slicer-1.0.1.tgz -> asar-dep--fd-slicer-1.0.1.tgz
	https://registry.yarnpkg.com/figgy-pudding/-/figgy-pudding-3.5.1.tgz -> asar-dep--figgy-pudding-3.5.1.tgz
	https://registry.yarnpkg.com/figures/-/figures-2.0.0.tgz -> asar-dep--figures-2.0.0.tgz
	https://registry.yarnpkg.com/figures/-/figures-3.2.0.tgz -> asar-dep--figures-3.2.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-5.0.1.tgz -> asar-dep--file-entry-cache-5.0.1.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-4.0.0.tgz -> asar-dep--fill-range-4.0.0.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.0.1.tgz -> asar-dep--fill-range-7.0.1.tgz
	https://registry.yarnpkg.com/find-npm-prefix/-/find-npm-prefix-1.0.2.tgz -> asar-dep--find-npm-prefix-1.0.2.tgz
	https://registry.yarnpkg.com/find-root/-/find-root-1.1.0.tgz -> asar-dep--find-root-1.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-1.1.2.tgz -> asar-dep--find-up-1.1.2.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-2.1.0.tgz -> asar-dep--find-up-2.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-3.0.0.tgz -> asar-dep--find-up-3.0.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz -> asar-dep--find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-versions/-/find-versions-3.2.0.tgz -> asar-dep--find-versions-3.2.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-2.0.1.tgz -> asar-dep--flat-cache-2.0.1.tgz
	https://registry.yarnpkg.com/flat/-/flat-4.1.0.tgz -> asar-dep--flat-4.1.0.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-2.0.1.tgz -> asar-dep--flatted-2.0.1.tgz
	https://registry.yarnpkg.com/flush-write-stream/-/flush-write-stream-1.0.3.tgz -> asar-dep--flush-write-stream-1.0.3.tgz
	https://registry.yarnpkg.com/follow-redirects/-/follow-redirects-1.5.10.tgz -> asar-dep--follow-redirects-1.5.10.tgz
	https://registry.yarnpkg.com/forever-agent/-/forever-agent-0.6.1.tgz -> asar-dep--forever-agent-0.6.1.tgz
	https://registry.yarnpkg.com/for-in/-/for-in-1.0.2.tgz -> asar-dep--for-in-1.0.2.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.3.2.tgz -> asar-dep--form-data-2.3.2.tgz
	https://registry.yarnpkg.com/fragment-cache/-/fragment-cache-0.2.1.tgz -> asar-dep--fragment-cache-0.2.1.tgz
	https://registry.yarnpkg.com/from2/-/from2-1.3.0.tgz -> asar-dep--from2-1.3.0.tgz
	https://registry.yarnpkg.com/from2/-/from2-2.3.0.tgz -> asar-dep--from2-2.3.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.1.2.tgz -> asar-dep--fsevents-2.1.2.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-4.0.3.tgz -> asar-dep--fs-extra-4.0.3.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-7.0.1.tgz -> asar-dep--fs-extra-7.0.1.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz -> asar-dep--fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-1.2.7.tgz -> asar-dep--fs-minipass-1.2.7.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz -> asar-dep--fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fs-vacuum/-/fs-vacuum-1.2.10.tgz -> asar-dep--fs-vacuum-1.2.10.tgz
	https://registry.yarnpkg.com/fs-write-stream-atomic/-/fs-write-stream-atomic-1.0.10.tgz -> asar-dep--fs-write-stream-atomic-1.0.10.tgz
	https://registry.yarnpkg.com/functional-red-black-tree/-/functional-red-black-tree-1.0.1.tgz -> asar-dep--functional-red-black-tree-1.0.1.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz -> asar-dep--function-bind-1.1.1.tgz
	https://registry.yarnpkg.com/gauge/-/gauge-2.7.4.tgz -> asar-dep--gauge-2.7.4.tgz
	https://registry.yarnpkg.com/genfun/-/genfun-5.0.0.tgz -> asar-dep--genfun-5.0.0.tgz
	https://registry.yarnpkg.com/gentle-fs/-/gentle-fs-2.3.0.tgz -> asar-dep--gentle-fs-2.3.0.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-1.0.2.tgz -> asar-dep--get-caller-file-1.0.2.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz -> asar-dep--get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/getpass/-/getpass-0.1.7.tgz -> asar-dep--getpass-0.1.7.tgz
	https://registry.yarnpkg.com/get-stdin/-/get-stdin-4.0.1.tgz -> asar-dep--get-stdin-4.0.1.tgz
	https://registry.yarnpkg.com/get-stdin/-/get-stdin-7.0.0.tgz -> asar-dep--get-stdin-7.0.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-3.0.0.tgz -> asar-dep--get-stream-3.0.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-4.1.0.tgz -> asar-dep--get-stream-4.1.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-5.1.0.tgz -> asar-dep--get-stream-5.1.0.tgz
	https://registry.yarnpkg.com/get-value/-/get-value-2.0.6.tgz -> asar-dep--get-value-2.0.6.tgz
	https://registry.yarnpkg.com/git-log-parser/-/git-log-parser-1.2.0.tgz -> asar-dep--git-log-parser-1.2.0.tgz
	https://registry.yarnpkg.com/global-dirs/-/global-dirs-0.1.1.tgz -> asar-dep--global-dirs-0.1.1.tgz
	https://registry.yarnpkg.com/globals/-/globals-12.4.0.tgz -> asar-dep--globals-12.4.0.tgz
	https://registry.yarnpkg.com/globby/-/globby-11.0.0.tgz -> asar-dep--globby-11.0.0.tgz
	https://registry.yarnpkg.com/globby/-/globby-9.2.0.tgz -> asar-dep--globby-9.2.0.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.3.tgz -> asar-dep--glob-7.1.3.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.4.tgz -> asar-dep--glob-7.1.4.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.6.tgz -> asar-dep--glob-7.1.6.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-3.1.0.tgz -> asar-dep--glob-parent-3.1.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.0.tgz -> asar-dep--glob-parent-5.1.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.1.tgz -> asar-dep--glob-parent-5.1.1.tgz
	https://registry.yarnpkg.com/glob-to-regexp/-/glob-to-regexp-0.3.0.tgz -> asar-dep--glob-to-regexp-0.3.0.tgz
	https://registry.yarnpkg.com/got/-/got-6.7.1.tgz -> asar-dep--got-6.7.1.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.1.15.tgz -> asar-dep--graceful-fs-4.1.15.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.3.tgz -> asar-dep--graceful-fs-4.2.3.tgz
	https://registry.yarnpkg.com/growl/-/growl-1.10.5.tgz -> asar-dep--growl-1.10.5.tgz
	https://registry.yarnpkg.com/handlebars/-/handlebars-4.7.3.tgz -> asar-dep--handlebars-4.7.3.tgz
	https://registry.yarnpkg.com/har-schema/-/har-schema-2.0.0.tgz -> asar-dep--har-schema-2.0.0.tgz
	https://registry.yarnpkg.com/har-validator/-/har-validator-5.1.0.tgz -> asar-dep--har-validator-5.1.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz -> asar-dep--has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz -> asar-dep--has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.3.tgz -> asar-dep--has-1.0.3.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.0.tgz -> asar-dep--has-symbols-1.0.0.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.1.tgz -> asar-dep--has-symbols-1.0.1.tgz
	https://registry.yarnpkg.com/has-unicode/-/has-unicode-2.0.1.tgz -> asar-dep--has-unicode-2.0.1.tgz
	https://registry.yarnpkg.com/has-value/-/has-value-0.3.1.tgz -> asar-dep--has-value-0.3.1.tgz
	https://registry.yarnpkg.com/has-value/-/has-value-1.0.0.tgz -> asar-dep--has-value-1.0.0.tgz
	https://registry.yarnpkg.com/has-values/-/has-values-0.1.4.tgz -> asar-dep--has-values-0.1.4.tgz
	https://registry.yarnpkg.com/has-values/-/has-values-1.0.0.tgz -> asar-dep--has-values-1.0.0.tgz
	https://registry.yarnpkg.com/he/-/he-1.2.0.tgz -> asar-dep--he-1.2.0.tgz
	https://registry.yarnpkg.com/hook-std/-/hook-std-2.0.0.tgz -> asar-dep--hook-std-2.0.0.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.5.tgz -> asar-dep--hosted-git-info-2.8.5.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-3.0.2.tgz -> asar-dep--hosted-git-info-3.0.2.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-3.8.1.tgz -> asar-dep--http-cache-semantics-3.8.1.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-2.1.0.tgz -> asar-dep--http-proxy-agent-2.1.0.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-4.0.1.tgz -> asar-dep--http-proxy-agent-4.0.1.tgz
	https://registry.yarnpkg.com/http-signature/-/http-signature-1.2.0.tgz -> asar-dep--http-signature-1.2.0.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-2.2.4.tgz -> asar-dep--https-proxy-agent-2.2.4.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-5.0.0.tgz -> asar-dep--https-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/humanize-ms/-/humanize-ms-1.2.1.tgz -> asar-dep--humanize-ms-1.2.1.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-1.1.1.tgz -> asar-dep--human-signals-1.1.1.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.23.tgz -> asar-dep--iconv-lite-0.4.23.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.24.tgz -> asar-dep--iconv-lite-0.4.24.tgz
	https://registry.yarnpkg.com/iferr/-/iferr-0.1.5.tgz -> asar-dep--iferr-0.1.5.tgz
	https://registry.yarnpkg.com/iferr/-/iferr-1.0.2.tgz -> asar-dep--iferr-1.0.2.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-4.0.6.tgz -> asar-dep--ignore-4.0.6.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.1.4.tgz -> asar-dep--ignore-5.1.4.tgz
	https://registry.yarnpkg.com/ignore-walk/-/ignore-walk-3.0.3.tgz -> asar-dep--ignore-walk-3.0.3.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.2.1.tgz -> asar-dep--import-fresh-3.2.1.tgz
	https://registry.yarnpkg.com/import-from/-/import-from-3.0.0.tgz -> asar-dep--import-from-3.0.0.tgz
	https://registry.yarnpkg.com/import-lazy/-/import-lazy-2.1.0.tgz -> asar-dep--import-lazy-2.1.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz -> asar-dep--imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-2.1.0.tgz -> asar-dep--indent-string-2.1.0.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-3.2.0.tgz -> asar-dep--indent-string-3.2.0.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz -> asar-dep--indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/infer-owner/-/infer-owner-1.0.4.tgz -> asar-dep--infer-owner-1.0.4.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz -> asar-dep--inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.3.tgz -> asar-dep--inherits-2.0.3.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz -> asar-dep--inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.5.tgz -> asar-dep--ini-1.3.5.tgz
	https://registry.yarnpkg.com/init-package-json/-/init-package-json-1.10.3.tgz -> asar-dep--init-package-json-1.10.3.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-7.1.0.tgz -> asar-dep--inquirer-7.1.0.tgz
	https://registry.yarnpkg.com/into-stream/-/into-stream-5.1.1.tgz -> asar-dep--into-stream-5.1.1.tgz
	https://registry.yarnpkg.com/invert-kv/-/invert-kv-1.0.0.tgz -> asar-dep--invert-kv-1.0.0.tgz
	https://registry.yarnpkg.com/ip/-/ip-1.1.5.tgz -> asar-dep--ip-1.1.5.tgz
	https://registry.yarnpkg.com/ip-regex/-/ip-regex-2.1.0.tgz -> asar-dep--ip-regex-2.1.0.tgz
	https://registry.yarnpkg.com/irregular-plurals/-/irregular-plurals-1.4.0.tgz -> asar-dep--irregular-plurals-1.4.0.tgz
	https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-0.1.6.tgz -> asar-dep--is-accessor-descriptor-0.1.6.tgz
	https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz -> asar-dep--is-accessor-descriptor-1.0.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-0.0.1.tgz -> asar-dep--isarray-0.0.1.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz -> asar-dep--isarray-1.0.0.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz -> asar-dep--is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-2.1.0.tgz -> asar-dep--is-binary-path-2.1.0.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-1.1.6.tgz -> asar-dep--is-buffer-1.1.6.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-2.0.3.tgz -> asar-dep--is-buffer-2.0.3.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-2.0.4.tgz -> asar-dep--is-buffer-2.0.4.tgz
	https://registry.yarnpkg.com/is-builtin-module/-/is-builtin-module-1.0.0.tgz -> asar-dep--is-builtin-module-1.0.0.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.1.5.tgz -> asar-dep--is-callable-1.1.5.tgz
	https://registry.yarnpkg.com/is-cidr/-/is-cidr-3.0.0.tgz -> asar-dep--is-cidr-3.0.0.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-1.2.1.tgz -> asar-dep--is-ci-1.2.1.tgz
	https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-0.1.4.tgz -> asar-dep--is-data-descriptor-0.1.4.tgz
	https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz -> asar-dep--is-data-descriptor-1.0.0.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.1.tgz -> asar-dep--is-date-object-1.0.1.tgz
	https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-0.1.6.tgz -> asar-dep--is-descriptor-0.1.6.tgz
	https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-1.0.2.tgz -> asar-dep--is-descriptor-1.0.2.tgz
	https://registry.yarnpkg.com/is-electron-renderer/-/is-electron-renderer-2.0.1.tgz -> asar-dep--is-electron-renderer-2.0.1.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz -> asar-dep--isexe-2.0.0.tgz
	https://registry.yarnpkg.com/is-extendable/-/is-extendable-0.1.1.tgz -> asar-dep--is-extendable-0.1.1.tgz
	https://registry.yarnpkg.com/is-extendable/-/is-extendable-1.0.1.tgz -> asar-dep--is-extendable-1.0.1.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz -> asar-dep--is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-finite/-/is-finite-1.0.2.tgz -> asar-dep--is-finite-1.0.2.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-1.0.0.tgz -> asar-dep--is-fullwidth-code-point-1.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-2.0.0.tgz -> asar-dep--is-fullwidth-code-point-2.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz -> asar-dep--is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-3.1.0.tgz -> asar-dep--is-glob-3.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.1.tgz -> asar-dep--is-glob-4.0.1.tgz
	https://registry.yarnpkg.com/is-installed-globally/-/is-installed-globally-0.1.0.tgz -> asar-dep--is-installed-globally-0.1.0.tgz
	https://registry.yarnpkg.com/is-npm/-/is-npm-1.0.0.tgz -> asar-dep--is-npm-1.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-3.0.0.tgz -> asar-dep--is-number-3.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz -> asar-dep--is-number-7.0.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-2.1.0.tgz -> asar-dep--isobject-2.1.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-3.0.1.tgz -> asar-dep--isobject-3.0.1.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-4.0.0.tgz -> asar-dep--isobject-4.0.0.tgz
	https://registry.yarnpkg.com/is-obj/-/is-obj-1.0.1.tgz -> asar-dep--is-obj-1.0.1.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-1.0.1.tgz -> asar-dep--is-path-inside-1.0.1.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-2.0.4.tgz -> asar-dep--is-plain-object-2.0.4.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-3.0.0.tgz -> asar-dep--is-plain-object-3.0.0.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-1.1.0.tgz -> asar-dep--is-plain-obj-1.1.0.tgz
	https://registry.yarnpkg.com/is-promise/-/is-promise-2.1.0.tgz -> asar-dep--is-promise-2.1.0.tgz
	https://registry.yarnpkg.com/is-redirect/-/is-redirect-1.0.0.tgz -> asar-dep--is-redirect-1.0.0.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.0.4.tgz -> asar-dep--is-regex-1.0.4.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.0.5.tgz -> asar-dep--is-regex-1.0.5.tgz
	https://registry.yarnpkg.com/is-retry-allowed/-/is-retry-allowed-1.2.0.tgz -> asar-dep--is-retry-allowed-1.2.0.tgz
	https://registry.yarnpkg.com/isstream/-/isstream-0.1.2.tgz -> asar-dep--isstream-0.1.2.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-1.1.0.tgz -> asar-dep--is-stream-1.1.0.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-2.0.0.tgz -> asar-dep--is-stream-2.0.0.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.5.tgz -> asar-dep--is-string-1.0.5.tgz
	https://registry.yarnpkg.com/issue-parser/-/issue-parser-6.0.0.tgz -> asar-dep--issue-parser-6.0.0.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.2.tgz -> asar-dep--is-symbol-1.0.2.tgz
	https://registry.yarnpkg.com/is-text-path/-/is-text-path-1.0.1.tgz -> asar-dep--is-text-path-1.0.1.tgz
	https://registry.yarnpkg.com/is-typedarray/-/is-typedarray-1.0.0.tgz -> asar-dep--is-typedarray-1.0.0.tgz
	https://registry.yarnpkg.com/is-utf8/-/is-utf8-0.2.1.tgz -> asar-dep--is-utf8-0.2.1.tgz
	https://registry.yarnpkg.com/is-windows/-/is-windows-1.0.2.tgz -> asar-dep--is-windows-1.0.2.tgz
	https://registry.yarnpkg.com/java-properties/-/java-properties-1.0.2.tgz -> asar-dep--java-properties-1.0.2.tgz
	https://registry.yarnpkg.com/jsbn/-/jsbn-0.1.1.tgz -> asar-dep--jsbn-0.1.1.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz -> asar-dep--jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz -> asar-dep--json-parse-better-errors-1.0.2.tgz
	https://registry.yarnpkg.com/jsonparse/-/jsonparse-1.3.1.tgz -> asar-dep--jsonparse-1.3.1.tgz
	https://registry.yarnpkg.com/json-schema/-/json-schema-0.2.3.tgz -> asar-dep--json-schema-0.2.3.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.3.1.tgz -> asar-dep--json-schema-traverse-0.3.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz -> asar-dep--json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz -> asar-dep--json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/JSONStream/-/JSONStream-1.3.5.tgz -> asar-dep--JSONStream-1.3.5.tgz
	https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz -> asar-dep--json-stringify-safe-5.0.1.tgz
	https://registry.yarnpkg.com/jsprim/-/jsprim-1.4.1.tgz -> asar-dep--jsprim-1.4.1.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz -> asar-dep--js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/jsx-ast-utils/-/jsx-ast-utils-2.2.3.tgz -> asar-dep--jsx-ast-utils-2.2.3.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.13.1.tgz -> asar-dep--js-yaml-3.13.1.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-3.2.2.tgz -> asar-dep--kind-of-3.2.2.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-4.0.0.tgz -> asar-dep--kind-of-4.0.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-5.1.0.tgz -> asar-dep--kind-of-5.1.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.2.tgz -> asar-dep--kind-of-6.0.2.tgz
	https://registry.yarnpkg.com/latest-version/-/latest-version-3.1.0.tgz -> asar-dep--latest-version-3.1.0.tgz
	https://registry.yarnpkg.com/lazy-property/-/lazy-property-1.0.0.tgz -> asar-dep--lazy-property-1.0.0.tgz
	https://registry.yarnpkg.com/lcid/-/lcid-1.0.0.tgz -> asar-dep--lcid-1.0.0.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.3.0.tgz -> asar-dep--levn-0.3.0.tgz
	https://registry.yarnpkg.com/libcipm/-/libcipm-4.0.7.tgz -> asar-dep--libcipm-4.0.7.tgz
	https://registry.yarnpkg.com/libnpmaccess/-/libnpmaccess-3.0.2.tgz -> asar-dep--libnpmaccess-3.0.2.tgz
	https://registry.yarnpkg.com/libnpmconfig/-/libnpmconfig-1.2.1.tgz -> asar-dep--libnpmconfig-1.2.1.tgz
	https://registry.yarnpkg.com/libnpmhook/-/libnpmhook-5.0.3.tgz -> asar-dep--libnpmhook-5.0.3.tgz
	https://registry.yarnpkg.com/libnpm/-/libnpm-3.0.1.tgz -> asar-dep--libnpm-3.0.1.tgz
	https://registry.yarnpkg.com/libnpmorg/-/libnpmorg-1.0.1.tgz -> asar-dep--libnpmorg-1.0.1.tgz
	https://registry.yarnpkg.com/libnpmpublish/-/libnpmpublish-1.1.2.tgz -> asar-dep--libnpmpublish-1.1.2.tgz
	https://registry.yarnpkg.com/libnpmsearch/-/libnpmsearch-2.0.2.tgz -> asar-dep--libnpmsearch-2.0.2.tgz
	https://registry.yarnpkg.com/libnpmteam/-/libnpmteam-1.0.2.tgz -> asar-dep--libnpmteam-1.0.2.tgz
	https://registry.yarnpkg.com/libnpx/-/libnpx-10.2.0.tgz -> asar-dep--libnpx-10.2.0.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.1.6.tgz -> asar-dep--lines-and-columns-1.1.6.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-1.1.0.tgz -> asar-dep--load-json-file-1.1.0.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-2.0.0.tgz -> asar-dep--load-json-file-2.0.0.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-4.0.0.tgz -> asar-dep--load-json-file-4.0.0.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-5.3.0.tgz -> asar-dep--load-json-file-5.3.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-2.0.0.tgz -> asar-dep--locate-path-2.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-3.0.0.tgz -> asar-dep--locate-path-3.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz -> asar-dep--locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/lockfile/-/lockfile-1.0.4.tgz -> asar-dep--lockfile-1.0.4.tgz
	https://registry.yarnpkg.com/lock-verify/-/lock-verify-2.1.0.tgz -> asar-dep--lock-verify-2.1.0.tgz
	https://registry.yarnpkg.com/lodash._baseuniq/-/lodash._baseuniq-4.6.0.tgz -> asar-dep--lodash._baseuniq-4.6.0.tgz
	https://registry.yarnpkg.com/lodash.capitalize/-/lodash.capitalize-4.2.1.tgz -> asar-dep--lodash.capitalize-4.2.1.tgz
	https://registry.yarnpkg.com/lodash.clonedeep/-/lodash.clonedeep-4.5.0.tgz -> asar-dep--lodash.clonedeep-4.5.0.tgz
	https://registry.yarnpkg.com/lodash._createset/-/lodash._createset-4.0.3.tgz -> asar-dep--lodash._createset-4.0.3.tgz
	https://registry.yarnpkg.com/lodash.escaperegexp/-/lodash.escaperegexp-4.1.2.tgz -> asar-dep--lodash.escaperegexp-4.1.2.tgz
	https://registry.yarnpkg.com/lodash.get/-/lodash.get-4.4.2.tgz -> asar-dep--lodash.get-4.4.2.tgz
	https://registry.yarnpkg.com/lodash.ismatch/-/lodash.ismatch-4.4.0.tgz -> asar-dep--lodash.ismatch-4.4.0.tgz
	https://registry.yarnpkg.com/lodash.isplainobject/-/lodash.isplainobject-4.0.6.tgz -> asar-dep--lodash.isplainobject-4.0.6.tgz
	https://registry.yarnpkg.com/lodash.isstring/-/lodash.isstring-4.0.1.tgz -> asar-dep--lodash.isstring-4.0.1.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.15.tgz -> asar-dep--lodash-4.17.15.tgz
	https://registry.yarnpkg.com/lodash._root/-/lodash._root-3.0.1.tgz -> asar-dep--lodash._root-3.0.1.tgz
	https://registry.yarnpkg.com/lodash.set/-/lodash.set-4.3.2.tgz -> asar-dep--lodash.set-4.3.2.tgz
	https://registry.yarnpkg.com/lodash.toarray/-/lodash.toarray-4.4.0.tgz -> asar-dep--lodash.toarray-4.4.0.tgz
	https://registry.yarnpkg.com/lodash.union/-/lodash.union-4.6.0.tgz -> asar-dep--lodash.union-4.6.0.tgz
	https://registry.yarnpkg.com/lodash.uniqby/-/lodash.uniqby-4.7.0.tgz -> asar-dep--lodash.uniqby-4.7.0.tgz
	https://registry.yarnpkg.com/lodash.uniq/-/lodash.uniq-4.5.0.tgz -> asar-dep--lodash.uniq-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.without/-/lodash.without-4.4.0.tgz -> asar-dep--lodash.without-4.4.0.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-2.2.0.tgz -> asar-dep--log-symbols-2.2.0.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-3.0.0.tgz -> asar-dep--log-symbols-3.0.0.tgz
	https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.4.0.tgz -> asar-dep--loose-envify-1.4.0.tgz
	https://registry.yarnpkg.com/loud-rejection/-/loud-rejection-1.6.0.tgz -> asar-dep--loud-rejection-1.6.0.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-1.0.1.tgz -> asar-dep--lowercase-keys-1.0.1.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-4.1.5.tgz -> asar-dep--lru-cache-4.1.5.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-5.1.1.tgz -> asar-dep--lru-cache-5.1.1.tgz
	https://registry.yarnpkg.com/macos-release/-/macos-release-2.3.0.tgz -> asar-dep--macos-release-2.3.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-1.3.0.tgz -> asar-dep--make-dir-1.3.0.tgz
	https://registry.yarnpkg.com/make-fetch-happen/-/make-fetch-happen-5.0.2.tgz -> asar-dep--make-fetch-happen-5.0.2.tgz
	https://registry.yarnpkg.com/map-cache/-/map-cache-0.2.2.tgz -> asar-dep--map-cache-0.2.2.tgz
	https://registry.yarnpkg.com/map-obj/-/map-obj-1.0.1.tgz -> asar-dep--map-obj-1.0.1.tgz
	https://registry.yarnpkg.com/map-obj/-/map-obj-2.0.0.tgz -> asar-dep--map-obj-2.0.0.tgz
	https://registry.yarnpkg.com/map-visit/-/map-visit-1.0.0.tgz -> asar-dep--map-visit-1.0.0.tgz
	https://registry.yarnpkg.com/marked/-/marked-0.8.0.tgz -> asar-dep--marked-0.8.0.tgz
	https://registry.yarnpkg.com/marked-terminal/-/marked-terminal-4.0.0.tgz -> asar-dep--marked-terminal-4.0.0.tgz
	https://registry.yarnpkg.com/meant/-/meant-1.0.1.tgz -> asar-dep--meant-1.0.1.tgz
	https://registry.yarnpkg.com/mem/-/mem-1.1.0.tgz -> asar-dep--mem-1.1.0.tgz
	https://registry.yarnpkg.com/meow/-/meow-3.7.0.tgz -> asar-dep--meow-3.7.0.tgz
	https://registry.yarnpkg.com/meow/-/meow-5.0.0.tgz -> asar-dep--meow-5.0.0.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.2.3.tgz -> asar-dep--merge2-1.2.3.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.3.0.tgz -> asar-dep--merge2-1.3.0.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz -> asar-dep--merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-3.1.10.tgz -> asar-dep--micromatch-3.1.10.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.2.tgz -> asar-dep--micromatch-4.0.2.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.35.0.tgz -> asar-dep--mime-db-1.35.0.tgz
	https://registry.yarnpkg.com/mime/-/mime-2.4.4.tgz -> asar-dep--mime-2.4.4.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.19.tgz -> asar-dep--mime-types-2.1.19.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-1.2.0.tgz -> asar-dep--mimic-fn-1.2.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz -> asar-dep--mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.4.tgz -> asar-dep--minimatch-3.0.4.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-0.0.8.tgz -> asar-dep--minimist-0.0.8.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.0.tgz -> asar-dep--minimist-1.2.0.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.5.tgz -> asar-dep--minimist-1.2.5.tgz
	https://registry.yarnpkg.com/minimist-options/-/minimist-options-3.0.2.tgz -> asar-dep--minimist-options-3.0.2.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-2.9.0.tgz -> asar-dep--minipass-2.9.0.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-1.3.3.tgz -> asar-dep--minizlib-1.3.3.tgz
	https://registry.yarnpkg.com/mississippi/-/mississippi-3.0.0.tgz -> asar-dep--mississippi-3.0.0.tgz
	https://registry.yarnpkg.com/mixin-deep/-/mixin-deep-1.3.1.tgz -> asar-dep--mixin-deep-1.3.1.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.1.tgz -> asar-dep--mkdirp-0.5.1.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.3.tgz -> asar-dep--mkdirp-0.5.3.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-7.0.1.tgz -> asar-dep--mocha-7.0.1.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-7.1.1.tgz -> asar-dep--mocha-7.1.1.tgz
	https://registry.yarnpkg.com/modify-values/-/modify-values-1.0.1.tgz -> asar-dep--modify-values-1.0.1.tgz
	https://registry.yarnpkg.com/move-concurrently/-/move-concurrently-1.0.1.tgz -> asar-dep--move-concurrently-1.0.1.tgz
	https://registry.yarnpkg.com/@mrmlnc/readdir-enhanced/-/readdir-enhanced-2.2.1.tgz -> asar-dep-@mrmlnc-readdir-enhanced-2.2.1.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.0.0.tgz -> asar-dep--ms-2.0.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.1.tgz -> asar-dep--ms-2.1.1.tgz
	https://registry.yarnpkg.com/mute-stream/-/mute-stream-0.0.7.tgz -> asar-dep--mute-stream-0.0.7.tgz
	https://registry.yarnpkg.com/mute-stream/-/mute-stream-0.0.8.tgz -> asar-dep--mute-stream-0.0.8.tgz
	https://registry.yarnpkg.com/nanomatch/-/nanomatch-1.2.13.tgz -> asar-dep--nanomatch-1.2.13.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz -> asar-dep--natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.1.tgz -> asar-dep--neo-async-2.6.1.tgz
	https://registry.yarnpkg.com/nerf-dart/-/nerf-dart-1.0.0.tgz -> asar-dep--nerf-dart-1.0.0.tgz
	https://registry.yarnpkg.com/nice-try/-/nice-try-1.0.5.tgz -> asar-dep--nice-try-1.0.5.tgz
	https://registry.yarnpkg.com/node-emoji/-/node-emoji-1.10.0.tgz -> asar-dep--node-emoji-1.10.0.tgz
	https://registry.yarnpkg.com/node-environment-flags/-/node-environment-flags-1.0.6.tgz -> asar-dep--node-environment-flags-1.0.6.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.6.0.tgz -> asar-dep--node-fetch-2.6.0.tgz
	https://registry.yarnpkg.com/node-fetch-npm/-/node-fetch-npm-2.0.2.tgz -> asar-dep--node-fetch-npm-2.0.2.tgz
	https://registry.yarnpkg.com/node-gyp/-/node-gyp-5.0.5.tgz -> asar-dep--node-gyp-5.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.3.tgz -> asar-dep-@nodelib-fs.scandir-2.1.3.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-1.1.3.tgz -> asar-dep-@nodelib-fs.stat-1.1.3.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.3.tgz -> asar-dep-@nodelib-fs.stat-2.0.3.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.4.tgz -> asar-dep-@nodelib-fs.walk-1.2.4.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-3.0.6.tgz -> asar-dep--nopt-3.0.6.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-4.0.1.tgz -> asar-dep--nopt-4.0.1.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.4.0.tgz -> asar-dep--normalize-package-data-2.4.0.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.5.0.tgz -> asar-dep--normalize-package-data-2.5.0.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz -> asar-dep--normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-4.3.0.tgz -> asar-dep--normalize-url-4.3.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-5.0.0.tgz -> asar-dep--normalize-url-5.0.0.tgz
	https://registry.yarnpkg.com/npm-audit-report/-/npm-audit-report-1.3.2.tgz -> asar-dep--npm-audit-report-1.3.2.tgz
	https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-1.1.1.tgz -> asar-dep--npm-bundled-1.1.1.tgz
	https://registry.yarnpkg.com/npm-cache-filename/-/npm-cache-filename-1.0.2.tgz -> asar-dep--npm-cache-filename-1.0.2.tgz
	https://registry.yarnpkg.com/npm-install-checks/-/npm-install-checks-3.0.2.tgz -> asar-dep--npm-install-checks-3.0.2.tgz
	https://registry.yarnpkg.com/npm-lifecycle/-/npm-lifecycle-3.1.4.tgz -> asar-dep--npm-lifecycle-3.1.4.tgz
	https://registry.yarnpkg.com/npm-logical-tree/-/npm-logical-tree-1.2.1.tgz -> asar-dep--npm-logical-tree-1.2.1.tgz
	https://registry.yarnpkg.com/npmlog/-/npmlog-4.1.2.tgz -> asar-dep--npmlog-4.1.2.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-1.0.1.tgz -> asar-dep--npm-normalize-package-bin-1.0.1.tgz
	https://registry.yarnpkg.com/npm/-/npm-6.13.4.tgz -> asar-dep--npm-6.13.4.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-6.1.1.tgz -> asar-dep--npm-package-arg-6.1.1.tgz
	https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-1.4.7.tgz -> asar-dep--npm-packlist-1.4.7.tgz
	https://registry.yarnpkg.com/npm-pick-manifest/-/npm-pick-manifest-3.0.2.tgz -> asar-dep--npm-pick-manifest-3.0.2.tgz
	https://registry.yarnpkg.com/npm-profile/-/npm-profile-4.0.2.tgz -> asar-dep--npm-profile-4.0.2.tgz
	https://registry.yarnpkg.com/npm-registry-fetch/-/npm-registry-fetch-4.0.2.tgz -> asar-dep--npm-registry-fetch-4.0.2.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-2.0.2.tgz -> asar-dep--npm-run-path-2.0.2.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-4.0.1.tgz -> asar-dep--npm-run-path-4.0.1.tgz
	https://registry.yarnpkg.com/npm-user-validate/-/npm-user-validate-1.0.0.tgz -> asar-dep--npm-user-validate-1.0.0.tgz
	https://registry.yarnpkg.com/nugget/-/nugget-2.0.1.tgz -> asar-dep--nugget-2.0.1.tgz
	https://registry.yarnpkg.com/number-is-nan/-/number-is-nan-1.0.1.tgz -> asar-dep--number-is-nan-1.0.1.tgz
	https://registry.yarnpkg.com/oauth-sign/-/oauth-sign-0.9.0.tgz -> asar-dep--oauth-sign-0.9.0.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.0.tgz -> asar-dep--object.assign-4.1.0.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz -> asar-dep--object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object-copy/-/object-copy-0.1.0.tgz -> asar-dep--object-copy-0.1.0.tgz
	https://registry.yarnpkg.com/object.entries/-/object.entries-1.1.1.tgz -> asar-dep--object.entries-1.1.1.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.2.tgz -> asar-dep--object.fromentries-2.0.2.tgz
	https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.0.3.tgz -> asar-dep--object.getownpropertydescriptors-2.0.3.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.7.0.tgz -> asar-dep--object-inspect-1.7.0.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-0.4.0.tgz -> asar-dep--object-keys-0.4.0.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.0.tgz -> asar-dep--object-keys-1.1.0.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz -> asar-dep--object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.pick/-/object.pick-1.3.0.tgz -> asar-dep--object.pick-1.3.0.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.1.1.tgz -> asar-dep--object.values-1.1.1.tgz
	https://registry.yarnpkg.com/object-visit/-/object-visit-1.0.1.tgz -> asar-dep--object-visit-1.0.1.tgz
	https://registry.yarnpkg.com/@octokit/auth-token/-/auth-token-2.4.0.tgz -> asar-dep-@octokit-auth-token-2.4.0.tgz
	https://registry.yarnpkg.com/@octokit/endpoint/-/endpoint-5.5.2.tgz -> asar-dep-@octokit-endpoint-5.5.2.tgz
	https://registry.yarnpkg.com/octokit-pagination-methods/-/octokit-pagination-methods-1.1.0.tgz -> asar-dep--octokit-pagination-methods-1.1.0.tgz
	https://registry.yarnpkg.com/@octokit/plugin-paginate-rest/-/plugin-paginate-rest-1.1.2.tgz -> asar-dep-@octokit-plugin-paginate-rest-1.1.2.tgz
	https://registry.yarnpkg.com/@octokit/plugin-request-log/-/plugin-request-log-1.0.0.tgz -> asar-dep-@octokit-plugin-request-log-1.0.0.tgz
	https://registry.yarnpkg.com/@octokit/plugin-rest-endpoint-methods/-/plugin-rest-endpoint-methods-2.4.0.tgz -> asar-dep-@octokit-plugin-rest-endpoint-methods-2.4.0.tgz
	https://registry.yarnpkg.com/@octokit/request-error/-/request-error-1.2.1.tgz -> asar-dep-@octokit-request-error-1.2.1.tgz
	https://registry.yarnpkg.com/@octokit/request/-/request-5.3.1.tgz -> asar-dep-@octokit-request-5.3.1.tgz
	https://registry.yarnpkg.com/@octokit/rest/-/rest-16.43.1.tgz -> asar-dep-@octokit-rest-16.43.1.tgz
	https://registry.yarnpkg.com/@octokit/types/-/types-2.1.1.tgz -> asar-dep-@octokit-types-2.1.1.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz -> asar-dep--once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.0.tgz -> asar-dep--onetime-5.1.0.tgz
	https://registry.yarnpkg.com/opener/-/opener-1.5.1.tgz -> asar-dep--opener-1.5.1.tgz
	https://registry.yarnpkg.com/optimist/-/optimist-0.6.1.tgz -> asar-dep--optimist-0.6.1.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.8.3.tgz -> asar-dep--optionator-0.8.3.tgz
	https://registry.yarnpkg.com/osenv/-/osenv-0.1.5.tgz -> asar-dep--osenv-0.1.5.tgz
	https://registry.yarnpkg.com/os-homedir/-/os-homedir-1.0.2.tgz -> asar-dep--os-homedir-1.0.2.tgz
	https://registry.yarnpkg.com/os-locale/-/os-locale-2.1.0.tgz -> asar-dep--os-locale-2.1.0.tgz
	https://registry.yarnpkg.com/os-name/-/os-name-3.1.0.tgz -> asar-dep--os-name-3.1.0.tgz
	https://registry.yarnpkg.com/os-tmpdir/-/os-tmpdir-1.0.2.tgz -> asar-dep--os-tmpdir-1.0.2.tgz
	https://registry.yarnpkg.com/package-json/-/package-json-4.0.1.tgz -> asar-dep--package-json-4.0.1.tgz
	https://registry.yarnpkg.com/pacote/-/pacote-9.5.11.tgz -> asar-dep--pacote-9.5.11.tgz
	https://registry.yarnpkg.com/parallel-transform/-/parallel-transform-1.1.0.tgz -> asar-dep--parallel-transform-1.1.0.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz -> asar-dep--parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-2.2.0.tgz -> asar-dep--parse-json-2.2.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-4.0.0.tgz -> asar-dep--parse-json-4.0.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.0.0.tgz -> asar-dep--parse-json-5.0.0.tgz
	https://registry.yarnpkg.com/pascalcase/-/pascalcase-0.1.1.tgz -> asar-dep--pascalcase-0.1.1.tgz
	https://registry.yarnpkg.com/path-dirname/-/path-dirname-1.0.2.tgz -> asar-dep--path-dirname-1.0.2.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-2.1.0.tgz -> asar-dep--path-exists-2.1.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-3.0.0.tgz -> asar-dep--path-exists-3.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz -> asar-dep--path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz -> asar-dep--path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-is-inside/-/path-is-inside-1.0.2.tgz -> asar-dep--path-is-inside-1.0.2.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-2.0.1.tgz -> asar-dep--path-key-2.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz -> asar-dep--path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.6.tgz -> asar-dep--path-parse-1.0.6.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-1.1.0.tgz -> asar-dep--path-type-1.1.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-2.0.0.tgz -> asar-dep--path-type-2.0.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-3.0.0.tgz -> asar-dep--path-type-3.0.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-4.0.0.tgz -> asar-dep--path-type-4.0.0.tgz
	https://registry.yarnpkg.com/p-each-series/-/p-each-series-2.1.0.tgz -> asar-dep--p-each-series-2.1.0.tgz
	https://registry.yarnpkg.com/pend/-/pend-1.2.0.tgz -> asar-dep--pend-1.2.0.tgz
	https://registry.yarnpkg.com/performance-now/-/performance-now-2.1.0.tgz -> asar-dep--performance-now-2.1.0.tgz
	https://registry.yarnpkg.com/p-filter/-/p-filter-2.1.0.tgz -> asar-dep--p-filter-2.1.0.tgz
	https://registry.yarnpkg.com/p-finally/-/p-finally-1.0.0.tgz -> asar-dep--p-finally-1.0.0.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.2.1.tgz -> asar-dep--picomatch-2.2.1.tgz
	https://registry.yarnpkg.com/pify/-/pify-2.3.0.tgz -> asar-dep--pify-2.3.0.tgz
	https://registry.yarnpkg.com/pify/-/pify-3.0.0.tgz -> asar-dep--pify-3.0.0.tgz
	https://registry.yarnpkg.com/pify/-/pify-4.0.1.tgz -> asar-dep--pify-4.0.1.tgz
	https://registry.yarnpkg.com/pinkie/-/pinkie-2.0.4.tgz -> asar-dep--pinkie-2.0.4.tgz
	https://registry.yarnpkg.com/pinkie-promise/-/pinkie-promise-2.0.1.tgz -> asar-dep--pinkie-promise-2.0.1.tgz
	https://registry.yarnpkg.com/p-is-promise/-/p-is-promise-3.0.0.tgz -> asar-dep--p-is-promise-3.0.0.tgz
	https://registry.yarnpkg.com/pkg-config/-/pkg-config-1.1.1.tgz -> asar-dep--pkg-config-1.1.1.tgz
	https://registry.yarnpkg.com/pkg-conf/-/pkg-conf-2.1.0.tgz -> asar-dep--pkg-conf-2.1.0.tgz
	https://registry.yarnpkg.com/pkg-conf/-/pkg-conf-3.1.0.tgz -> asar-dep--pkg-conf-3.1.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-2.0.0.tgz -> asar-dep--pkg-dir-2.0.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-1.3.0.tgz -> asar-dep--p-limit-1.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.2.2.tgz -> asar-dep--p-limit-2.2.2.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-2.0.0.tgz -> asar-dep--p-locate-2.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-3.0.0.tgz -> asar-dep--p-locate-3.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz -> asar-dep--p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/plur/-/plur-2.1.2.tgz -> asar-dep--plur-2.1.2.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-2.1.0.tgz -> asar-dep--p-map-2.1.0.tgz
	https://registry.yarnpkg.com/posix-character-classes/-/posix-character-classes-0.1.1.tgz -> asar-dep--posix-character-classes-0.1.1.tgz
	https://registry.yarnpkg.com/p-reduce/-/p-reduce-2.1.0.tgz -> asar-dep--p-reduce-2.1.0.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.1.2.tgz -> asar-dep--prelude-ls-1.1.2.tgz
	https://registry.yarnpkg.com/prepend-http/-/prepend-http-1.0.4.tgz -> asar-dep--prepend-http-1.0.4.tgz
	https://registry.yarnpkg.com/p-retry/-/p-retry-4.2.0.tgz -> asar-dep--p-retry-4.2.0.tgz
	https://registry.yarnpkg.com/pretty-bytes/-/pretty-bytes-1.0.4.tgz -> asar-dep--pretty-bytes-1.0.4.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.0.tgz -> asar-dep--process-nextick-args-2.0.0.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz -> asar-dep--progress-2.0.3.tgz
	https://registry.yarnpkg.com/progress-stream/-/progress-stream-1.2.0.tgz -> asar-dep--progress-stream-1.2.0.tgz
	https://registry.yarnpkg.com/promise-inflight/-/promise-inflight-1.0.1.tgz -> asar-dep--promise-inflight-1.0.1.tgz
	https://registry.yarnpkg.com/promise-retry/-/promise-retry-1.1.1.tgz -> asar-dep--promise-retry-1.1.1.tgz
	https://registry.yarnpkg.com/promzard/-/promzard-0.3.0.tgz -> asar-dep--promzard-0.3.0.tgz
	https://registry.yarnpkg.com/prop-types/-/prop-types-15.7.2.tgz -> asar-dep--prop-types-15.7.2.tgz
	https://registry.yarnpkg.com/protoduck/-/protoduck-5.0.1.tgz -> asar-dep--protoduck-5.0.1.tgz
	https://registry.yarnpkg.com/proto-list/-/proto-list-1.2.4.tgz -> asar-dep--proto-list-1.2.4.tgz
	https://registry.yarnpkg.com/prr/-/prr-1.0.1.tgz -> asar-dep--prr-1.0.1.tgz
	https://registry.yarnpkg.com/pseudomap/-/pseudomap-1.0.2.tgz -> asar-dep--pseudomap-1.0.2.tgz
	https://registry.yarnpkg.com/psl/-/psl-1.1.29.tgz -> asar-dep--psl-1.1.29.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-1.0.0.tgz -> asar-dep--p-try-1.0.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz -> asar-dep--p-try-2.2.0.tgz
	https://registry.yarnpkg.com/pumpify/-/pumpify-1.5.1.tgz -> asar-dep--pumpify-1.5.1.tgz
	https://registry.yarnpkg.com/pump/-/pump-2.0.1.tgz -> asar-dep--pump-2.0.1.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.0.tgz -> asar-dep--pump-3.0.0.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-1.4.1.tgz -> asar-dep--punycode-1.4.1.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.1.1.tgz -> asar-dep--punycode-2.1.1.tgz
	https://registry.yarnpkg.com/q/-/q-1.5.1.tgz -> asar-dep--q-1.5.1.tgz
	https://registry.yarnpkg.com/qrcode-terminal/-/qrcode-terminal-0.12.0.tgz -> asar-dep--qrcode-terminal-0.12.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.5.2.tgz -> asar-dep--qs-6.5.2.tgz
	https://registry.yarnpkg.com/query-string/-/query-string-6.8.2.tgz -> asar-dep--query-string-6.8.2.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-1.1.0.tgz -> asar-dep--quick-lru-1.1.0.tgz
	https://registry.yarnpkg.com/qw/-/qw-1.0.1.tgz -> asar-dep--qw-1.0.1.tgz
	https://registry.yarnpkg.com/rc/-/rc-1.2.8.tgz -> asar-dep--rc-1.2.8.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-16.13.1.tgz -> asar-dep--react-is-16.13.1.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-1.1.14.tgz -> asar-dep--readable-stream-1.1.14.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.6.tgz -> asar-dep--readable-stream-2.3.6.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.7.tgz -> asar-dep--readable-stream-2.3.7.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.4.0.tgz -> asar-dep--readable-stream-3.4.0.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.0.tgz -> asar-dep--readable-stream-3.6.0.tgz
	https://registry.yarnpkg.com/read-cmd-shim/-/read-cmd-shim-1.0.5.tgz -> asar-dep--read-cmd-shim-1.0.5.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.2.0.tgz -> asar-dep--readdirp-3.2.0.tgz
	https://registry.yarnpkg.com/readdir-scoped-modules/-/readdir-scoped-modules-1.1.0.tgz -> asar-dep--readdir-scoped-modules-1.1.0.tgz
	https://registry.yarnpkg.com/read-installed/-/read-installed-4.0.3.tgz -> asar-dep--read-installed-4.0.3.tgz
	https://registry.yarnpkg.com/read-package-json/-/read-package-json-2.1.1.tgz -> asar-dep--read-package-json-2.1.1.tgz
	https://registry.yarnpkg.com/read-package-tree/-/read-package-tree-5.3.1.tgz -> asar-dep--read-package-tree-5.3.1.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-1.1.0.tgz -> asar-dep--read-pkg-1.1.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-2.0.0.tgz -> asar-dep--read-pkg-2.0.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-3.0.0.tgz -> asar-dep--read-pkg-3.0.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-4.0.1.tgz -> asar-dep--read-pkg-4.0.1.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-5.2.0.tgz -> asar-dep--read-pkg-5.2.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-1.0.1.tgz -> asar-dep--read-pkg-up-1.0.1.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-2.0.0.tgz -> asar-dep--read-pkg-up-2.0.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-3.0.0.tgz -> asar-dep--read-pkg-up-3.0.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-4.0.0.tgz -> asar-dep--read-pkg-up-4.0.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-7.0.1.tgz -> asar-dep--read-pkg-up-7.0.1.tgz
	https://registry.yarnpkg.com/read/-/read-1.0.7.tgz -> asar-dep--read-1.0.7.tgz
	https://registry.yarnpkg.com/redent/-/redent-1.0.0.tgz -> asar-dep--redent-1.0.0.tgz
	https://registry.yarnpkg.com/redent/-/redent-2.0.0.tgz -> asar-dep--redent-2.0.0.tgz
	https://registry.yarnpkg.com/redeyed/-/redeyed-2.1.1.tgz -> asar-dep--redeyed-2.1.1.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.13.3.tgz -> asar-dep--regenerator-runtime-0.13.3.tgz
	https://registry.yarnpkg.com/regex-not/-/regex-not-1.0.2.tgz -> asar-dep--regex-not-1.0.2.tgz
	https://registry.yarnpkg.com/regexpp/-/regexpp-2.0.1.tgz -> asar-dep--regexpp-2.0.1.tgz
	https://registry.yarnpkg.com/regexpp/-/regexpp-3.0.0.tgz -> asar-dep--regexpp-3.0.0.tgz
	https://registry.yarnpkg.com/registry-auth-token/-/registry-auth-token-3.4.0.tgz -> asar-dep--registry-auth-token-3.4.0.tgz
	https://registry.yarnpkg.com/registry-auth-token/-/registry-auth-token-4.1.1.tgz -> asar-dep--registry-auth-token-4.1.1.tgz
	https://registry.yarnpkg.com/registry-url/-/registry-url-3.1.0.tgz -> asar-dep--registry-url-3.1.0.tgz
	https://registry.yarnpkg.com/repeat-element/-/repeat-element-1.1.3.tgz -> asar-dep--repeat-element-1.1.3.tgz
	https://registry.yarnpkg.com/repeating/-/repeating-2.0.1.tgz -> asar-dep--repeating-2.0.1.tgz
	https://registry.yarnpkg.com/repeat-string/-/repeat-string-1.6.1.tgz -> asar-dep--repeat-string-1.6.1.tgz
	https://registry.yarnpkg.com/request/-/request-2.88.0.tgz -> asar-dep--request-2.88.0.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz -> asar-dep--require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-main-filename/-/require-main-filename-1.0.1.tgz -> asar-dep--require-main-filename-1.0.1.tgz
	https://registry.yarnpkg.com/require-main-filename/-/require-main-filename-2.0.0.tgz -> asar-dep--require-main-filename-2.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz -> asar-dep--resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz -> asar-dep--resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.10.0.tgz -> asar-dep--resolve-1.10.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.15.1.tgz -> asar-dep--resolve-1.15.1.tgz
	https://registry.yarnpkg.com/resolve-url/-/resolve-url-0.2.1.tgz -> asar-dep--resolve-url-0.2.1.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-3.1.0.tgz -> asar-dep--restore-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/ret/-/ret-0.1.15.tgz -> asar-dep--ret-0.1.15.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.10.1.tgz -> asar-dep--retry-0.10.1.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz -> asar-dep--retry-0.12.0.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.0.4.tgz -> asar-dep--reusify-1.0.4.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.6.3.tgz -> asar-dep--rimraf-2.6.3.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz -> asar-dep--rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/run-async/-/run-async-2.4.0.tgz -> asar-dep--run-async-2.4.0.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.1.9.tgz -> asar-dep--run-parallel-1.1.9.tgz
	https://registry.yarnpkg.com/run-queue/-/run-queue-1.0.3.tgz -> asar-dep--run-queue-1.0.3.tgz
	https://registry.yarnpkg.com/rxjs/-/rxjs-6.5.4.tgz -> asar-dep--rxjs-6.5.4.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz -> asar-dep--safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.0.tgz -> asar-dep--safe-buffer-5.2.0.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz -> asar-dep--safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/safe-regex/-/safe-regex-1.1.0.tgz -> asar-dep--safe-regex-1.1.0.tgz
	https://registry.yarnpkg.com/@semantic-release/changelog/-/changelog-5.0.0.tgz -> asar-dep-@semantic-release-changelog-5.0.0.tgz
	https://registry.yarnpkg.com/@semantic-release/commit-analyzer/-/commit-analyzer-8.0.1.tgz -> asar-dep-@semantic-release-commit-analyzer-8.0.1.tgz
	https://registry.yarnpkg.com/@semantic-release/error/-/error-2.2.0.tgz -> asar-dep-@semantic-release-error-2.2.0.tgz
	https://registry.yarnpkg.com/@semantic-release/github/-/github-7.0.3.tgz -> asar-dep-@semantic-release-github-7.0.3.tgz
	https://registry.yarnpkg.com/@semantic-release/npm/-/npm-7.0.3.tgz -> asar-dep-@semantic-release-npm-7.0.3.tgz
	https://registry.yarnpkg.com/@semantic-release/release-notes-generator/-/release-notes-generator-9.0.0.tgz -> asar-dep-@semantic-release-release-notes-generator-9.0.0.tgz
	https://registry.yarnpkg.com/semantic-release/-/semantic-release-17.0.4.tgz -> asar-dep--semantic-release-17.0.4.tgz
	https://registry.yarnpkg.com/semver-diff/-/semver-diff-2.1.0.tgz -> asar-dep--semver-diff-2.1.0.tgz
	https://registry.yarnpkg.com/semver-diff/-/semver-diff-3.1.1.tgz -> asar-dep--semver-diff-3.1.1.tgz
	https://registry.yarnpkg.com/semver-regex/-/semver-regex-2.0.0.tgz -> asar-dep--semver-regex-2.0.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.3.0.tgz -> asar-dep--semver-5.3.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.6.0.tgz -> asar-dep--semver-5.6.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.1.tgz -> asar-dep--semver-5.7.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.0.tgz -> asar-dep--semver-6.3.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.1.3.tgz -> asar-dep--semver-7.1.3.tgz
	https://registry.yarnpkg.com/set-blocking/-/set-blocking-2.0.0.tgz -> asar-dep--set-blocking-2.0.0.tgz
	https://registry.yarnpkg.com/set-value/-/set-value-0.4.3.tgz -> asar-dep--set-value-0.4.3.tgz
	https://registry.yarnpkg.com/set-value/-/set-value-2.0.0.tgz -> asar-dep--set-value-2.0.0.tgz
	https://registry.yarnpkg.com/sha/-/sha-3.0.0.tgz -> asar-dep--sha-3.0.0.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-1.2.0.tgz -> asar-dep--shebang-command-1.2.0.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz -> asar-dep--shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-1.0.0.tgz -> asar-dep--shebang-regex-1.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz -> asar-dep--shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/signale/-/signale-1.4.0.tgz -> asar-dep--signale-1.4.0.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.2.tgz -> asar-dep--signal-exit-3.0.2.tgz
	https://registry.yarnpkg.com/single-line-log/-/single-line-log-1.1.2.tgz -> asar-dep--single-line-log-1.1.2.tgz
	https://registry.yarnpkg.com/slash/-/slash-2.0.0.tgz -> asar-dep--slash-2.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-3.0.0.tgz -> asar-dep--slash-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-2.1.0.tgz -> asar-dep--slice-ansi-2.1.0.tgz
	https://registry.yarnpkg.com/slide/-/slide-1.1.6.tgz -> asar-dep--slide-1.1.6.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.1.0.tgz -> asar-dep--smart-buffer-4.1.0.tgz
	https://registry.yarnpkg.com/snapdragon-node/-/snapdragon-node-2.1.1.tgz -> asar-dep--snapdragon-node-2.1.1.tgz
	https://registry.yarnpkg.com/snapdragon/-/snapdragon-0.8.2.tgz -> asar-dep--snapdragon-0.8.2.tgz
	https://registry.yarnpkg.com/snapdragon-util/-/snapdragon-util-3.0.1.tgz -> asar-dep--snapdragon-util-3.0.1.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-4.0.2.tgz -> asar-dep--socks-proxy-agent-4.0.2.tgz
	https://registry.yarnpkg.com/socks/-/socks-2.3.3.tgz -> asar-dep--socks-2.3.3.tgz
	https://registry.yarnpkg.com/sorted-object/-/sorted-object-2.0.1.tgz -> asar-dep--sorted-object-2.0.1.tgz
	https://registry.yarnpkg.com/sorted-union-stream/-/sorted-union-stream-2.1.3.tgz -> asar-dep--sorted-union-stream-2.1.3.tgz
	https://registry.yarnpkg.com/source-map-resolve/-/source-map-resolve-0.5.2.tgz -> asar-dep--source-map-resolve-0.5.2.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.5.7.tgz -> asar-dep--source-map-0.5.7.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz -> asar-dep--source-map-0.6.1.tgz
	https://registry.yarnpkg.com/source-map-url/-/source-map-url-0.4.0.tgz -> asar-dep--source-map-url-0.4.0.tgz
	https://registry.yarnpkg.com/spawn-error-forwarder/-/spawn-error-forwarder-1.0.0.tgz -> asar-dep--spawn-error-forwarder-1.0.0.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.0.0.tgz -> asar-dep--spdx-correct-3.0.0.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.1.0.tgz -> asar-dep--spdx-exceptions-2.1.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.0.tgz -> asar-dep--spdx-expression-parse-3.0.0.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.3.tgz -> asar-dep--spdx-license-ids-3.0.3.tgz
	https://registry.yarnpkg.com/speedometer/-/speedometer-0.1.4.tgz -> asar-dep--speedometer-0.1.4.tgz
	https://registry.yarnpkg.com/split2/-/split2-1.0.0.tgz -> asar-dep--split2-1.0.0.tgz
	https://registry.yarnpkg.com/split2/-/split2-2.2.0.tgz -> asar-dep--split2-2.2.0.tgz
	https://registry.yarnpkg.com/split-on-first/-/split-on-first-1.1.0.tgz -> asar-dep--split-on-first-1.1.0.tgz
	https://registry.yarnpkg.com/split/-/split-1.0.1.tgz -> asar-dep--split-1.0.1.tgz
	https://registry.yarnpkg.com/split-string/-/split-string-3.1.0.tgz -> asar-dep--split-string-3.1.0.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz -> asar-dep--sprintf-js-1.0.3.tgz
	https://registry.yarnpkg.com/sshpk/-/sshpk-1.14.2.tgz -> asar-dep--sshpk-1.14.2.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-6.0.1.tgz -> asar-dep--ssri-6.0.1.tgz
	https://registry.yarnpkg.com/standard-engine/-/standard-engine-12.0.0.tgz -> asar-dep--standard-engine-12.0.0.tgz
	https://registry.yarnpkg.com/standard/-/standard-14.3.3.tgz -> asar-dep--standard-14.3.3.tgz
	https://registry.yarnpkg.com/static-extend/-/static-extend-0.1.2.tgz -> asar-dep--static-extend-0.1.2.tgz
	https://registry.yarnpkg.com/stream-combiner2/-/stream-combiner2-1.1.1.tgz -> asar-dep--stream-combiner2-1.1.1.tgz
	https://registry.yarnpkg.com/stream-each/-/stream-each-1.2.2.tgz -> asar-dep--stream-each-1.2.2.tgz
	https://registry.yarnpkg.com/stream-iterate/-/stream-iterate-1.2.0.tgz -> asar-dep--stream-iterate-1.2.0.tgz
	https://registry.yarnpkg.com/stream-shift/-/stream-shift-1.0.0.tgz -> asar-dep--stream-shift-1.0.0.tgz
	https://registry.yarnpkg.com/strict-uri-encode/-/strict-uri-encode-2.0.0.tgz -> asar-dep--strict-uri-encode-2.0.0.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-0.10.31.tgz -> asar-dep--string_decoder-0.10.31.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz -> asar-dep--string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz -> asar-dep--string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/stringify-package/-/stringify-package-1.0.1.tgz -> asar-dep--stringify-package-1.0.1.tgz
	https://registry.yarnpkg.com/string.prototype.trimleft/-/string.prototype.trimleft-2.1.1.tgz -> asar-dep--string.prototype.trimleft-2.1.1.tgz
	https://registry.yarnpkg.com/string.prototype.trimright/-/string.prototype.trimright-2.1.1.tgz -> asar-dep--string.prototype.trimright-2.1.1.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-1.0.2.tgz -> asar-dep--string-width-1.0.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-2.1.1.tgz -> asar-dep--string-width-2.1.1.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-3.1.0.tgz -> asar-dep--string-width-3.1.0.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.0.tgz -> asar-dep--string-width-4.2.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz -> asar-dep--strip-ansi-3.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-4.0.0.tgz -> asar-dep--strip-ansi-4.0.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-5.2.0.tgz -> asar-dep--strip-ansi-5.2.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.0.tgz -> asar-dep--strip-ansi-6.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-2.0.0.tgz -> asar-dep--strip-bom-2.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz -> asar-dep--strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-eof/-/strip-eof-1.0.0.tgz -> asar-dep--strip-eof-1.0.0.tgz
	https://registry.yarnpkg.com/strip-final-newline/-/strip-final-newline-2.0.0.tgz -> asar-dep--strip-final-newline-2.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-1.0.1.tgz -> asar-dep--strip-indent-1.0.1.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-2.0.0.tgz -> asar-dep--strip-indent-2.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-2.0.1.tgz -> asar-dep--strip-json-comments-2.0.1.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.0.1.tgz -> asar-dep--strip-json-comments-3.0.1.tgz
	https://registry.yarnpkg.com/sumchecker/-/sumchecker-2.0.2.tgz -> asar-dep--sumchecker-2.0.2.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.4.0.tgz -> asar-dep--supports-color-5.4.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-6.0.0.tgz -> asar-dep--supports-color-6.0.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.1.0.tgz -> asar-dep--supports-color-7.1.0.tgz
	https://registry.yarnpkg.com/supports-hyperlinks/-/supports-hyperlinks-2.1.0.tgz -> asar-dep--supports-hyperlinks-2.1.0.tgz
	https://registry.yarnpkg.com/table/-/table-5.4.6.tgz -> asar-dep--table-5.4.6.tgz
	https://registry.yarnpkg.com/tar/-/tar-4.4.15.tgz -> asar-dep--tar-4.4.15.tgz
	https://registry.yarnpkg.com/temp-dir/-/temp-dir-2.0.0.tgz -> asar-dep--temp-dir-2.0.0.tgz
	https://registry.yarnpkg.com/tempy/-/tempy-0.4.0.tgz -> asar-dep--tempy-0.4.0.tgz
	https://registry.yarnpkg.com/term-size/-/term-size-1.2.0.tgz -> asar-dep--term-size-1.2.0.tgz
	https://registry.yarnpkg.com/text-extensions/-/text-extensions-1.9.0.tgz -> asar-dep--text-extensions-1.9.0.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz -> asar-dep--text-table-0.2.0.tgz
	https://registry.yarnpkg.com/throttleit/-/throttleit-0.0.2.tgz -> asar-dep--throttleit-0.0.2.tgz
	https://registry.yarnpkg.com/through2/-/through2-0.2.3.tgz -> asar-dep--through2-0.2.3.tgz
	https://registry.yarnpkg.com/through2/-/through2-2.0.3.tgz -> asar-dep--through2-2.0.3.tgz
	https://registry.yarnpkg.com/through2/-/through2-2.0.5.tgz -> asar-dep--through2-2.0.5.tgz
	https://registry.yarnpkg.com/through2/-/through2-3.0.1.tgz -> asar-dep--through2-3.0.1.tgz
	https://registry.yarnpkg.com/through/-/through-2.3.8.tgz -> asar-dep--through-2.3.8.tgz
	https://registry.yarnpkg.com/timed-out/-/timed-out-4.0.1.tgz -> asar-dep--timed-out-4.0.1.tgz
	https://registry.yarnpkg.com/tiny-relative-date/-/tiny-relative-date-1.3.0.tgz -> asar-dep--tiny-relative-date-1.3.0.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.0.33.tgz -> asar-dep--tmp-0.0.33.tgz
	https://registry.yarnpkg.com/to-object-path/-/to-object-path-0.3.0.tgz -> asar-dep--to-object-path-0.3.0.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-1.0.0.tgz -> asar-dep-@tootallnate-once-1.0.0.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-2.1.1.tgz -> asar-dep--to-regex-range-2.1.1.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz -> asar-dep--to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/to-regex/-/to-regex-3.0.2.tgz -> asar-dep--to-regex-3.0.2.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-2.4.3.tgz -> asar-dep--tough-cookie-2.4.3.tgz
	https://registry.yarnpkg.com/traverse/-/traverse-0.6.6.tgz -> asar-dep--traverse-0.6.6.tgz
	https://registry.yarnpkg.com/trim-newlines/-/trim-newlines-1.0.0.tgz -> asar-dep--trim-newlines-1.0.0.tgz
	https://registry.yarnpkg.com/trim-newlines/-/trim-newlines-2.0.0.tgz -> asar-dep--trim-newlines-2.0.0.tgz
	https://registry.yarnpkg.com/trim-off-newlines/-/trim-off-newlines-1.0.1.tgz -> asar-dep--trim-off-newlines-1.0.1.tgz
	https://registry.yarnpkg.com/tsd/-/tsd-0.11.0.tgz -> asar-dep--tsd-0.11.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.11.1.tgz -> asar-dep--tslib-1.11.1.tgz
	https://registry.yarnpkg.com/tunnel-agent/-/tunnel-agent-0.6.0.tgz -> asar-dep--tunnel-agent-0.6.0.tgz
	https://registry.yarnpkg.com/tweetnacl/-/tweetnacl-0.14.5.tgz -> asar-dep--tweetnacl-0.14.5.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.3.2.tgz -> asar-dep--type-check-0.3.2.tgz
	https://registry.yarnpkg.com/typedarray/-/typedarray-0.0.6.tgz -> asar-dep--typedarray-0.0.6.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.10.0.tgz -> asar-dep--type-fest-0.10.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.11.0.tgz -> asar-dep--type-fest-0.11.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.3.1.tgz -> asar-dep--type-fest-0.3.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.6.0.tgz -> asar-dep--type-fest-0.6.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.8.1.tgz -> asar-dep--type-fest-0.8.1.tgz
	https://registry.yarnpkg.com/@types/color-name/-/color-name-1.1.1.tgz -> asar-dep-@types-color-name-1.1.1.tgz
	https://registry.yarnpkg.com/@types/events/-/events-3.0.0.tgz -> asar-dep-@types-events-3.0.0.tgz
	https://registry.yarnpkg.com/@types/glob/-/glob-7.1.1.tgz -> asar-dep-@types-glob-7.1.1.tgz
	https://registry.yarnpkg.com/@types/minimatch/-/minimatch-3.0.3.tgz -> asar-dep-@types-minimatch-3.0.3.tgz
	https://registry.yarnpkg.com/@types/node/-/node-10.12.26.tgz -> asar-dep-@types-node-10.12.26.tgz
	https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.0.tgz -> asar-dep-@types-normalize-package-data-2.4.0.tgz
	https://registry.yarnpkg.com/@types/parse-json/-/parse-json-4.0.0.tgz -> asar-dep-@types-parse-json-4.0.0.tgz
	https://registry.yarnpkg.com/@types/retry/-/retry-0.12.0.tgz -> asar-dep-@types-retry-0.12.0.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-3.8.0.tgz -> asar-dep--uglify-js-3.8.0.tgz
	https://registry.yarnpkg.com/uid-number/-/uid-number-0.0.6.tgz -> asar-dep--uid-number-0.0.6.tgz
	https://registry.yarnpkg.com/umask/-/umask-1.1.0.tgz -> asar-dep--umask-1.1.0.tgz
	https://registry.yarnpkg.com/union-value/-/union-value-1.0.0.tgz -> asar-dep--union-value-1.0.0.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-1.1.1.tgz -> asar-dep--unique-filename-1.1.1.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-2.0.0.tgz -> asar-dep--unique-slug-2.0.0.tgz
	https://registry.yarnpkg.com/unique-string/-/unique-string-1.0.0.tgz -> asar-dep--unique-string-1.0.0.tgz
	https://registry.yarnpkg.com/unique-string/-/unique-string-2.0.0.tgz -> asar-dep--unique-string-2.0.0.tgz
	https://registry.yarnpkg.com/uniq/-/uniq-1.0.1.tgz -> asar-dep--uniq-1.0.1.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz -> asar-dep--universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universal-user-agent/-/universal-user-agent-4.0.0.tgz -> asar-dep--universal-user-agent-4.0.0.tgz
	https://registry.yarnpkg.com/unpipe/-/unpipe-1.0.0.tgz -> asar-dep--unpipe-1.0.0.tgz
	https://registry.yarnpkg.com/unset-value/-/unset-value-1.0.0.tgz -> asar-dep--unset-value-1.0.0.tgz
	https://registry.yarnpkg.com/unzip-response/-/unzip-response-2.0.1.tgz -> asar-dep--unzip-response-2.0.1.tgz
	https://registry.yarnpkg.com/update-notifier/-/update-notifier-2.5.0.tgz -> asar-dep--update-notifier-2.5.0.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.2.2.tgz -> asar-dep--uri-js-4.2.2.tgz
	https://registry.yarnpkg.com/urix/-/urix-0.1.0.tgz -> asar-dep--urix-0.1.0.tgz
	https://registry.yarnpkg.com/url-join/-/url-join-4.0.1.tgz -> asar-dep--url-join-4.0.1.tgz
	https://registry.yarnpkg.com/url-parse-lax/-/url-parse-lax-1.0.0.tgz -> asar-dep--url-parse-lax-1.0.0.tgz
	https://registry.yarnpkg.com/use/-/use-3.1.1.tgz -> asar-dep--use-3.1.1.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz -> asar-dep--util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/util-extend/-/util-extend-1.0.3.tgz -> asar-dep--util-extend-1.0.3.tgz
	https://registry.yarnpkg.com/util-promisify/-/util-promisify-2.1.0.tgz -> asar-dep--util-promisify-2.1.0.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-3.3.3.tgz -> asar-dep--uuid-3.3.3.tgz
	https://registry.yarnpkg.com/v8-compile-cache/-/v8-compile-cache-2.1.0.tgz -> asar-dep--v8-compile-cache-2.1.0.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz -> asar-dep--validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/validate-npm-package-name/-/validate-npm-package-name-3.0.0.tgz -> asar-dep--validate-npm-package-name-3.0.0.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.10.0.tgz -> asar-dep--verror-1.10.0.tgz
	https://registry.yarnpkg.com/wcwidth/-/wcwidth-1.0.1.tgz -> asar-dep--wcwidth-1.0.1.tgz
	https://registry.yarnpkg.com/which-module/-/which-module-2.0.0.tgz -> asar-dep--which-module-2.0.0.tgz
	https://registry.yarnpkg.com/which/-/which-1.3.1.tgz -> asar-dep--which-1.3.1.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz -> asar-dep--which-2.0.2.tgz
	https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.2.tgz -> asar-dep--wide-align-1.1.2.tgz
	https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.3.tgz -> asar-dep--wide-align-1.1.3.tgz
	https://registry.yarnpkg.com/widest-line/-/widest-line-2.0.1.tgz -> asar-dep--widest-line-2.0.1.tgz
	https://registry.yarnpkg.com/windows-release/-/windows-release-3.2.0.tgz -> asar-dep--windows-release-3.2.0.tgz
	https://registry.yarnpkg.com/wordwrap/-/wordwrap-0.0.3.tgz -> asar-dep--wordwrap-0.0.3.tgz
	https://registry.yarnpkg.com/word-wrap/-/word-wrap-1.2.3.tgz -> asar-dep--word-wrap-1.2.3.tgz
	https://registry.yarnpkg.com/worker-farm/-/worker-farm-1.7.0.tgz -> asar-dep--worker-farm-1.7.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-2.1.0.tgz -> asar-dep--wrap-ansi-2.1.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-5.1.0.tgz -> asar-dep--wrap-ansi-5.1.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-6.2.0.tgz -> asar-dep--wrap-ansi-6.2.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz -> asar-dep--wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-2.4.3.tgz -> asar-dep--write-file-atomic-2.4.3.tgz
	https://registry.yarnpkg.com/write/-/write-1.0.3.tgz -> asar-dep--write-1.0.3.tgz
	https://registry.yarnpkg.com/xdg-basedir/-/xdg-basedir-3.0.0.tgz -> asar-dep--xdg-basedir-3.0.0.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-2.1.2.tgz -> asar-dep--xtend-2.1.2.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.1.tgz -> asar-dep--xtend-4.0.1.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz -> asar-dep--xtend-4.0.2.tgz
	https://registry.yarnpkg.com/xvfb-maybe/-/xvfb-maybe-0.2.1.tgz -> asar-dep--xvfb-maybe-0.2.1.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-3.2.1.tgz -> asar-dep--y18n-3.2.1.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-4.0.0.tgz -> asar-dep--y18n-4.0.0.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-2.1.2.tgz -> asar-dep--yallist-2.1.2.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.0.3.tgz -> asar-dep--yallist-3.0.3.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.1.1.tgz -> asar-dep--yallist-3.1.1.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-1.7.2.tgz -> asar-dep--yaml-1.7.2.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-10.1.0.tgz -> asar-dep--yargs-parser-10.1.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-13.1.1.tgz -> asar-dep--yargs-parser-13.1.1.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-13.1.2.tgz -> asar-dep--yargs-parser-13.1.2.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-16.1.0.tgz -> asar-dep--yargs-parser-16.1.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-9.0.2.tgz -> asar-dep--yargs-parser-9.0.2.tgz
	https://registry.yarnpkg.com/yargs-unparser/-/yargs-unparser-1.6.0.tgz -> asar-dep--yargs-unparser-1.6.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-11.0.0.tgz -> asar-dep--yargs-11.0.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-13.3.0.tgz -> asar-dep--yargs-13.3.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-13.3.2.tgz -> asar-dep--yargs-13.3.2.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-15.1.0.tgz -> asar-dep--yargs-15.1.0.tgz
	https://registry.yarnpkg.com/yauzl/-/yauzl-2.4.1.tgz -> asar-dep--yauzl-2.4.1.tgz
"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	!net-im/discord-bin
"
BDEPEND="
	sys-apps/yarn
"

# libXScrnSaver is used through dlopen (bug #825370)
RDEPEND="
	app-accessibility/at-spi2-atk:2
	app-accessibility/at-spi2-core:2
	dev-libs/atk
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	dev-util/electron
	media-libs/alsa-lib
	media-libs/mesa[gbm(+)]
	net-print/cups
	sys-apps/dbus
	sys-libs/glibc
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libdrm
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/libxshmfence
	x11-libs/pango
"

RESTRICT="bindist mirror strip test"

DESTDIR="/usr/lib/${MY_PN}"

CONFIG_CHECK="~USER_NS"

S="${WORKDIR}/${MY_PN^}"
ASAR_S="${WORKDIR}/asar-${ASAR_V}"

pkg_pretend() {
	chromium_suid_sandbox_check_kernel_config
}

src_unpack() {
	# From dev-util/electron from electron overlay
	local a
	local fn

	mkdir -p "${WORKDIR}/yarn-cache" || die

	for a in ${A} ; do
		case "${a}" in
			asar-dep*)
				# Yarn artifact
				fn="${a#asar-dep--}"
				fn="${fn#asar-dep-}"
				ln -s "${DISTDIR}/${a}" "${WORKDIR}/yarn-cache/${fn}" || die
				;;
			*)
				# Fallback to the default unpacker.
				unpack "${a}"
				;;
		esac
	done
}

src_configure() {
	chromium_suid_sandbox_check_kernel_config

	default
}

src_prepare() {
	default

	pushd "${ASAR_S}"

	# Install asar's JavaScript dependencies.
	echo "yarn-offline-mirror \"${WORKDIR}/yarn-cache\"" >> "${ASAR_S}/.yarnrc" || die
	yarn install --engine-strict asar --ignore-optional --frozen-lockfile --offline \
		--ignore-scripts --no-progress || die

	popd

	# remove post-install script
	rm postinst.sh || die "the removal of the unneeded post-install script failed"

	# # cleanup languages
	# pushd "locales/" || die "location change for language cleanup failed"
	# chromium_remove_language_paks
	# popd || die "location reset for language cleanup failed"

	# fix .desktop exec location
	sed -i -e "s:/usr/share/discord/Discord:/usr/bin/${MY_PN}:" ${MY_PN}.desktop || die "fixing of exec location on .desktop failed"

	# Use system electron (From AUR discord_arch_electron_wayland)
	${ASAR_S}/bin/asar.js e "${S}/resources/app.asar" "${S}/resources/app" || die
	rm "${S}/resources/app.asar" || die
	sed -i "s|process.resourcesPath|'${DESTDIR}'|" "${S}/resources/app/app_bootstrap/buildInfo.js" || die
	sed -i "s|exeDir,|'/usr/share/pixmaps',|" "${S}/resources/app/app_bootstrap/autoStart/linux.js" || die
	${ASAR_S}/bin/asar.js p "${S}/resources/app" "${S}/resources/app.asar" --unpack-dir '**' || die
	rm -rf "${S}/resources/app" || die

	# Fix for crash on launch when using >=electron-18
	sed -i "s|module.paths = \[\]|module.paths = \[\"/home/\" + process.env.USER + \"/.config/discord/${PV}/modules\"\]|" "${S}/resources/app.asar.unpacked/app_bootstrap/requireNative.js" \
		|| die
}

src_install() {
	doicon -s 256 ${MY_PN}.png
	doicon ${MY_PN}.png

	# install .desktop file
	domenu ${MY_PN}.desktop

	insinto "${DESTDIR}"
	insopts -m0755
	doins -r resources/*

	#dosym "${DESTDIR}"/${MY_PN^} /usr/bin/${MY_PN}
	newbin "${FILESDIR}/${MY_PN}-launcher.sh" "${MY_PN}"
}

pkg_postinst() {
	xdg_pkg_postinst

	optfeature "sound support" \
		media-sound/pulseaudio media-sound/apulse[sdk] media-video/pipewire
	optfeature "system tray support" dev-libs/libappindicator
}
