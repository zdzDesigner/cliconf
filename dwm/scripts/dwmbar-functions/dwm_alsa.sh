#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    STATUS=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)\].*/\1/") 
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$VOL" -eq 0 ] || [ "$STATUS" = "off" ]; then
            # printf "婢"
            printf "🔈"
            # printf "ﱝ0%%"
            # printf "🔇"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            # printf ".%s%%" "$VOL"
            printf "🔉%s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            # printf "墳.%s%%" "$VOL"
            printf "🔉%s%%" "$VOL"
        else
            # printf ".%s%%" "$VOL"
            printf "🔊%s%%" "$VOL"
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL.%s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL.%s%%" "$VOL"
        else
            printf "VOL.%s%%" "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}

