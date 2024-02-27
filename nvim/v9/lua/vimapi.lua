
-- print(vim.loop.fs_stat('/home/zdz/.config/nvim/plugin/packer_compiled.lua'))

local vimscript = vim.api.nvim_exec
local function import(module)
  package.loaded[module] = nil
  return require(module)
end

local util = import('util')
print('util:',util)
-- print('util.write_file:',util.write_file)
-- util.write_file('/tmp/ccc', 'ccccc')
print('stdpath:',vim.fn.stdpath("data"))
-- vim.o.tabline = 'ranger'
print('expand:%:',vim.fn.expand('%')) -- 文件名
print('expand:(%:p):',vim.fn.expand('%:p'))-- 路径+文件名
print('isdirectory:',vim.fn.isdirectory(vim.fn.expand('%')))
print('filereadable:',vim.fn.filereadable)
print('readfile:',vim.fn.readfile)


print('filereadable:',vim.fn.filereadable(vim.fn.expand('/home/zdz/temp/aaa.md')))
print('filereadable:',vim.fn.filereadable(vim.fn.expand('/home/zdz/temp')))
-- 更改 /home/zdz/Application/neovim/nvim v6 -> v8 , 测试chansend ,termopen接口
-- /home/zdz/.zdz/ranger/rifle.conf
-- metatable 无法打印
print('vim.fn:======start=======')
for k,_ in pairs(util) do
  print(k)
end
print('vim.fn:======end=======')


local function filepath()
  print('expand:%:',vim.fn.expand('%')) -- 文件名
  print('isdirectory:',vim.fn.isdirectory(vim.fn.expand('%')))
  print('tempname:',vim.fn.tempname())
  vim.o.tabline = 'ccc'
  vimscript(':tab drop /home/zdz/.zdz/nvim/v8/init.lua', true)
  -- vim.cmd([[ :tab drop /home/zdz/.zdz/nvim/v8/init.lua ]])
end

vim.api.nvim_create_user_command('FF', filepath,{})
-- :lua vim.cmd('Filepath')
-- tabline 设置文件名
-- util.write_file('/tmp/xxx', vim.inspect(vim.o.tabline))
-- local cmd = 'sh '..os.getenv('CLIENV')..'/nvim/v8/vim/plugins/ranger.sh'
-- local cmd = 'ranger'..'--choosefiles='..filepath..' '..current_path

-- util.write_file('/tmp/xxx', 'cccdddfff')
-- vimscript(':tab drop /home/zdz/.zdz/nvim/v8/init.lua', true)
-- util.sleep(1)
-- vim.o.tabline = 'exitxx'
-- util.sleep(3)
-- local files = vim.loop.fs_read(fd,stat.size)
-- vimscript(':tab drop '..files, true)
-- util.write_file('/home/zdz/.zdz/nvim/api/api.md',vim.inspect(vim))
-- util.write_file('/home/zdz/.zdz/nvim/api/opt.md',vim.inspect(vim))

-- vim.cmd([[
--   
--   "" source $CLIENV/nvim/v8/vim/ranger.vim
--   "" source $CLIENV/nvim/v8/vim/plugins/ranger.vim
--   "" source $CLIENV/nvim/sources/plugins/fzf.vim
--   augroup TERM_MODE
--       autocmd!
--       " autocmd TermOpen * echom "TermOpen Events"
--       " autocmd TermEnter * echom "TermEnter Events"
--       " autocmd TermLeave * echom "TermLeave Events"
--       " autocmd TermClose * echom "TermClose Events"
--       ""autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
--       " autocmd TermClose * bdelete!
--   augroup END
--
--
--   ""source $CLIENV/nvim/v8/vim/dracula/dracula.vim
--   ""source $CLIENV/nvim/v8/vim/dracula/autoload-dracula.vim
--   ""let g:dracula_colorterm = 0
--   
--   colorscheme dracula
--   hi Normal guibg=NONE
--
--   au OptionSet showtabline :set showtabline=1
--
--   "" 配置ranger 背景
--   hi def NvimFloatingWindow  term=None guifg=white guibg=None ctermfg=white ctermbg=210
--   "" 配置ranger 边框
--   hi def NvimFloatingBorder  term=None guifg=#668a95 guibg=None ctermfg=white ctermbg=1
--
--   :set showtabline=0
--
-- ]])
--
-- statusline=%#lualine_a_mode#  CM %#lualine_b_branch#  master %<%#lualine_c_3# %t %m %#lualine_c_command#%=%#lualine_y_fileformat# unix %#lualine_z_progress# Top %#lualine_z_location#   1:1
-- hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
