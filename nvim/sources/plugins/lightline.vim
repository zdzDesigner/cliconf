
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

let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [] ] }


let g:lightline.tab = {
      \ 'active': [ 'filename', 'modified' ],
      \ 'inactive': [ 'filename', 'modified' ] }


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
