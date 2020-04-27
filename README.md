# TheGreatMcPain's Gentoo overlay

Just a bunch of stuff I wanted to install which were not available in other overlays, or are just unmaintained, etc.  I mainly just didn't want to install a lot of overlays.

You may want to read about the stuff in [app-emulation](app-emulation/README.md) though.

This overlay also has the profile: `thegreatmcpain:default/linux/amd64/17.1/desktop/systemd`

### Installation

Bobwya's overlay is required since my wine-staging is based on their wine-vanilla ebuild.\
(which currently pulls from [lutris' wine repo.](https://github.com/lutris/wine/tree/lutris-fshack-5.6))

It can be install via: `layman -a bobwya`

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
