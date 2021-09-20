source $NVIM_HOME/sources/core.vim

call plug#begin('~/.config/nvim/plugged')
" workspace
Plug 'thaerkh/vim-workspace'
" icon
Plug 'ryanoasis/vim-devicons'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'

" themes
Plug 'dracula/vim',{'as':'dracula'}

" Plug 'connorholyday/vim-snazzy'

Plug 'junegunn/vim-easy-align'
Plug 'Chiel92/vim-autoformat'
" Plugin 'google/vim-maktaba'
" Plugin 'google/vim-codefmt'


" File navigation
" on: 开启方式
Plug 'preservim/nerdtree', { 'on': 'NERDTreeFind' }
Plug 'Xuyuanp/nerdtree-git-plugin' 
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" ranger 2
" Plug 'kevinhwang91/rnvimr'

" neovim ?
" Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

" code complement
"Plug 'Valloric/YouCompleteMe'



Plug 'shougo/vimshell.vim'
Plug 'udalov/kotlin-vim'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}



" javascript syntax highlight
Plug 'pangloss/vim-javascript'

" vue highlight
" Plug 'leafOfTree/vim-vue-plugin'
"
" Syntax: html
Plug 'othree/html5.vim'

" Syntax: scss
Plug 'cakebaker/scss-syntax.vim'

" Syntax: Vue
"Plug 'posva/vim-vue'

" html close tag
Plug 'alvan/vim-closetag'


" go extend
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" auto create ctag
Plug 'ludovicchabant/vim-gutentags'

" Markdown
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

"comment
"Plug 'preservim/nerdcommenter'

" 成对出现
Plug 'jiangmiao/auto-pairs'
" 两边插入符号,更改符号
Plug 'tpope/vim-surround'
" 括号选中
Plug 'gcmt/wildfire.vim'
Plug 'tomtom/tcomment_vim'
Plug 'mg979/vim-visual-multi'


" Plug 'kdheepak/lazygit.nvim'

call plug#end()

source $NVIM_HOME/sources/plugins/coc.vim
source $NVIM_HOME/sources/plugins/fzf.vim
source $NVIM_HOME/sources/plugins/go.vim
source $NVIM_HOME/sources/plugins/gutentags.vim
source $NVIM_HOME/sources/plugins/markdown.vim
source $NVIM_HOME/sources/plugins/lazygit.vim
" source $NVIM_HOME/sources/plugins/airline.vim
source $NVIM_HOME/sources/plugins/lightline.vim
source $NVIM_HOME/sources/plugins/ranger.vim
" source $NVIM_HOME/sources/plugins/rnvimr.vim
source $NVIM_HOME/sources/plugins/tcomment.vim
source $NVIM_HOME/sources/plugins/workspace.vim


" ===
" === vim-easy-align
" ===
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)



" ===
" === vim-autoformat
" ===
let g:formatters_vue = ['eslint_local', 'stylelint']
let g:run_all_formatters_vue = 1


" ===
" === NERDTree
" ===
" map TT :NERDTreeToggle<CR>
" map TF :NERDTreeFind<CR>
map <C-t> :NERDTreeFind<CR>
" 显示隐藏文件
let g:NERDTreeHidden=1
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" ===
" === YouCompleteMe
" ===
"nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap g/ :YcmCompleter GetDoc<CR>
"nnoremap gt :YcmCompleter GetType<CR>
"nnoremap gr :YcmCompleter GoToReferences<CR>
"let g:ycm_autoclose_preview_window_after_completion=0
"let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_use_clangd = 0

" ===
" === wildfire
" ===
nmap M <Plug>(wildfire-fuel)
nmap mm <Plug>(wildfire-fuel)



" ===
" === vim-visual-multi
" ===
" === ciw
let g:VM_maps = {}
let g:VM_maps['Select All'] = '<C-d>'




" ===
" === vim-closetag
" ===
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'





" ===
" === dracula theme
" ===
let g:dracula_colorterm = 0
colorscheme dracula




" ===
" === 自定义函数  
" ===
"=================================================================================
source $NVIM_HOME/sources/scripts/kibanalog.vim






" ===
" === vim-vue
" ===
"let g:ft = ''
"function! NERDCommenter_before()
  "if &ft == 'vue'
    "let g:ft = 'vue'
    "let stack = synstack(line('.'), col('.'))
    "if len(stack) > 0
      "let syn = synIDattr((stack)[0], 'name')
      "if len(syn) > 0
        "exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      "endif
    "endif
  "endif
"endfunction
"function! NERDCommenter_after()
  "if g:ft == 'vue'
    "setf vue
    "let g:ft = ''
  "endif
"endfunction


" =====================================================================================
" vue 注释配置
" 注释后面自动加空格"
" let g:NERDSpaceDelims=1     
" Set local options based on subtype
" function! OnChangeVueSubtype(subtype)
  " echom 'subtype is '.a:subtype
  " if a:subtype == 'html'
    " setlocal commentstring=<!--%s-->
    " setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
  " elseif a:subtype =~ 'css'
    " setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
  " else
    " setlocal commentstring=//%s
    " setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
  " endif
" endfunction

