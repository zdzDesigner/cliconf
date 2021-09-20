" ===
" === airline
" ===
" let g:airline_theme="molokai"
"这个是安装字体后 必须设置此项
" let g:airline_powerline_fonts = 1   
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" set guifont=Source_Code_Pro_Light:h15
" set guifont=Source\ Code\ Pro:h9
" 关闭空白符检测
" let g:airline#extensions#whitespace#enabled=0
" let g:airline#extensions#tabline#formatter = 'short_path'

" let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" let g:airline#extensions#default#section_truncate_width = {'a': 5, 'b': 5, 'x': 5, 'y': 5, 'z': 5, 'warning': 80, 'error': 80 }
" let g:airline#extensions#tabline#fnamemod = ':p:'
" let g:airline#extensions#tabline#fnamemod = ':t'
" set fillchars+=vert:█
" au User AirlineAfterInit,AirlineAfterTheme call FixSplitColours()
" fun! FixSplitColours()
"     let l:theme = get(g:, 'airline_theme', g:colors_name)
"     let l:termColour = g:airline#themes#{l:theme}#palette['inactive']['airline_a'][3]
"     exec 'hi VertSplit ctermfg=' . l:termColour
"     exec 'hi StatusLine ctermfg=' . l:termColour
"     exec 'hi StatusLineNC ctermfg=' . l:termColour
" endfun
"
" let g:airline_powerline_fonts=1                                                                                                                                                                                           
" let g:airline#extensions#tabline#enabled = 1                                                                           
" let g:airline_theme='dark'                                                                                                                                                                           
" let g:airline#extensions#tabline#fnamemod = ':t'                                                                                                                                                     
" let g:airline#extensions#tabline#tab_nr_type = 1                                                                       
" let g:airline#extensions#tabline#show_splits = 0                                                                       
" let g:airline#extensions#tabline#show_buffers = 1                                                                      
" "let g:airline#extensions#tabline#show_tab_type = 1                                                                    
" let g:airline#extensions#tabline#buffer_idx_mode = 1                                                                   
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'                                                    
" let g:airline#extensions#obsession#enabled = 1                                                                         
" "let g:airline#extensions#tabline#buffer_min_count = 0                                                                 
" let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'       
" "let airline#extensions#tabline#disable_refresh = 1                                                                    
" let g:airline#extensions#tabline#switch_buffers_and_tabs = 1                                                           
" let g:airline#extensions#tabline#show_close_button = 0   
