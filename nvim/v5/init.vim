source $CLIENV/nvim/sources/core.vim

call plug#begin('~/.config/nvim/pluggedv5')
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" For vsnip user.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For luasnip user.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
"
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
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeFind' }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'ojroques/nvim-lspfuzzy'

" ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" bug: exist tab no jump
" Plug 'rafaqz/ranger.vim'

" ranger 2
" Plug 'kevinhwang91/rnvimr'

" neovim ?
" Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

" code complement
"Plug 'Valloric/YouCompleteMe'



Plug 'shougo/vimshell.vim'
Plug 'udalov/kotlin-vim'

" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}



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
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
"
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

" source $CLIENV/nvim/sources/plugins/coc.vim
source $CLIENV/nvim/sources/plugins/fzf.vim
" source $CLIENV/nvim/sources/plugins/go.vim
source $CLIENV/nvim/sources/plugins/gutentags.vim
source $CLIENV/nvim/sources/plugins/markdown.vim
source $CLIENV/nvim/sources/plugins/lazygit.vim
" source $CLIENV/nvim/sources/plugins/nerdtree.vim
" source $CLIENV/nvim/sources/plugins/airline.vim
source $CLIENV/nvim/sources/plugins/lightline.vim
source $CLIENV/nvim/sources/plugins/ranger.vim
" source $CLIENV/nvim/sources/plugins/rnvimr.vim
source $CLIENV/nvim/sources/plugins/tcomment.vim
source $CLIENV/nvim/sources/plugins/workspace.vim
source $CLIENV/nvim/sources/plugins/snippets.vim


lua << EOF
    require('plugins/treesitter')
    require('plugins/lsp')
    require('plugins/cmp')
EOF
" :lua require('plugins/lsp')
" :lua require('plugins/cmp')

" :lua require('api')
command! ZBufSetLines lua require('api').ZBufSetLines()
" echo v:lua.string.rep('A', 10)
" call v:lua.print('Hello from Lua!')
command! Scratch lua require('tools').makeScratch()
command! Whid lua require('whid').whid()
" :lua require('whid').open_window()
command! ZPackage lua require('base').ZPackage()
command! ZFormat lua require('base').ZFormat()





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
source $CLIENV/nvim/sources/scripts/kibanalog.vim






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


"
" function MyTabLabel(n)
"   let buflist = tabpagebuflist(a:n)
"   let winnr = tabpagewinnr(a:n)
"   return bufname(buflist[winnr - 1])
" endfunction
"
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
"   " if tabpagenr('$') > 1
"   "   let s .= '%=%#TabLine#%999Xclose'
"   " endif
"
"   return s
" endfunction
"
"
" set tabline=%!MyTabLine()
"
