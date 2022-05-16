

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
" :!sed -i s/FiberOption/FiberNode/g packages/micreact/src/*.ts

