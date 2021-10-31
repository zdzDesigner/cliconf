#!/bin/bash

/usr/bin/amixer -qM set Master 1%+ umute
#pactl set-sink-volume @DEFAULT_SINK@ +5%
bash $CLIENV/dwm/scripts/dwm-status-refresh.sh
