# TheGreatMcPain's Gentoo overlay

Just a bunch of stuff I wanted to install which were not available in other overlays, or are just unmaintained, etc. I mainly just didn't want to install a lot of overlays.

You may want to read about the stuff in [app-emulation](app-emulation/README.md) though.

### Installation

Bobwya's overlay is required since my wine-staging is based on their wine-vanilla ebuild.\
(which currently pulls from [lutris' wine repo.](https://github.com/lutris/wine/tree/lutris-fshack-5.6))

I also use bobwya's mingw64.eclass in my dxvk ebuild for mingw toolchain checks.

It can be installed via: `layman -a bobwya`

#### Layman

`layman -L`\
`layman -a thegreatmcpain`

#### Manual

Add this to `/etc/portage/repos.conf/thegreatmcpain.conf`

`[thegreatmcpain]`\
`sync-uri = https://gitlab.com/TheGreatMcPain/thegreatmcpain-overlay.git`\
`sync-type = git`\
`location = /var/db/repos/thegreatmcpain`

Then do. `emerge --sync thegreatmcpain`

## Contributing

The repository is mirrored from gitlab to github.\
Even though I prefer to use my Gitlab I will most-likely accept pull-requests, and issues, on Github.

I highly recommend the use of `repoman` for creating commits, because it'll usually catch errors before commiting (such as an outdated Manifest).

To create a commit run `repoman commit`.

If for some reason you can't use repoman please use the following commit format.

```
category/package: the thing I did

More information about the thing I did.
```
