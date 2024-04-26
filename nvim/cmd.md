## 折叠
- zc

## Debug
- :messages 查看消息


## LSP
- LspStop 停止当前LSP服务



## 粘贴模式
:set paste
:set nopaste


## 16进制格式化
:%!xxd              ——将当前文本转换为16进制格式。
:%!xxd -r           还原



## % 所有的行 

## v global匹配内容取反
*v[global]/{pattern}/[cmd]* 
- 删除不包含usedJSHeap的行
  :v/usedJSHeap/d  


## :g (global)正则查询+命令
*:g/pattern/cmd* 

- 和v组合, 匹配+非匹配
	:g/found/v/notfound/{cmd}

- 和s组合, :g 来表示:s 
	:g/pat/s//PAT/g
	:%s/pat/PAT/g

## :s (substitute)替换
- :s 第一行第一个
- :s/pattern/g 第一行所有的
- :%s 所有的行的第一个
- :%s/pattern/g 第一行所有的
-	:g/pat/s//PAT/g 所有行的所有的  (:%s 和 :g)



## copy
- copy 匹配的行到寄存器"a
    - qaq 是清空寄存器 "a,  如果不清空内容会追加
      qaq
    - A 匹配的所有内容复制到 "a
      :g/pattern/y A
    
- 从寄存器"a中粘贴出内容
    "ap


## 寄存器
- 查看
    :reg
- 从寄存器"a中粘贴出内容
    "ap
- 清空寄存器
  - 清空 "a 一个寄存器
      qaq

## 大小写
- gu 小写
- gU 大写

## 宏录制
qp  开始录制 @p
q   结束录制
@p使用



## 块插入 V-BLOCK
*用大写的 I* 




## 多选
*mg979/vim-visual-multi* 
存储在寄存器"0 中




## Quicklist
- :copen25
  设置高度(多少行), copen10, 高度为10行



## ^M
:%s/\r//g
=======



## 大小写
:set ic (ignore case)  忽略大小写
:set noic 不忽略大小写

/\CWord ： 区分大小写的查找 
/\cWord ： 区分大小写的查找 


