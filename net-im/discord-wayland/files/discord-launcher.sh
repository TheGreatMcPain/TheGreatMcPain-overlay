#!/bin/sh

if [ "$XDG_SESSION_TYPE" = wayland ]; then
	# Using wayland
	exec electron --enable-features=UseOzonePlatform \
		--ozone-platform=wayland /usr/lib/discord/app.asar $@
else
	# Using x11
	exec electron /usr/lib/discord/app.asar $@
fi
