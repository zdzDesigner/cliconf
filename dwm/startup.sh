#! /bin/bash


# export QT_DEVICE_PIXEL_RATIO=1

# 缩放
export QT_AUTO_SCREEN_SCALE_FACTOR=0.5
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=1
# export GDK_DPI_SCALE=1
export GDK_DPI_SCALE=1.5
export WINIT_HIDPI_FACTOR=1
export WINIT_X11_SCALE_FACTOR=1


/bin/bash $CLIENV/dwm/scripts/dwm-status.sh &

# 网络
nm-applet &
# 网络图形界面
# nmtui-connect :: 设置链接 net manage tool ui
# nm-connection-editor

# 输入法 启动fcitx mod + shift + f
# fcitx &
# 输入法图形界面
# fcitx-configtool
## 输入法
# fcitx-autostart &

# 电源管理, 屏幕亮度 (屏幕亮度写入文件了，不依赖此模块)
# xfce4-power-manager-settings 配置电源模块行为(合上盖子)
xfce4-power-manager &

# 禁用中建复制
xmodmap -e "pointer = 1 25 3 4 5 6 7 8"
#解决 键盘延迟, 长按延迟
xset r rate 250 30
#解决 摇杆(小红点)速度
xinput --set-prop 'Elan TrackPoint' 'libinput Accel Speed' 1

bluetooth off &

# 解除静音
# alsamixer &
google-chrome-stable &
goldendict &
# systemctl start trojan.service &

# ======清除字体缓存==============
# fc-cache -fv
# =======================

# 透明度 依赖了 xorg openbox
# compton -b
picom --config /home/zdz/.config/picom.conf &

exec dwm



## simplescreenrecorder 录屏软件


##  问题
### 字体图标导致崩溃
### < 打开vuex github 时 title中包含了 emoji 图标, 导致dwm，st 崩溃
### << https://wiki.archlinux.org/title/st 
### > sudo apt install fonts-symbola

# urxvt  ranger 可以显示图片terminal 

# 改建
# /usr/share/X11/xkb/keycodes/evdev

# key map
# > /usr/include/X11/keysymdef.h

# 设置亮度 
# sudo ./brightness 90

## 腾讯会议
# wemeet

## 截图工具
# flameshot 

## pulseview

## 多级弹出框
#  st -n spterm -g 120x44 &



############ 
### xrandr
############ 

## 检测 connected
# xrandr
# DP-1 disconnected (normal left inverted right x axis y axis)
# HDMI-1 disconnected (normal left inverted right x axis y axis)
# DP-2 disconnected (normal left inverted right x axis y axis)
# HDMI-2 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 521mm x 293mm
#   1920x1080     60.00*+  50.00    59.94

## 还原
# xrandr --auto --output eDP-1 --mode 2560x1440

## 外接显示器
# xrandr --auto --output eDP-1 --pos 0x0 --mode 1920x1080 --output HDMI-1 --same-as eDP-1
# xrandr --auto --output eDP-1 --pos 0x0 --mode 1920x1080 --output HDMI-3 --same-as eDP-1

#### 监控cpu频率
# watch -n.1 "grep \"^[c]pu MHz\" /proc/cpuinfo"

#### nvidia-smi
# watch nvidia-smi

#### cpu 温度
# watch sensors

### 输入法
#fcitx5-config-qt

## 打印机
######### system-config-printer
