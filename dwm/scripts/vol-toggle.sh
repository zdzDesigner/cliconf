#!/bin/bash

MASTER_STATUS=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)\].*/\1/") 
SPEAKER_STATUS=$(amixer get Speaker | tail -n1 | sed -r "s/.*\[(.*)\].*/\1/") 
if [ "$MASTER_STATUS" = "off" ] || [ "$SPEAKER_STATUS" = "off" ]; then
    /usr/bin/amixer set Master unmute
    /usr/bin/amixer set Speaker unmute
    /usr/bin/amixer set Headphone unmute
else
    /usr/bin/amixer set Master mute
    /usr/bin/amixer set Speaker mute
    /usr/bin/amixer set Speaker mute
fi
bash $CLIENV/dwm/scripts/dwm-status-refresh.sh
