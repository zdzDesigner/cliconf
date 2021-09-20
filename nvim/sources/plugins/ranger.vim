" ===
" === ranger
" ===
" noremap <LEADER>g  :RangerNewTab<CR>
let g:ranger_map_keys = 0
" vim 打开目录时，开启ranger 
let g:ranger_replace_netrw = 1

let g:ranger_open_new_tab = 1
" map <leader>f  :RangerNewTab<CR>
" noremap <leader>; :RangerNewTab<CR>
" 当前tab不存在时打开新tab，存在跳转
noremap <leader>; :RangerCurrentFileExistingOrNewTab<CR>

