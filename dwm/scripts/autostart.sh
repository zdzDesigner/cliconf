#!/bin/bash

/bin/bash $CLIENV/dwm/scripts/dwm-status.sh &
/bin/bash $CLIENV/dwm/scripts/wp-autochange.sh &
#picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
# picom -b
compton -b
/bin/bash $CLIENV/dwm/scripts/tap-to-click.sh &
/bin/bash $CLIENV/dwm/scripts/inverse-scroll.sh &
/bin/bash $CLIENV/dwm/scripts/setxmodmap-colemak.sh &
nm-applet &
xfce4-power-manager &
#xfce4-volumed-pulse &
/bin/bash $CLIENV/dwm/scripts/run-mailsync.sh &
 $CLIENV/dwm/scripts/autostart_wait.sh &
