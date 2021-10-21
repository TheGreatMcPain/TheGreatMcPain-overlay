# DXVK ebuilds info

## DXVK ebuilds

The DXVK ebuilds are based on [pchome's dxvk-gentoo-overlay](https://github.com/pchome/dxvk-gentoo-overlay).

The dxvk-config useflag is mainly for Proton since Proton's wine-dxgi uses it to read
certain dxgi related dxvk.conf options that normally require dxvk's version of dxgi
(this allows vkd3d and dxvk to co-exist), and I like to use my dxvk ebuilds in self-built
Proton installations. If you wish to use dxvk_config.dll separately from Proton, I have
added the option `--with-config` to the dxvk-setup scripts.

The `app-emulation/dxvk` ebuild will use Mingw compilers (Which is supported upstream),
and the `app-emulation/dxvk-winelib` ebuild will use winegcc
(Which has been completely removed after
[1.6.1](https://github.com/doitsujin/dxvk/commit/436357e28096f5e1e25aa8b72fceb77123ea8404))\
I've added a patch to the ebuilds that restore winelib builds for versions newer than 1.6.1.

NOTICE: I've stopped supporting the winelib ebuild as it will no longer build with wine versions past 6.6. If you still plan on using them I can still take pull-requests.

DO NOT REPORT WINELIB BUILD ISSUES TO UPSTREAM.

~Please report build issues (preferably) [to the Gitlab repo](https://gitlab.com/TheGreatMcPain/thegreatmcpain-overlay), or
to the [Github mirror](https://github.com/TheGreatMcPain/TheGreatMcPain-overlay).~

[See the section below on how to setup a mingw toolchain.](#setting-up-mingw-in-gentoo)

Each dxvk ebuild will have it's own setup script `dxvk-setup`, and `dxvk-winelib-setup`.

DXVK's DLLs will be installed in `/usr/lib(64)/dxvk*`

I have recently added the [dxvk-async](https://github.com/Sporif/dxvk-async) patch to the dxvk ebuilds which can by applied by
the useflag `async-patch`. Keep in mind that this patch is not supported upstream, but
may lead to a more stutter-free experience at the cost of visual glitches.

To enable it you just need to set the environment variable `DXVK_ASYNC=1`.

## Setting up Mingw in Gentoo

### Automated installation

[I wrote a script that's based on this tutorial.](https://gitlab.com/TheGreatMcPain/gentoo-mingw-toolchain-installer)

### Creating the toolchain

[This is based off of the GentooWiki's DXVK page.](https://wiki.gentoo.org/wiki/DXVK#Install_Mingw_for_64_and_32_bit)

In order to setup a mingw toolchain you'll need to install `crossdev` first.

`# emerge -av crossdev`

Then we can create a `i686-w64-mingw32` and `x86_64-w64-mingw32` toolchain like so.

```sh
$ crossdev --stable --libc "~9.0.0" --target x86_64-w64-mingw32
$ crossdev --stable --libc "~9.0.0" --lenv 'USE="libraries"' \
    --genv 'EXTRA_ECONF="--enable-threads=posix"' \
    --init-target --target x86_64-w64-mingw32

$ emerge --oneshot --verbose cross-x86_64-w64-mingw32/mingw64-runtime
$ emerge --oneshot --verbose cross-x86_64-w64-mingw32/gcc

$ crossdev --stable --libc "~9.0.0" --target i686-w64-mingw32
$ crossdev --stable --libc "~9.0.0" --lenv 'USE="libraries"' \
    --genv 'EXTRA_ECONF="--enable-threads=posix --disable-sjlj-exceptions --with-dwarf2"' \
    --init-target --target i686-w64-mingw32

$ emerge --oneshot --verbose cross-i686-w64-mingw32/mingw64-runtime
$ emerge --oneshot --verbose cross-i686-w64-mingw32/gcc
```

A breakdown of what each command above does:

* Create the initial cross-compiler toolchain
  - `--stable` Forces `crossdev` to install stable versions of `gcc`, `binutils`, etc.
  - `--libc "~9.0.0"` Unmasks the latest version, at the time of writting, of `mingw64-runtime` which doesn't have a stable version.
  - `--target x86_64-w64-mingw32` Tells crossdev to install the `x86_64-w64-mingw32` toolchain.

* Repeat the previous command except we enable pthreads for the toolchain.
  - `--lenv 'USE="libraries"'` Enables the `libraries` useflag for `mingw64-runtime` (installs the libpthread library).
  - `--genv 'EXTRA_ECONF="--enable-threads=posix"'` Enables POSIX threads in `gcc` via configure option.
  - `--init-target` Setup config/overlay/etc... configuration only

* Re-emerge `mingw64-runtime` and `gcc` with the new configurations generated from the previous command.

* Repeat the process for `i686-w64-mingw32`
  - `--disable-sjlj-exceptions --with-dwarf2` improves performance in 32bit games. See [this](https://github.com/ValveSoftware/Proton/blob/5d3d462f5995eb831aaf33f76c686b01c1ccc750/build-mingw-w64.sh#L111) and the [GentooWiki DXVK page](https://wiki.gentoo.org/wiki/DXVK#Install_Mingw_for_64_and_32_bit) for more info.

If everything emerged okay the final result should be:

```sh
# i686-w64-mingw32-gcc -v
# x86_64-w64-mingw32-gcc -v
...
Thread model: posix
...
```

You should now be able to emerge `dxvk-mingw`, and use the `mingw` useflag in `wine-staging` without issue.

### Uninstalling the toolchain

If for some reason you want to uninstall the cross-compile toolchain run these commands.

```sh
$ crossdev -C x86_64-w64-mingw32
$ crossdev -C i686-w64-mingw32
```
