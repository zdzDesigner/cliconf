#! /bin/bash


# gsettings set org.gnome.desktop.interface scaling-factor 2
# xrandr --dpi 192
# xrandr --output eDP1 --scale 1.5x1.5
# 依赖了 xorg openbox
compton -b

feh --bg-fill --randomize --no-fehbg $HOME/.bg/*

exec dwm
