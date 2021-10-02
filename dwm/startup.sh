#! /bin/bash



/bin/bash /home/zdz/.zdz/dwm/scripts/dwm-status.sh &
# 缩放
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5
# 透明度 依赖了 xorg openbox
compton -b


# 壁纸
feh --bg-fill --randomize --no-fehbg $HOME/.bg/*

# 网络
nm-applet &
# 电源管理, 屏幕亮度
xfce4-power-manager &

# 键盘延迟, 长按延迟
xset r rate 250 30

# 解除静音
# alsamixer &

# goldendict &
# systemctl start trojan.service &
exec dwm


