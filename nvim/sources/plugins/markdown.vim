" ===
" === Markdown
" ===

"=== vim-table-mode
"====== 开启和关闭  <leader>tm :TableModeToggle
"====== 对齐        <leader>tr :TableModeRealign
"===
" let g:table_mode_corner='|'
" let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='-'



"=== vim-instant-markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0


" 刷新
autocmd filetype markdown nnoremap <leader>r :InstantMarkdownPreview<CR>
" 快速添加锚点
autocmd filetype markdown inoremap <buffer> <silent> ,, <++>
" 寻找下一个锚点
autocmd filetype markdown inoremap <buffer> <silent> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
" 寻找下一个锚点并删除锚点前的空格
autocmd filetype markdown inoremap <buffer> <silent> ,s <Esc>/ <++><CR>:nohlsearch<CR>c5l
" 分割线
autocmd filetype markdown inoremap <buffer> <silent> ,- ---<Enter><Enter>
" 加粗
autocmd filetype markdown inoremap <buffer> <silent> ,b **** <++><Esc>F*hi
" 删除线
autocmd filetype markdown inoremap <buffer> <silent> ,x ~~~~ <++><Esc>F~hi
" 斜体
autocmd filetype markdown inoremap <buffer> <silent> ,i ** <++><Esc>F*i
" 行内代码
autocmd filetype markdown inoremap <buffer> <silent> ,q `` <++><Esc>F`i
" 代码块
autocmd filetype markdown inoremap <buffer> <silent> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
" todo
autocmd filetype markdown inoremap <buffer> <silent> ,g - [ ] <Enter><++><ESC>kA
" 下划线
autocmd filetype markdown inoremap <buffer> <silent> ,u <u></u><++><Esc>F/hi
" 图片
autocmd filetype markdown inoremap <buffer> <silent> ,p ![](<++>) <++><Esc>F[a
" 链接
autocmd filetype markdown inoremap <buffer> <silent> ,a [](<++>) <++><Esc>F[a
" 一号标题
autocmd filetype markdown inoremap <buffer> <silent> ,1 #<Space><Enter><++><Esc>kA
" 二号标题
autocmd filetype markdown inoremap <buffer> <silent> ,2 ##<Space><Enter><++><Esc>kA
" 三号标题
autocmd filetype markdown inoremap <buffer> <silent> ,3 ###<Space><Enter><++><Esc>kA
" 四号标题
autocmd filetype markdown inoremap <buffer> <silent> ,4 ####<Space><Enter><++><Esc>kA
" 插入当前时间
autocmd filetype markdown inoremap <buffer> <silent> ,t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
