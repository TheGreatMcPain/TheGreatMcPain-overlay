# TheGreatMcPain's Gentoo overlay

Just a bunch of stuff I wanted to install which were not available in other overlays, or are just unmaintained, etc.  I mainly just didn't want to install a lot of overlays.

You may want to read about the stuff in [app-emulation](app-emulation/README.md) though.

### Installation

Add this to `/etc/portage/repos.conf/thegreatmcpain.conf`

`[thegreatmcpain]`\
`sync-uri = https://gitlab.com/TheGreatMcPain/thegreatmcpain-overlay.git`\
`sync-type = git`\
`location = /var/db/repos/thegreatmcpain`
