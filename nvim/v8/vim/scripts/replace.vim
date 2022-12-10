

" 去除;
function! ZReplace(from,to,...) 
    " let src = a:0
    let from = a:from
    let to = a:to
    " :args src
    :argdo %s/.from./.to./egc | update
endfunction


" 锁定区域
" :args src/**/*.js
" 查找
" :argdo /xxx
" 替换
" :argdo %s/isdef/isDef/egc | update
"
"
" 使用 sed 命令
" :!sed -i s/FiberOption/FiberNode/g packages/micreact/src/**/*.ts
" :!sed -i 's/ROOT\/arch/ARCH/g' packages/micreact/src/**/*.ts

" 选中行替换 %s 每一行(全部行)
" :begin,end,syntax/old/new/g
" :429,431,s/},/},\r/g

" console.log  =>  // console.log
" :%s /^\s*console.log/\/\/console.log/g


" // // console.log => // console.log
" :%s/^\s*\/\/\s*\/\//\/\//g


" ========== 选中区域命令 ===========
" 先选中区域, shift+:
" :'<,'>s /aaa/bbb/g
"
"
"
" ========== 非贪婪\{-} ===========
":'<,'>s /bg='.\{-}'/bg='None'/

" ========== 替换组\(\) \n===========
" ========== 双引号-> 单引号 ===========
":%s /"\(.*\)"/'\1'/g
"%s / "\(.\{-}\)"/'\1'/g






