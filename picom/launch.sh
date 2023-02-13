#!/usr/bin/bash

# killall ornfelt-picom
# ornfelt-picom \
# 	--animations \
# 	--animation-for-open-window=fly-in \
# 	--animation-for-open-window=fly-in \
# 	--experimental-backends \
# 	--config ~/.config/picom/picom.conf \
# 	-b

killall arian8j2-picom
arian8j2-picom \
	--config ~/.config/picom/picom.conf \
	-b
