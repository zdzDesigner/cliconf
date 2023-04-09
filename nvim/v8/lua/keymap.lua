local G = require('G')
local fn = G.import('function')
-- local buf = import('buffer')
local Ranger = G.import('plugins/ranger')
-- 空格作为前缀

vim.g.mapleader = ' '
G.map({
-- {{mode},{lhs},{rhs},{*opts}},
-- nop
{'', '<C-a>', '<nop>', { desc = 'nop 冲突@快速创建文件' }},
{'n', 'r', '<nop>', { desc = 'nop' }},
{'n', 's', '<nop>', { desc = 'nop' }},
{'v', 'u', '<nop>', { noremap = true, silent = true, desc = '禁止visual 模式下转换小写，防止误碰' }},

{'', 'E', ':e<CR>', { noremap = true, silent = true, desc = '重置render' }},
-- {'','R',':source $MYVIMRC<CR>',{noremap = true, silent = true,desc='初始配置'}},
{'', 'R', ':source /home/zdz/.zdz/nvim/v8/init.lua<CR>', { noremap = true, silent = true, desc = '初始配置' }},

-- cursor jlkh
{'n', 'H', '0', { noremap = true, silent = true, desc = '列首' }},
{'v', 'H', '0', { noremap = true, silent = true, desc = '列首' }},
{'n', 'L', '$', { noremap = true, silent = true, desc = '列尾' }},
{'v', 'L', '$h', { noremap = true, silent = true, desc = 'V模式列尾' }},
{'', 'K', '6k', { noremap = true, silent = true, desc = '快速向下' }},
{'', 'J', '6j', { noremap = true, silent = true, desc = '快速向上' }},


{'n', 'sp', 'pldehbyp<CR>', { noremap = true, silent = true, desc = '头部替换word' }},
{'n', 'swp', 'pbhplde<CR>', { noremap = true, silent = true, desc = '中部替换word' }},

{'v', 'sj', ':join<CR>', { noremap = true, silent = true, desc = '合并一行' }},
{'', '<C-a>', ':tabnew  ~/temp/log/', { noremap = true, desc = '快速创建临时文件' }},


{'', 'S', ':w<CR>', { silent = true, desc = '保存' }},
{'', 'Q', ':q<CR>', { desc = '退出' }},


-- ===========
-- tab
-- ===========
-- tab

-- {'n','W',fn.TabCloseLeft,{ noremap = true, silent = true, desc='close cur tab'}},
{'n', 'W', ':bd<CR>', { noremap = true, silent = true, desc = 'close cur tab' }},
{'n', '<C-x>', ':bd<CR>', { noremap = true, silent = true, desc = 'close cur tab' }},
{'', '<C-_><C-_>', 'gc', { noremap = true, silent = true, desc = '注释' }},

-- 移动tab
-- {'','<C-j>',':tabp<CR>',{ noremap = true, silent = true, desc='tab prev'}},
-- {'','<C-k>',':tabn<CR>',{ noremap = true, silent = true, desc='tab next'}},
-- {'', '<C-j>', ':bp<CR>', { noremap = true, silent = true, desc = 'buffer prev' }},
-- {'', '<C-k>', buf.BufNNext, { noremap = true,  desc = 'buffer nnext' }},
-- {'', '<C-k>', ':bn<CR>', { noremap = true, silent = true, desc = 'buffer nnext' }},
{'', '<C-d>', ':b #<CR>', { noremap = true, silent = true, desc = '切换?' }},
{'', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true, desc = '新建tab' }},
{'', '<LEADER>0', ':tabfirst<CR>', { noremap = true, silent = true, desc = '跳转到第1个tab' }},
{'', '<LEADER>1', '1gt<CR>', { noremap = true, silent = true, desc = '第1个tab' }},
{'', '<LEADER>2', '2gt<CR>', { noremap = true, silent = true, desc = '第2个tab' }},
{'', '<LEADER>3', '3gt<CR>', { noremap = true, silent = true, desc = '第3个tab' }},
{'', '<LEADER>4', '4gt<CR>', { noremap = true, silent = true, desc = '第4个tab' }},
{'', '<LEADER>5', '5gt<CR>', { noremap = true, silent = true, desc = '第5个tab' }},
{'', '<LEADER>7', function() fn.TabJump(2) end, { noremap = true, silent = true, desc = '倒数第3个tab' }},
{'', '<LEADER>8', function() fn.TabJump(1) end, { noremap = true, silent = true, desc = '倒数第2个tab' }},
{'', '<LEADER>9', ':tablast<CR>', { noremap = true, silent = true, desc = '倒数第1个tab' }},
{'', '<LEADER>[', ':tabmove 0<CR>', { noremap = true, silent = true, desc = '移动到最左边' }},
{'', '<LEADER>]', ':tabmove<CR>', { noremap = true, silent = true, desc = '移动到最右边' }},
{'', '<LEADER>h', ':tabmove 0<CR>', { noremap = true, silent = true, desc = '移动到最左边' }},
{'', '<LEADER>l', ':tabmove<CR>', { noremap = true, silent = true, desc = '移动到最右边' }},
{'', '<LEADER>j', fn.TabPrev, { noremap = true, silent = true, desc = '移动到最左边' }},
{'', '<LEADER>k', fn.TabNext, { noremap = true, silent = true, desc = '移动到最右边' }},
{'', '<LEADER><CR>', ':nohlsearch<CR>', { noremap = true, silent = true, desc = '清除选中高亮' }},

{'', '<LEADER>jk', ':set splitright<CR>:vsplit<CR>', { noremap = true, silent = true, desc = '水平分屏' }},
{'', '<LEADER>kj', ':set splitright<CR>:vsplit<CR>', { noremap = true, silent = true, desc = '水平分屏' }},
{'', '<LEADER><CR>', ':nohlsearch<CR>', { noremap = true, silent = true, desc = '清除选中高亮' }},

{'', '<LEADER>m', ':messages<CR>', { noremap = true, silent = true, desc = '查看日志' }},



-- 寄存器复制
-- nnoremap <LEADER>y :call ZReg(}<CR>
{'n', '<LEADER>y', fn.ZReg, { noremap = true, silent = true, desc = '存储到寄存器' }},
-- nnoremap <LEADER>p "bp
{'n', '<LEADER>p', '"bp', { noremap = true, silent = true, desc = '从寄存器里取值->粘贴' }},
-- 删除word and paste
{'n', 'dp', 'diw<ESC>h<ESC>"0p', { noremap = true, silent = true, desc = '直接粘贴' }},

{'n', '<LEADER>8', fn.SetUTF8, { noremap = true, silent = true, desc = 'set utf8' }},


-- ====== 分栏跳转默认=======
-- <C-w>l
-- <C-w>h
-- <C-w>j
-- <C-w>k

-- ====== 缩进 =======
-- :1,10>   第1行至第10行右移动
-- :2,80<   第2行至第80行左移动

-- {'','<LEADER>f',':Prettier<CR>',{noremap=true,desc='格式化'}},
{'', '<LEADER>f', fn.Format, { noremap = true, desc = '格式化' }},
-- 调起 Ranger
-- {'','<LEADER>f', Ranger,{}},
{'', '<LEADER>;', Ranger, {}},
-- {'', '<LEADER>;', fn.LF, {}},

})



vim.cmd([[
" syntax on
"" set statusline +=%{resolve(expand('%:p'))}\ %*
exec "nohlsearch"
au FocusGained,BufEnter * :silent! !

noremap <silent> <C-g> :call AbsolutePath()<CR>
function! AbsolutePath()
    let @+=expand("%:p")
endfunction
]])







-- noremap <silent> <LEADER>j :call TabPrev(}<CR>
-- noremap <silent> <LEADER>k :call TabNext(}<CR>



