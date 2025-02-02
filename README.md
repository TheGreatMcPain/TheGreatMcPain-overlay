# TheGreatMcPain's Gentoo overlay

Just a bunch of stuff I wanted to install which were not available in other overlays, or are just unmaintained, etc. I mainly just didn't want to install a lot of overlays.

### Installation

#### eselect-repository

`> eselect-repository enable thegreatmcpain`
`> emerge --sync thegreatmcpain`

You can also run this to get faster updates.

```
> eselect repository add thegreatmcpain git https://gitlab.com/TheGreatMcPain/thegreatmcpain-overlay.git
```

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

I highly recommend the use of `pkgdev` for creating commits, because it'll usually catch errors before commiting (such as an outdated Manifest).

To create a commit run `pkgdev commit`.

If for some reason you can't use repoman please use the following commit format.

```
category/package: the thing I did

More information about the thing I did.
```
