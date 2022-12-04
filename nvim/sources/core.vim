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
" hlsearch match lighthigh color set in  colorscheme
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
set tabstop=2
set shiftwidth=2
set softtabstop=-1

" 上下预留空间
set scrolloff=10
" 折叠方式
set foldmethod=indent
" set foldmethod=manual
" set foldmethod=marker
" set foldmethod=syntax

" 设置折叠层数
set foldlevel=15

set encoding=utf-8

set statusline +=%{resolve(expand('%:p'))}\ %*


set clipboard=unnamedplus
" set clipboard=unnamed
set smartindent

set autoread
" au FocusGained,BufEnter * :silent! !
" au FocusLost,WinLeave * :silent! w



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
" noremap K 5k
" noremap J 5j
" noremap K 10k
" noremap J 10j
noremap K 6k
noremap J 6j
" noremap [[ <nop>
" noremap ]] <nop>
" noremap [ 10k
" noremap ] 10j
noremap <silent> <LEADER><CR> :nohlsearch<CR>

" Copy to system clipboard
" vnoremap Y "+y


" v-mode tab indent
" vnoremap t :'<,'>normal I    <CR>

" comment single line
" vnoremap < <ESC>0i<!--<ESC>$a--><ESC>
" vnoremap > <ESC>04x$hh3x<ESC>

" 禁止visual 模式下转换小写，防止误碰
vnoremap u <nop>
" 合并一行 join
vnoremap sj :join<CR>
" 头部替换word
noremap sp pldehbyp<CR>
" 中部替换word
noremap swp bhplde<CR>
" 禁止快捷键数字增加
map <C-a> <nop>
map <C-x> <nop>
map <C-a> :tabnew  ~/temp/log/
map s <nop>
map <silent> S :w<CR>
" imap <C-s> <Esc> :w<CR> alacritty tmux 不支持
map Q :q<CR>
" map W :q<CR>
map <silent> W :call TabCloseLeft()<CR>
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

" ====== 分栏跳转=======
" <C-w>l
" <C-w>h
" <C-w>j
" <C-w>k

map <LEADER>i O<Esc>
map <LEADER>o o<Esc>



map tt <nop>
map tn :tabe<CR>
" map th :tabp<CR>
" map tl :tabn<CR>

" <C-m> 和 Enter 相同
noremap <silent> <C-j> :tabp<CR>
noremap <silent> <C-k> :tabn<CR>
" noremap <silent> <C-e> :tabn #<CR>
noremap <silent> <C-x> :tabn #<CR>
noremap <silent> <C-t> :tabnew <CR>



noremap <silent> <LEADER>0 :tabfirst<CR>
noremap <silent> <LEADER>1 1gt <CR>
noremap <silent> <LEADER>2 2gt <CR>
noremap <silent> <LEADER>3 3gt <CR>
noremap <silent> <LEADER>4 4gt <CR>
noremap <silent> <LEADER>5 5gt <CR>

noremap <silent> <LEADER>7 :call TabJump(2)<CR>
noremap <silent> <LEADER>8 :call TabJump(1)<CR>
noremap <silent> <LEADER>9 :tablast<CR>
"
noremap <silent> <LEADER>[ :tabmove 0<CR>
noremap <silent> <LEADER>] :tabmove<CR>
noremap <silent> <LEADER>l :tabmove<CR>
noremap <silent> <LEADER>h :tabmove 0<CR>
noremap <silent> <LEADER>j :call TabPrev()<CR>
noremap <silent> <LEADER>k :call TabNext()<CR>


nnoremap <Leader><C-]> <C-w><C-]><C-w>T
noremap r <nop>


" 寄存器复制
nnoremap <LEADER>y :call ZReg()<CR>
nnoremap <LEADER>p "bp
" 删除word and paste
nnoremap dp diw<ESC>h<ESC>"0p 
" nnoremap dp diwhh "+p



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

function! ZReg()
    let @b=@+
endfunction

function! TabCloseLeft()
    if winnr('$') == 1 && tabpagenr('$') > 1 && tabpagenr() > 1 && tabpagenr() < tabpagenr('$')
        :q | tabprevious
    else
        :q
    endif
    " echon ''
endfunction

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
function! TabJump(n)
    let l:n = tabpagenr('$')-a:n
    if l:n < 1
        exe 'tabn '.1
        return
    endif
    exe 'tabn '.l:n
endfunction


noremap <silent> <C-g> :call AbsolutePath()<CR>
function! AbsolutePath()
    let @+=expand("%:p")
    " let @+=expand("%:h")
endfunction


" 测试
function! TempVal()
    echo expand("%")
    echo expand("%:p")
    echo expand("%:h")
    echo nvim_get_current_line()
    echo nvim_get_current_buf()
    echo nvim_get_current_tabpage()
    echo nvim_get_current_win()
    echo nvim_list_bufs()
    echo nvim_list_tabpages()
    
    " echo nvim_list_chans()
    let tabpaths = nvim_command(":ls")
    echo tabpaths

    " echo nvim_list_runtime_paths()
    " echo expand("#")
    " echo expand("#2")

    " echo bufnr('#')
    " echo bufnr('%')
    " echo buflisted(bufnr('#'))
    " echo buflisted(bufnr('$'))
    " echo buflisted(1000)
    " echo winnr()
    "
    " echo winnr('$')
    " echo $CLIENV."/aaa"
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

" lazygit
" lazygit
" noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
"
