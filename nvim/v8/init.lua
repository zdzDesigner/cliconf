local function import(module)
  package.loaded[module] = nil
  return require(module)
end
vim.o.exrc = true
vim.o.secure = true

-- 运行路径和包路径都要设置
vim.opt.packpath:append('/home/zdz/.config/nvim/v8')
vim.opt.rtp:append('/home/zdz/.config/nvim/v8')

-- print(vim.inspect(vim.opt.packpath:get()))
import('vimapi')
import('setting')
import('keymap')
import('test')
import('plugins/ranger')

local vimscript = vim.api.nvim_exec

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





vim.cmd([[
  "" 配置ranger 背景
  hi def NvimFloatingWindow  term=None guifg=white guibg=None ctermfg=white ctermbg=210
  "" 配置ranger 边框
  hi def NvimFloatingBorder  term=None guifg=#668a95 guibg=None ctermfg=white ctermbg=1
  

  "" source $CLIENV/nvim/v8/vim/ranger.vim
  "" source $CLIENV/nvim/v8/vim/plugins/ranger.vim



  augroup TERM_MODE
      autocmd!
      " autocmd TermOpen * echom "TermOpen Events"
      " autocmd TermEnter * echom "TermEnter Events"
      " autocmd TermLeave * echom "TermLeave Events"
      " autocmd TermClose * echom "TermClose Events"
      autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
      " autocmd TermClose * bdelete!
  augroup END

  :cle

]])
-- 清除jumps ctrl-o
vim.api.nvim_create_autocmd("VimEnter", { callback = function() vim.cmd.clearjumps()  end })



-- local compile_suffix = "/plugin/packer_compiled.lua"
-- local install_suffix = "/site/pack/packer/%s/packer.nvim"
-- local install_path = vim.fn.stdpath("data") .. string.format(install_suffix, "opt")
-- local compile_path = vim.fn.stdpath("data") .. compile_suffix

-- print(vim.inspect({
--   compile_suffix = compile_suffix,
--   install_suffix = install_suffix,
--   install_path = install_path,
--   compile_path = compile_path,
-- }))

-- for key,val in pairs(vim.opt.runtimepath) do
-- print(key,val)
-- end

-- opt api 
-- :get()
-- :append()
-- prepend()
-- :remove()
-- print(vim.inspect(vim.opt:get()))
-- print(vim.inspect(vim.opt.runtimepath:get()))


-- util.write_file('/home/zdz/.zdz/nvim/api/api.md',vim.inspect(vim))
-- util.write_file('/home/zdz/.zdz/nvim/api/opt.md',vim.inspect(vim))



