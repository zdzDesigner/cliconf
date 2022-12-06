## checking env
> export env CLIENV *current dir* 


## font
> install nerd-fonts <br/>
> install font-manager  [font-manager](https://github.com/FontManager/font-manager)
**把展示错误的图标放置在font-manager中，禁用错误的地址** 


## install
> ./install.sh


## dmenu
- prev: mod1(alt) + h 
- next: mod1(alt) + l 
- prev page: mod1(alt) + k 
- next page: mod1(alt) + j 


## st
> **st-copyout** and **st-urlhandler** depend **xclip** <br/>
> *cat c.md | xclip -selection clipboard* <br/>
> *cat c.md | xclip -sel clip* alias <br/>

- prev line: alt + k
- next line: alt + j
- prev page: alt + ctrl + k
- next page: alt + ctrl + j

> 拷贝
- alt+y 拷贝链接
- alt+c 拷贝输出内容

  // 缩放字体大小
	{ TERMMOD,              XK_K,           zoom,           {.f = +1} },
	{ TERMMOD,              XK_J,           zoom,           {.f = -1} },
	{ TERMMOD,              XK_U,           zoom,           {.f = +2} },
	{ TERMMOD,              XK_D,           zoom,           {.f = -2} },

## lazygit
- scroll up  : shfit+k
- scroll down: shfit+j


## 启动
> ./dwm/startup.sh


## 外接显示器
# xrandr --auto --output eDP-1 --mode 2560x1440
# xrandr --auto --output eDP-1 --pos 0x0 --mode 1920x1080 --output HDMI-1 --same-as eDP-1
# xrandr --auto --output eDP-1 --pos 0x0 --mode 1920x1080 --output HDMI-3 --same-as eDP-1



## app
- wemeet 腾讯会议



```sh
// 多用户
vi /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="text" // 更改
sudo update-grub
$ systemctl set-default multi-user.target 

// 如果想改回启动图形界面执行下面
vi /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" // 更改
sudo update-grub
$ systemctl set-default graphical.target
```



## goldendict
- ctrl+q



## proxy  (proxychains4)
- proxychains ./vn -u /home/zdz/.zdz/nvim/v8/init.lua
- proxychains curl 'https://github.com/hrsh7th/cmp-nvim-lua'



### linux file manage window
> 打开复制的目录 ctrl+v
