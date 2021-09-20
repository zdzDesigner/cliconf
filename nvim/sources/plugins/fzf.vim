
" ===
" === fzf
" ===
"" GFiles: show hide file
noremap <silent> <C-p> :Files<CR>
noremap <silent> <LEADER>l :Lines<CR>
noremap <silent> <C-l> :Windows<CR>
" noremap <silent> <C-l> :Lines<CR>
noremap <silent> <C-h> :History<CR>
noremap <silent> <C-f> :Rg<CR>
" noremap <silent> <C-b> :Buffers<CR>

let g:fzf_layout = { 'down': '80%' }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'highlight': 'Todo', 'border': 'sharp' } }

"" ignore path, just match file content
command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   {'options': '--delimiter : --nth 2..'})


"" jump buffers tab
let g:fzf_buffers_jump = 1
" " jump has tag
function! s:GotoOrOpen(command, ...)
  for file in a:000
    if a:command == 'e'
      exec 'e ' . file
    else
      exec "tab drop " . file
    endif
  endfor
endfunction
command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)
let g:fzf_action = {
  \ 'enter': 'GotoOrOpen tab',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
