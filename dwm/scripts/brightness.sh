#!/bin/bash


if [[ -z $1 ]]; then
    echo $(cat /sys/class/backlight/intel_backlight/brightness)
    exit
fi


# set default light
light=${1:-70}

echo $light > /sys/class/backlight/intel_backlight/brightness
