# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

KEYWORDS="~amd64"

DESCRIPTION="Jellyfin user"

ACCT_USER_ID=-1
ACCT_USER_GROUPS=( jellyfin video )
acct-user_add_deps

SLOT="0"
