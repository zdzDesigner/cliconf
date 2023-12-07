## X11 改建
<CAPS> = 9;
<ESC> = 66;
<LCTL> = 64;
<LALT> = 37;


## 终于安装上了搜狗输入法


## 解压带密码的rar
sudo apt intall unrar

## Terminator 
vi ~/.config/terminator/config
// 禁止右键菜单 
 putty_paste_style = True
[profiles]
  [[default]]
    scrollback_lines = 3000



##.gitconfig
[user]
        email = 1696498456@qq.com
        name = zdzDesigner
[https]
#       proxy = socks5://127.0.0.1:1086
[http]
#       proxy = socks5://127.0.0.1:1086
[https "https://git.aispeech.com.cn"]
# 编辑器
[core]
        editor = vi
~                     




## 切换显卡
nvidia-settings


## 启动图标设置
cd /usr/share/applications
or 
cd ~/.local/share/applications
// wechat vofa+

### 更改WPS 背景色随主题变色问题
vi wps-office-et.desktop
Exec=/usr/bin/et %f 这一行修改为 Exec=/usr/bin/et -style Vimix %f 其中 Vimix 是我电脑上有的一个亮色主题

## 查看文件大小
du -ah filename
du -ah ./dirname


## 设置ssh 心跳
### 客户端每 60 妙向服务端发送心跳包
ServerAliveInterval  60
### 60次未响应则断开
ServerAliveCountMax  60



## sublime text 插件
### toggleExclude 过滤要展示的文件
ctrl+shift+p exclude

## 禁止中键

xmodmap -e "pointer = 1 25 3 4 5 6 7 2"
### 开启中键复制
xmodmap -e "pointer = 1 2 3 4 5 6 7 8"

## sublime text
```json
    { "keys": ["ctrl+i"], "command": "move", "args": {"by": "lines", "forward": false} },
	{ "keys": ["ctrl+k"], "command": "move", "args": {"by": "lines", "forward": true} },
	{ "keys": ["ctrl+j"], "command": "move", "args": {"by": "characters", "forward": false} },
	{ "keys": ["ctrl+l"], "command": "move", "args": {"by": "characters", "forward": true} },
	{ "keys": ["ctrl+shift+j"], "command": "move", "args": {"by": "characters", "forward": false, "extend": true} },
	{ "keys": ["ctrl+shift+l"], "command": "move", "args": {"by": "characters", "forward": true, "extend": true} },
	{ "keys": ["ctrl+shift+i"], "command": "move", "args": {"by": "lines", "forward": false, "extend": true} },
	{ "keys": ["ctrl+shift+k"], "command": "move", "args": {"by": "lines", "forward": true, "extend": true} },
```	


## 数字键盘取词失败
```sh
// 备份
~/.cache/ibus/libpinyin/user_bigram.db
// 删除
rm -rf ~/.cache/ibus/libpinyin 
// 重启 
ibus restart
```

## 选择哪个shell
➜  ~ sudo update-alternatives --config x-terminal-emulator
###### 描述 https://www.jianshu.com/p/08d08713f0d1

## 打开Dash面板，在搜索框中搜索 gname-session (这个就是开机启动) 或 输入启动
---------------------------


sudo ./bin/wxdt

-----------------------
设置开机自启动
sudo vi shadowsocks #创建开机启动服务，其内容如下：
#!/bin/bash
/usr/bin/ss-local -c /etc/shadowsocks-libev.json
exit 0
保存文件；
赋予可执行权限：
sudo chmod +x shadowsocks
移动到/etc/init.d/ 目录下：
sudo mv shadowsocks /etc/init.d/
设置开机自启动:
sudo update-rc.d shadowsocks defaults 100

O了个K，大功告成！


-------------------------------

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:max-c-lv/shadowsocks-libev -y
sudo apt-get update
sudo apt install shadowsocks-libev

编写配置文件
配置文件需要写入你的shadow$ocks账号的信息，启动shadowsocks时需要加载这些信息，具体如下：
创建配置文件：
sudo vi /etc/shadowsocks-libev.json

在配置文件中输入以下信息：
{
"server":"XXXX服务器地址",
"server_port":XXXX端口,
"local_address":"127.0.0.1",
"local_port":1080,
"password":"XXXX密码",
"timeout":60,
"method":"chacha20-ietf-poly1305",
"fast_open":false,
"workers":1
}
XXXX需要改成你的账号对应的具体信息，method就是加密方式，这里就是chacha20-ietf-poly1305,这个要看你的账号具体要求的加密方式。

运行shadow$ocks
ss-local -c /etc/shadowsocks-libev.json &
其中& 是将其放在后台运行

ss-local -c /etc/shadowsocks-libev.json &

#vultr
{
"server":"139.180.203.207",
"server_port":6666,
"local_address": "127.0.0.1",
"local_port":1080,
"password":"qaz123QAZ!@3",
"timeout":300,
"method":"aes-256-cfb"
}


## 查看进程
netstat -ntlp

kill ss-local pid
 

---------------------------
## 上下左右 Backspace 不起作用

1.直接在终端输入 sudo apt-get remove vim-common

2.直接在终端输入 sudo apt-get install vim ,按步操作安装好vim即可。


--------------------------
## 改键 ctrl to alt
sudo vi /usr/share/X11/xkb/keycodes/evdev

## 源
 /etc/apt/sources.list


## swap
cat /proc/sys/vm/swappiness
设置
/etc/sysctl.conf
vm.swappiness = 10

## 更改super键
gsettings set org.gnome.mutter overlay-key ""

## ibus 配置
ibus-setup打开ibus首选项，常规设置中，勾去“在应用程序窗口中启用内嵌编辑模式

## 软件版本控制
update-alternatives --config go


## 指定代理
proxychains 
proxychains git clone http://......

## trojan.service
/home/zdz/Application/trojan/trojan --config /home/zdz/Application/trojan/config.json
