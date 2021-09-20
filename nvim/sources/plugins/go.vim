
" ===
" === vim-go
" ===
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" 冲突 conflict K key
let g:go_doc_keywordprg_enabled = 0
" 函数在同一个文件中时不需要打开新窗口
let g:godef_same_file_in_same_window=1 
" 格式化将默认的 gofmt 替换
let g:go_fmt_command = "goimports" 
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

" autocmd filetype go map <C-w> <nop> 
" GoAutoTypeInfoToggle
