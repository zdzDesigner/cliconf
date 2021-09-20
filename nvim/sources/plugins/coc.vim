"
" call plug#begin('~/.config/nvim/plugged')
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" call plug#end()
"


" ===
" === coc.nvim 
" ===
"=================================================================================
"======= 代码补全提示 tab 选中
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

