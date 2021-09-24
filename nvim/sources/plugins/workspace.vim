" vim 中暂存插件
" lazygit let g:workspace_autocreate = 1
let g:workspace_persist_undo_history = 0
" 新tab自动保存
let g:workspace_create_new_tabs = 0
let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'

nnoremap <leader>s :ToggleWorkspace<CR>
