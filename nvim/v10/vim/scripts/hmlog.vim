function! HM_OT_OPSLog()
    :g/^$/d  "k 清除空行
    :g/^\[\].*/d  " 清除[]
    :v/^.*JS--OT--OPS.*/d   "清除包含字段的行,  \| 或操作
    " :v/^.*JS--OT--OPS\|JS--EDIT\|JS-SPEAKER.*/d   "清除包含字段的行,  \| 或操作
    :%s/^.*data=//g " data=  之前的数据清空
    :%s/type=op-original.*//g " type=op-original 之后的数据清空
    :nohlsearch
endfunction

function! HMOTLog()
    :g/^$/d  " 清除空行
    :g/^\[\].*/d  " 清除[]
    :v/^.*JS--EDIT\|JS-SPEAKER.*/d   "清除包含字段的行,  \| 或操作
    " :v/^.*JS--OT--OPS\|JS--EDIT\|JS-SPEAKER.*/d   "清除包含字段的行,  \| 或操作
    :%s/^.*data=//g " data=  之前的数据清空
    :%s/type=op-original.*//g " type=op-original 之后的数据清空
    :nohlsearch
endfunction
    

" call HMOTLog()

" 每行的行首都添加一个字符串：%s/^/要插入的字符串
" 每行的行尾都添加一个字符串：%s/$/要插入的字符串
"
" 解释：
" % 代表针对被编辑文件的每一行进行后续操作
" $ 代表一行的结尾处
" ^ 代表一行的开头处
" :%s/;$//g   去除结尾的;号

" :v/usedJSHeap/d  删除不包含usedJSHeap的行
" :g/usedJSHeap/d  删除包含usedJSHeap的行
