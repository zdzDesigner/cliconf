" 去除^M
function! CleanM() 
    :%s/\r//g
    :nohlsearch
endfunction


" 去除;
function! CleanF() 
    :%s/;$//g
    :nohlsearch
endfunction



" 去除;
" :%s/\\//g
" function! CleanJ() 
"     :%s/\\"/"/g
"     :nohlsearch
" endfunction

function! CleanJ()
    " 1. 常规去转义：将 \" 变成 "
    " 使用 silent! 防止未找到匹配时报错
    silent! %s/\\"/"/g

    " 替换内部 \\* => \"
    silent! %s/\\\\"/\\"/g
    
    " 2. 核心修正：将嵌套 JSON 的包裹引号去掉
    " 将 "{ 替换为 {
    " silent! %s/"{/{/g
    " 将 }" 替换为 }
    " silent! %s/}"/}/g
    
    " 3. (可选) 如果想一步到位直接格式化缩进，取消下面这行的注释
    " silent! %!python3 -m json.tool --no-ensure-ascii

    nohlsearch
endfunction



function! GDiag()
lua << EOF
local diagnostics = vim.diagnostic.get(0)
print(vim.inspect(diagnostics))
EOF

endfunction


