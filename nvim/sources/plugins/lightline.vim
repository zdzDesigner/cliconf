" let g:lightline = {
"       \ 'component_function': {
"       \   'filename': 'LightlineFilename',
"       \ },
"       \ }

" function! LightlineFilename()
"   return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
"         \ &filetype ==# 'unite' ? unite#get_status_string() :
"         \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
"         \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
" endfunction


let g:lightline = {
      \ 'colorscheme':'one',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'gitbranch' ],
      \              [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ] 
      \ },
      \ 'component': {
      \   'filename': '%f',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

" function! Filename()
"     " return '%f'
"     return expand('%f')
" endfunction



" %f 相对路径, %F 绝对路径
" let g:lightline = {
"       \ 'component': {
"       \   'filename': '%f',
"       \ },
"       \ }
