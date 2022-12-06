local set = vim.opt

set.tabstop = 2
set.expandtab = true
set.shiftwidth = 2
set.softtabstop = -1

set.number = true
set.relativenumber = true -- 相对行号
set.cursorline = true
set.wildmenu = true
set.showcmd = true
set.hlsearch = true -- 设置搜索高亮

set.incsearch = true
set.ignorecase = true -- 设置默认进行大小写不敏感查找
set.smartcase = true -- 如果有一个大写字母，则切换到大小写敏感查找
set.showtabline = 2
set.scrolloff=10 -- 上下预留空间
set.foldmethod='indent' -- 折叠方式

set.foldlevel=15 -- 设置折叠层数

set.encoding='utf-8'
set.clipboard='unnamedplus' -- 剪切板

set.smartindent = true
set.autoread =true


vim.cmd([[
" syntax on
set statusline +=%{resolve(expand('%:p'))}\ %*
exec "nohlsearch"
au FocusGained,BufEnter * :silent! !

noremap <silent> <C-g> :call AbsolutePath()<CR>
function! AbsolutePath()
    let @+=expand("%:p")
    " let @+=expand("%:h")
endfunction

]])




