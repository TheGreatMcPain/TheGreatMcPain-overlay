# About the DXVK and Wine-Staging ebuilds

## Wine-Staging ebuilds

The `wine-staging` ebuilds are based on the wine-vanilla ebuild from [bobwya's overlay](https://github.com/bobwya/bobwya), but have the dependences from wine-staging added.

This is so that I can point the ebuild's EGIT\_REPO\_URI to pre-patched `wine-staging` repositories.\
(such as [lutris' wine builds](https://github.com/lutris/wine))

These ebuilds require bobwya's overlay to be enabled. `# layman -a bobwya`

I've also added a `mingw` useflag to `wine-staging` which uses the `--with-mingw` configure
option in wine to build some DLLs as Windows native PE files.
[(Requires a mingw toolchain)](#setting-up-mingw-in-gentoo)\
More info on PE DLLs can be found in [Wine's 5.0 announcement.](https://www.winehq.org/announce/5.0)

By default `mingw` is off which will use `--without-mingw`.\

## DXVK ebuilds

The DXVK ebuilds are based on [pchome's dxvk-gentoo-overlay](https://github.com/pchome/dxvk-gentoo-overlay).

The dxvk-config useflag is mainly for Proton since Proton's wine-dxgi uses it to read
certain dxgi related dxvk.conf options that normally require dxvk's version of dxgi
(this allows vkd3d and dxvk to co-exist), and I like to use my dxvk ebuilds in self-built
Proton installations. If you with to use dxvk\_config.dll separately from Proton, I have
added the option `--with-config` to the setup scripts.

The mingw variants use Mingw compilers (Which is the upstream supported way to build them),
and the non-mingw varients will use winelib
(Which has been completely removed after
[1.6.1](https://github.com/doitsujin/dxvk/commit/436357e28096f5e1e25aa8b72fceb77123ea8404))\
I've added a patch to the ebuilds that restore winelib builds for versions newer than 1.6.1.

DO NOT REPORT WINELIB BUILD ISSUES TO UPSTREAM.

Please report build issues (preferably) [to the Gitlab repo](https://gitlab.com/TheGreatMcPain/thegreatmcpain-overlay), or
to the [Github mirror](https://github.com/TheGreatMcPain/TheGreatMcPain-overlay).

[See the section below on how to setup a mingw toolchain.](#setting-up-mingw-in-gentoo)

Each dxvk ebuild will have it's own setup script `dxvk-setup`, and `dxvk-mingw-setup`.

DXVK's DLLs will be installed in `/usr/lib(64)/dxvk*`

## Setting up Mingw in Gentoo

[This guide is based on this blog post. (Not Mine)](https://blog.christiansegundo.com/eng/2018-8-1-dxvk-gentoo/)

In order to setup a mingw toolchain you'll need to install `crossdev` first.

`# emerge -av crossdev`

Then we can create a `i686-w64-mingw32` and `x86_64-w64-mingw32` toolchain like so.

`# crossdev -S --libc ">=7.0.0" -t i686-w64-mingw32`\
`# crossdev -S --libc ">=7.0.0" -t x86_64-w64-mingw32`

The `-S` option tells crossdev to install stable versions of binutils, gcc, etc.\
`--libc ">=7.0.0"` tells crossdev to install libc versions that are newer, or equal to 7.0.0 in this case the libc is `mingw64-runtime`. The `-t` option stands for target.

Now in order for our new toolchains to build DXVK we need to enable pthread support.\
We'll also go ahead and enable `dwarf2` in i686-w64-mingw32 for better performance in 32-bit DXVK.

`# mkdir /etc/portage/{env,package.env}`

`# echo 'EXTRA_ECONF=\"--enable-threads=posix --disable-sjlj-exceptions --with-dwarf2\"' > /etc/portage/env/mingw32_threads_dwarf2`

`# echo 'EXTRA_ECONF=\"--enable-threads=posix\"' > /etc/portage/env/mingw32_threads`

`# echo -e 'cross-i686-w64-mingw32/gcc mingw32_threads_dwarf2\ncross-x86_64-w64-mingw32/gcc mingw32_threads' > /etc/portage/package.env/mingw32`

Will also need to enable the `libraries` useflag in `mingw64-runtime`.

`# echo -e 'cross-i686-mingw32/mingw64-runtime libraries\ncross-x86_64-mingw32/mingw64-runtime libraries' > /etc/portage/package.use/mingw64-runtime`

Now we need to recompile `mingw64-runtime` first then `gcc`, because `mingw64-runtime` with the `libraries` useflag provides `pthread.h` which is needed to compile `gcc` with POSIX threads.

`emerge -1va {cross-i686-w64-mingw32,cross-x86_64-w64-mingw32}/mingw64-runtime`\
`emerge -1va {cross-i686-w64-mingw32,cross-x86_64-w64-mingw32}/gcc`

If everything emerged okay the final result should be:

`# i686-w64-mingw32-gcc -v`\
`# x86_64-w64-mingw32-gcc -v`\
`...`\
`Thread model: posix`\
`...`

You should now be able to emerge `dxvk-mingw`, and use the `mingw` useflag in `wine-staging` without issue.
