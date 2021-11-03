" percent
let g:lightline = {
      \ 'colorscheme':'one',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'gitbranch' ],
      \              [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'totallinesandpercent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ] 
      \ },
      \ 'component': {
      \   'filename': '%f',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'totallines': 'LightLineTotalLines',
      \   'totallinesandpercent': 'LightLineTotalLinesAndPercent',
      \   'indent': 'LightlineIndent'
      \ },
      \ }
" slash
" let g:lightline.separator = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '', 'right': '' }

" fire
let g:lightline.separator = { 'left': "\ue0c0", 'right': "\ue0c2" }
let g:lightline.tabline_separator = { 'left': "\ue0c0", 'right': "" }
" let g:lightline.subseparator = { 'left': "\ue0c1", 'right': "\ue0c3" }
let g:lightline.subseparator = { 'left': "", 'right': "" }

" arrow
" let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2"}
" let g:lightline.tabline_separator = { 'left': "\ue0b0", 'right': "" }
" let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3"}

let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [''] ] }
" let g:lightline.tabline = {
"       \ 'left': [ [ 'tabs' ] ] }


let g:lightline.tab = {
      \ 'active': [ 'filename', 'modified' ],
      \ 'inactive': [ 'filename', 'modified' ] }

function! LightLineTotalLines()
  return line('$')
endfunction
function! LightLineTotalLinesAndPercent()
  return line('$').''.(line('.')*100/line('$').'%')
endfunction

function! LightlineIndent() abort
  return (&expandtab ? "Spaces" : "Tab size") . ':' . (&expandtab ? &shiftwidth : &tabstop)
endfunction
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
