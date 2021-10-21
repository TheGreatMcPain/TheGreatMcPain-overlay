# TheGreatMcPain's Gentoo overlay

Just a bunch of stuff I wanted to install which were not available in other overlays, or are just unmaintained, etc. I mainly just didn't want to install a lot of overlays.

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

## Wine-staging ebuilds have been moved.

I've moved my wine-staging ebuilds to a seperate overlay in-order to remove the need to install the `bobwya` overlay which was only required for the `app-emulation/wine-staging` ebuilds.

[The overlay can be found here.](https://gitlab.com/TheGreatMcPain/thegreatmcpain-wine-overlay/)

## Crypto Currency Ebuilds

If you are looking for the crypto ebuilds that gpo.zugaina.org says are here, they have been moved to my crypto overlay.

You can find that [here.](https://gitlab.com/TheGreatMcPain/thegreatmcpain-crypto-overlay)

Here's the list of packages that were moved.

```
acct-group/haven
acct-group/masari
acct-group/monero
acct-group/turtlecoin
acct-user/haven
acct-user/masari
acct-user/monero
acct-user/turtlecoin
dev-python/aiosqlite
dev-python/blspy
dev-python/chiabip158
dev-python/chiapos
dev-python/chiavdf
dev-python/clvm
dev-python/clvm-rs
dev-python/clvm-tools
dev-python/concurrent-log-handler
dev-python/keyrings-cryptfile
dev-python/maturin
dev-python/portalocker
net-misc/violetminer
net-misc/xmrig
net-misc/xmrig-cuda
net-p2p/chia-blockchain
net-p2p/haven
net-p2p/masari
net-p2p/monero
net-p2p/turtlecoin
```
