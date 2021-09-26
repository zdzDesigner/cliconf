#! /bin/bash

# xrandr --dpi 220
# 依赖了 xorg openbox
compton -b

feh --bg-fill --randomize --no-fehbg $HOME/.bg/*

exec dwm
