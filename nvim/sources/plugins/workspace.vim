" vim 中暂存插件
" lazygit let g:workspace_autocreate = 1
let g:workspace_persist_undo_history = 0
" 新tab自动保存
let g:workspace_create_new_tabs = 0
let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'

" 关闭自动保存
let g:workspace_autosave = 0

" 关闭制表符
let g:workspace_autosave_untrailspaces = 0
let g:workspace_autosave_untrailtabs = 0

nnoremap <leader>s :ToggleWorkspace<CR>



