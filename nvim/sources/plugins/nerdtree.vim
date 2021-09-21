
" ===
" === NERDTree
" ===
" map TT :NERDTreeToggle<CR>
" map TF :NERDTreeFind<CR>
map <C-t> :NERDTreeFind<CR>
" 显示隐藏文件
let g:NERDTreeHidden=1
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

