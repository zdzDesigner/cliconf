local function import(module)
  package.loaded[module] = nil
  return require(module)
end
local fn = import('function')
local Ranger = import('plugins/ranger')
vim.g.mapleader = ' '
local keymap = vim.keymap

-- keymap.set({mode},{lhs},{rhs},{*opts})

-- nop
keymap.set('','<C-a>','<nop>',{desc='nop 冲突@快速创建文件'})
keymap.set('n','r','<nop>',{desc='nop'})
keymap.set('n','s','<nop>',{desc='nop'})
keymap.set('v','u','<nop>',{noremap = true, silent = true,desc='禁止visual 模式下转换小写，防止误碰'})

keymap.set('','E',':e<CR>',{noremap = true, silent = true,desc='重置render'})
-- keymap.set('','R',':source $MYVIMRC<CR>',{noremap = true, silent = true,desc='初始配置'})
keymap.set('','R',':source /home/zdz/.zdz/nvim/v8/init.lua<CR>',{noremap = true, silent = true,desc='初始配置'})

-- cursor jlkh
keymap.set('n','H','0',{noremap = true, silent = true,desc='列首'})
keymap.set('n','L','$',{noremap = true, silent = true,desc='列尾'})
keymap.set('v','L','$h',{noremap = true, silent = true,desc='V模式列尾'})
keymap.set('n','K','6k',{noremap = true, silent = true,desc='快速向下'})
keymap.set('n','J','6j',{noremap = true, silent = true,desc='快速向上'})


keymap.set('n','sp','pldehbyp<CR>',{noremap = true, silent = true,desc='头部替换word'})
keymap.set('n','swp','pbhplde<CR>',{noremap = true, silent = true,desc='中部替换word'})

keymap.set('v','sj',':join<CR>',{noremap = true, silent = true,desc='合并一行'})
keymap.set('','<C-a>',':tabnew  ~/temp/log/',{noremap = true,desc='快速创建临时文件'})


keymap.set('','S',':w<CR>',{silent=true,desc='保存'})
keymap.set('','<LEADER>f',':Prettier<CR>',{noremap=true,desc='格式化'})
keymap.set('','Q',':q<CR>',{desc='退出'})


-- ===========
-- tab
-- ===========
-- tab

-- keymap.set('n','W',fn.TabCloseLeft,{ noremap = true, silent = true, desc='close cur tab'})
keymap.set('n','W',':bd<CR>',{ noremap = true, silent = true, desc='close cur tab'})
keymap.set('n','<C-d>',':bd<CR>',{ noremap = true, silent = true, desc='close cur tab'})

-- 移动tab
keymap.set('','<C-j>',':tabp<CR>',{ noremap = true, silent = true, desc='tab prev'})
keymap.set('','<C-k>',':tabn<CR>',{ noremap = true, silent = true, desc='tab next'})
keymap.set('','<C-x>',':tabn #<CR>',{ noremap = true, silent = true, desc='切换?'})
keymap.set('','<C-t>',':tabnew<CR>',{ noremap = true, silent = true, desc='新建tab'})
keymap.set('','<LEADER>0',':tabfirst<CR>',{ noremap = true, silent = true, desc='跳转到第1个tab'})
keymap.set('','<LEADER>1','1gt<CR>',{ noremap = true, silent = true, desc='第1个tab'})
keymap.set('','<LEADER>2','2gt<CR>',{ noremap = true, silent = true, desc='第2个tab'})
keymap.set('','<LEADER>3','3gt<CR>',{ noremap = true, silent = true, desc='第3个tab'})
keymap.set('','<LEADER>4','4gt<CR>',{ noremap = true, silent = true, desc='第4个tab'})
keymap.set('','<LEADER>5','5gt<CR>',{ noremap = true, silent = true, desc='第5个tab'})
keymap.set('','<LEADER>7',function() fn.TabJump(2) end,{ noremap = true, silent = true, desc='倒数第3个tab'})
keymap.set('','<LEADER>8',function() fn.TabJump(1) end,{ noremap = true, silent = true, desc='倒数第2个tab'})
keymap.set('','<LEADER>9',':tablast<CR>',{ noremap = true, silent = true, desc='倒数第1个tab'})
keymap.set('','<LEADER>[',':tabmove 0<CR>',{ noremap = true, silent = true, desc='移动到最左边'})
keymap.set('','<LEADER>]',':tabmove<CR>',{ noremap = true, silent = true, desc='移动到最右边'})
keymap.set('','<LEADER>h',':tabmove 0<CR>',{ noremap = true, silent = true, desc='移动到最左边'})
keymap.set('','<LEADER>l',':tabmove<CR>',{ noremap = true, silent = true, desc='移动到最右边'})
keymap.set('','<LEADER>j',fn.TabPrev,{ noremap = true, silent = true, desc='移动到最左边'})
keymap.set('','<LEADER>k',fn.TabNext,{ noremap = true, silent = true, desc='移动到最右边'})
keymap.set('','<LEADER><CR>',':nohlsearch<CR>',{ noremap = true, silent = true, desc='清除选中高亮'})

-- keymap.set('','<LEADER>f', Ranger,{})
keymap.set('','<LEADER>;', Ranger,{})







-- noremap <silent> <LEADER>j :call TabPrev()<CR>
-- noremap <silent> <LEADER>k :call TabNext()<CR>



-- print('KEYMAP')

