let mapleader=" "
syntax on
" syntax enable


set noswapfile
set number
set relativenumber
" set norelativenumber
set cursorline
set wildmenu
set showcmd
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" set noexpandtab
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=-1

"top and bottom scroll position
set scrolloff=10

set clipboard=unnamedplus
" Copy to system clipboard
"vnoremap Y "+y

" set clipboard=unnamed
set smartindent




noremap H 0
noremap L $
" noremap K 10kzz
" noremap J 10jzz
noremap K 10k
noremap J 10j
noremap <LEADER><CR> :nohlsearch<CR>



" v-mode tab indent
vnoremap t :'<,'>normal I    <CR>

" comment single line
"vnoremap < <ESC>0i<!--<ESC>$a--><ESC>
"vnoremap > <ESC>04x$hh3x<ESC>


map s <nop>
map S :w<CR>
map Q :q<CR>
map E :e<CR>
map R :source $MYVIMRC<CR>

"split screen
map sl :set splitright<CR>:vsplit ~/temp/@@<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

"split screen cursor postion
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

"inert empty line
map <LEADER>i O<Esc>
map <LEADER>o o<Esc>

" 拼写检测, prompt key z=
map <LEADER>sc :set spell!<CR>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i


"tab operation
map tt <nop>
map tn :tabe<CR>
map th :tabp<CR>
map tl :tabn<CR>

noremap <silent> <C-j> :tabp<CR>
noremap <silent> <C-k> :tabn<CR>


call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'


" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-refactor'


Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'tomtom/tcomment_vim'




" themes
Plug 'dracula/vim',{'as':'dracula'}


call plug#end()



lua << EOF
require('lspconfig').tsserver.setup {}
require('lspconfig').gopls.setup {}
require('nvim-treesitter.configs').setup {}


-- require('lspsaga').init_lsp_saga {
--   border_style = "round",
-- }

EOF




" ===
" === dracula theme
" ===
let g:dracula_colorterm = 0
colorscheme dracula




