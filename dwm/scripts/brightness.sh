#!/bin/bash

function getbrightness() {
    echo $(cat /sys/class/backlight/intel_backlight/brightness)
}
function setbrightness() {
    echo $1 > /sys/class/backlight/intel_backlight/brightness
}


if [[ -z $1 ]]; then
    echo $(($(getbrightness)))
    exit
fi

if [[ $1 == "-inc" ]]; then
    curlight=$(($(getbrightness)+15))
    if [[ $curlight -gt 1500 ]]; then
        curlight=1500
    fi
    $(setbrightness $curlight)
    echo $curlight
    bash $CLIENV/dwm/scripts/dwm-status-refresh.sh
    exit
fi

if [[ $1 == "-dec" ]]; then
    curlight=$(($(getbrightness)-15))
    if [[ $curlight -lt 0 ]]; then
        curlight=0

    fi
    $(setbrightness $curlight)
    echo $curlight
    bash $CLIENV/dwm/scripts/dwm-status-refresh.sh
    exit
fi

# set default light
light=${1:-70}

echo $light > /sys/class/backlight/intel_backlight/brightness
