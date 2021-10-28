let mapleader=" "
syntax on
" syntax enable

" 不换行
set nowrap
" 无bak
set noswapfile
set number
set relativenumber
" set nonumber
" set norelativenumber
set cursorline
set wildmenu
set showcmd
set hlsearch
exec "nohlsearch"
set incsearch
" 设置默认进行大小写不敏感查找
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase
set showtabline=2

" tab 换成空白
set expandtab
" set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=-1

" 上下预留空间
set scrolloff=10
" 折叠方式
" set foldmethod=indent
" set foldmethod=manual
" set foldmethod=marker
set foldmethod=syntax

" 设置折叠层数
set foldlevel=15

set encoding=utf-8

set statusline +=%{resolve(expand('%:p'))}\ %*


set clipboard=unnamedplus
" set clipboard=unnamed
set smartindent



" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>




noremap H 0
noremap L $
vnoremap L $h
" noremap K 10kzz
" noremap J 10jzz
noremap K 5k
noremap J 5j
noremap <LEADER><CR> :nohlsearch<CR>

" Copy to system clipboard
" vnoremap Y "+y


" v-mode tab indent
" vnoremap t :'<,'>normal I    <CR>

" comment single line
" vnoremap < <ESC>0i<!--<ESC>$a--><ESC>
" vnoremap > <ESC>04x$hh3x<ESC>

" 禁止visual 模式下转换小写，防止误碰
vnoremap u <nop>
" 禁止快捷键数字增加
map <C-a> <nop>
map <C-x> <nop>
map <C-a> :tabnew  ~/temp/log/
map s <nop>
map S :w<CR>
" imap <C-s> <Esc> :w<CR> alacritty tmux 不支持
map Q :q<CR>
map W :q<CR>
map E :e<CR>
map R :source $MYVIMRC<CR>

noremap <silent> Tl :set splitright<CR>:vsplit ~/temp/@@<CR>
noremap <silent> Th :set nosplitright<CR>:vsplit<CR>
noremap <silent> Tk :set nosplitbelow<CR>:split<CR>
noremap <silent> Tj :set splitbelow<CR>:split<CR>

map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>
" 拼写检测, prompt key z=
map <LEADER>sc :set spell!<CR>
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" map <LEADER>l <C-w>l
" map <LEADER>h <C-w>h
" map <LEADER>j <C-w>j
" map <LEADER>k <C-w>k

map <LEADER>i O<Esc>
map <LEADER>o o<Esc>



map tt <nop>
map tn :tabe<CR>
" map th :tabp<CR>
" map tl :tabn<CR>

" <C-m> 和 Enter 相同
noremap <silent> <C-j> :tabp<CR>
noremap <silent> <C-k> :tabn<CR>
" noremap <silent> <C-1> :tabfirst<CR>
" map <C-9> :tablast<CR>
noremap <silent> <LEADER>0 :tabfirst<CR>
noremap <silent> <LEADER>9 :tablast<CR>
"
noremap <silent> <LEADER>[ :tabmove 0<CR>
noremap <silent> <LEADER>] :tabmove<CR>
noremap <silent> <LEADER>l :tabmove<CR>
noremap <silent> <LEADER>j :call TabPrev()<CR>
noremap <silent> <LEADER>k :call TabNext()<CR>


noremap r <nop>


" 寄存器复制
nnoremap <LEADER>y :call ZReg()<CR>
nnoremap <LEADER>p "bp



" autocmd BufNewFile,BufRead *.vue set filetype=vvvv
" filetype
autocmd filetype vue set tabstop=2
autocmd filetype vue set shiftwidth=2
" autocmd BufNewFile,BufRead *.vue map S :Autoformat html<CR> :w<CR>
" autocmd BufNewFile,BufRead *.js map :w<CR>
" autocmd filetype vvvv map S :Autoformat html<CR> :w<CR>

autocmd filetype javascript set tabstop=2
autocmd filetype javascript set shiftwidth=2
" autocmd filetype javascript map S :w<CR>









function ZReg()
    let @b=@+
endfunction



" lazygit
" lazygit
" noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>


function! Call()
    echo TabPrev()
endfunction

function! TabPrev()
    let l:n = tabpagenr()-2
    if l:n < 0
        exe 'tabm '.tabpagenr('$')
        return
    endif
    exe 'tabm '.l:n
endfunction

function! TabNext()
    let l:n = tabpagenr()+1
    if l:n > tabpagenr('$')
        exe 'tabm '.0
        return
    endif
    exe 'tabm '.l:n
endfunction
function! TabJump()
    let l:n = tabpagenr()+1
    echo l:n
    " if l:n > tabpagenr('$')
    "     exe 'tabm '.0
    "     return
    " endif
    " exe 'tabm '.l:n
endfunction


noremap <silent> <C-g> :call AbsolutePath()<CR>
function! AbsolutePath()
    let @+=expand("%:p")
endfunction


" 测试
function! TempVal()
    echo expand("%")
    echo expand("%:p")
endfunction


" function MyTabLine()
"   let s = ''
"   for i in range(tabpagenr('$'))
"     " select the highlighting
"     if i + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
"
"     " set the tab page number (for mouse clicks)
"     let s .= '%' . (i + 1) . 'T'
"
"     " the label is made by MyTabLabel()
"     let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
"   endfor
"
"   " after the last tab fill with TabLineFill and reset tab page nr
"   let s .= '%#TabLineFill#%T'
"
"   " right-align the label to close the current tab page
"   if tabpagenr('$') > 1
"     let s .= '%=%#TabLine#%999Xclose'
"   endif
"
"   return s
" endfunction
"
"
" set tabline=%!MyTabLine()
