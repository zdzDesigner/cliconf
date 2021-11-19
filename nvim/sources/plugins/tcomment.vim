
" ===
" === tcomment_vim
" ===
" === ciw
" nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
" nmap <LEADER>ch g>c
" vmap <LEADER>ch g>
" nmap <LEADER>cl g<c
" vmap <LEADER>cl g<
" nmap <LEADER>h gcc
" vmap <LEADER>h gc

" <c-_><c-_>   :: :TComment
" <c-_><space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
" <c-_>b       :: :TCommentBlock
"                 In insert mode, the cursor will be positioned inside 
"                 the comment. In normal mode, the cursor will stay 
"                 put.
