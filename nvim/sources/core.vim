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
set foldmethod=indent
" 设置折叠层数 
set foldlevel=3

set encoding=utf-8

set statusline +=%{resolve(expand('%:p'))}\ %*

" set nocompatible
"filetype on
"filetype indent on
"filetype plugin on
"filetype plugin indent on
"set mouse=a
"let &t_ut=''
"set expandtab
"set list
"" set listchars=tab:▸\ ,trail:▫
"set tw=0
"set indentexpr=
"set backspace=indent,eol,start
"" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"set laststatus=2
"set autochdir
"" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set clipboard=unnamedplus
" set clipboard=unnamed
set smartindent

" === 改建"
" === 改建 END"
"成对"
""inoremap ' ''<ESC>i
""inoremap " ""<ESC>i
""inoremap ( ()<ESC>i
""inoremap [ []<ESC>i
""inoremap { {<CR>}<ESC>O



" Indentation
"nnoremap < <<
"nnoremap > >>



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

" *******************************
" * status line                 *
" *******************************
set laststatus=2                               " always show status line
set statusline=%<%f\                           " Filename
set statusline+=%w%h%m%r                       " Options
set statusline+=\ [%{&ff}/%Y]                  " filetype
set statusline+=\ [%{split(getcwd(),'/')[-1]}] " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%        " Right aligned file nav info



noremap H 0
noremap L $
vnoremap L $h
" noremap K 10kzz
" noremap J 10jzz
noremap K 5k
noremap J 5j
noremap <LEADER><CR> :nohlsearch<CR>

" Copy to system clipboard
vnoremap Y "+y


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
map Q :q<CR>
map W :q<CR>
map E :e<CR>
map R :source $MYVIMRC<CR>

map sl :set splitright<CR>:vsplit ~/temp/@@<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

" 拼写检测, prompt key z=
map <LEADER>sc :set spell!<CR>
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

map <LEADER>i O<Esc>
map <LEADER>o o<Esc>



map tt <nop>
map tn :tabe<CR>
map th :tabp<CR>
map tl :tabn<CR>

noremap <silent> <C-j> :tabp<CR>
noremap <silent> <C-k> :tabn<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>


noremap r <nop>
" " lazygit
" lazygit
" noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

