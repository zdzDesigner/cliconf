#! /bin/bash


# export QT_DEVICE_PIXEL_RATIO=1

# 缩放
export QT_AUTO_SCREEN_SCALE_FACTOR=0.5
export GDK_SCALE=1
export GDK_DPI_SCALE=1.5

# 透明度 依赖了 xorg openbox
compton -b


/bin/bash /home/zdz/.zdz/dwm/scripts/dwm-status.sh &

# 网络
nm-applet &
# 网络图形界面
# nm-connection-editor

# 输入法
# fcitx &
# 输入法图形界面
# fcitx-configtool

# 电源管理, 屏幕亮度
xfce4-power-manager &

# 键盘延迟, 长按延迟
xset r rate 250 30

# 解除静音
# alsamixer &
google-chrome-stable &
goldendict &
# systemctl start trojan.service &

# ======清除字体缓存==============
# fc-cache -fv
# =======================

exec dwm





##  问题
### 字体图标导致崩溃
### < 打开vuex github 时 title中包含了 emoji 图标, 导致dwm，st 崩溃
### << https://wiki.archlinux.org/title/st 
### > sudo apt install fonts-symbola


