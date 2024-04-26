" 去除^M
function! CleanM() 
    :%s/\r//g
    :nohlsearch
endfunction


" 去除;
function! CleanF() 
    :%s/;$//g
    :nohlsearch
endfunction



" 去除;
function! CleanJ() 
    :%s/\\//g
    :nohlsearch
endfunction

