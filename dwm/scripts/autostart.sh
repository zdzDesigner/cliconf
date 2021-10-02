#!/bin/bash

/bin/bash ~/.zdz/dwm/scripts/dwm-status.sh &
/bin/bash ~/.zdz/dwm/scripts/wp-autochange.sh &
#picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
# picom -b
compton -b
/bin/bash ~/.zdz/dwm/scripts/tap-to-click.sh &
/bin/bash ~/.zdz/dwm/scripts/inverse-scroll.sh &
/bin/bash ~/.zdz/dwm/scripts/setxmodmap-colemak.sh &
nm-applet &
xfce4-power-manager &
#xfce4-volumed-pulse &
/bin/bash ~/.zdz/dwm/scripts/run-mailsync.sh &
~/.zdz/dwm/scripts/autostart_wait.sh &
