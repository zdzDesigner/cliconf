function! s:ClearNumber()
  set nonumber
  set norelativenumber
  set nohlsearch

endfunction


function! s:AddNumber()
  set number
  set relativenumber
  set hlsearch
endfunction



let s:ranger_command = 'ranger'
let s:choice_file_path = '/tmp/chosenfile'


function! OpenRangerIn(path, edit_cmd)
  let currentPath = expand(a:path)
  let rangerCallback = { 'name': 'ranger', 'edit_cmd': a:edit_cmd }
  function! rangerCallback.on_exit(job_id, code, event)
    " echom "Got here============"
    call s:AddNumber()
    if a:code == 0
      " echo :buffers
      " silent! Bclose!
      silent! exe ":buffer #"
      " silent! :buffer %
    endif
    try
      " echom "Got here============"
      if filereadable(s:choice_file_path)
        for f in readfile(s:choice_file_path)
          " echom f
          exec self.edit_cmd . f
        endfor
        call delete(s:choice_file_path)
      endif
    endtry
  endfunction
  enew
  if isdirectory(currentPath)
    call termopen(s:ranger_command . ' --choosefiles=' . s:choice_file_path . ' "' . currentPath . '"', rangerCallback)
  else
    call termopen(s:ranger_command . ' --choosefiles=' . s:choice_file_path . ' --selectfile="' . currentPath . '"', rangerCallback)
  endif
  startinsert
  call s:ClearNumber()
endfunction

" For backwards-compatibility (deprecated)
if exists('g:ranger_open_new_tab') && g:ranger_open_new_tab
  let s:default_edit_cmd='tabedit '
else
  let s:default_edit_cmd='edit '
endif

command! RangerCurrentFile call OpenRangerIn("%", s:default_edit_cmd)
command! RangerCurrentDirectory call OpenRangerIn("%:p:h", s:default_edit_cmd)
command! RangerWorkingDirectory call OpenRangerIn(".", s:default_edit_cmd)
command! Ranger RangerCurrentFile

" To open the selected file in a new tab
command! RangerCurrentFileNewTab call OpenRangerIn("%", 'tabedit ')
command! RangerCurrentFileExistingOrNewTab call OpenRangerIn("%", 'tab drop ')
command! RangerCurrentDirectoryNewTab call OpenRangerIn("%:p:h", 'tabedit ')
command! RangerCurrentDirectoryExistingOrNewTab call OpenRangerIn("%:p:h", 'tab drop ')
command! RangerWorkingDirectoryNewTab call OpenRangerIn(".", 'tabedit ')
command! RangerWorkingDirectoryExistingOrNewTab call OpenRangerIn(".", 'tab drop ')
command! RangerNewTab RangerCurrentDirectoryNewTab

" For retro-compatibility
function! OpenRanger()
  Ranger
endfunction

" Open Ranger in the directory passed by argument
function! OpenRangerOnVimLoadDir(argv_path)
  let path = expand(a:argv_path)

  " Delete empty buffer created by vim
  Bclose!

  " Open Ranger
  call OpenRangerIn(path, 'edit')
endfunction

" To open ranger when vim load a directory
augroup ReplaceNetrwByRangerVim
  echom '----------'
  echom isdirectory(expand("%"))
  echom expand("%")
  echom '----------'
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter * if isdirectory(expand("%")) | call OpenRangerOnVimLoadDir("%") | endif
augroup END



