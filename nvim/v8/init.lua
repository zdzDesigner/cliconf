local function import(module)
  package.loaded[module] = nil
  return require(module)
end
vim.o.exrc = true
vim.o.secure = true

-- 运行路径和包路径都要设置
vim.opt.packpath:prepend('/home/zdz/.config/nvim/v8') -- 插件模块
vim.opt.packpath:prepend('/home/zdz/.zdz/nvim/v8') -- 自定义配置模块
vim.opt.rtp:prepend('/home/zdz/.config/nvim/v8')
vim.opt.rtp:prepend('/home/zdz/.zdz/nvim/v8')
-- print(vim.inspect(vim.opt.packpath:get()))
-- print('vim.lsp::',vim.lsp.start)
-- require('plugins/fzf/mappings')
-- require('plugins/fzf/init')
-- import('vimapi')
import('setting')
import('test')
import('plugins/ranger')
import('keymap')

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
  
  "" source $CLIENV/nvim/v8/vim/ranger.vim
  "" source $CLIENV/nvim/v8/vim/plugins/ranger.vim
  "" source $CLIENV/nvim/sources/plugins/fzf.vim


  augroup TERM_MODE
      autocmd!
      " autocmd TermOpen * echom "TermOpen Events"
      " autocmd TermEnter * echom "TermEnter Events"
      " autocmd TermLeave * echom "TermLeave Events"
      " autocmd TermClose * echom "TermClose Events"
      ""autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
      " autocmd TermClose * bdelete!
  augroup END

  "" :cle

  ""source $CLIENV/nvim/v8/vim/dracula/dracula.vim
  ""source $CLIENV/nvim/v8/vim/dracula/autoload-dracula.vim
  ""let g:dracula_colorterm = 0
  
  colorscheme dracula
  hi Normal guibg=NONE

  au OptionSet showtabline :set showtabline=1

  "" 配置ranger 背景
  hi def NvimFloatingWindow  term=None guifg=white guibg=None ctermfg=white ctermbg=210
  "" 配置ranger 边框
  hi def NvimFloatingBorder  term=None guifg=#668a95 guibg=None ctermfg=white ctermbg=1

  :set showtabline=0

]])
-- 清除jumps ctrl-o
vim.api.nvim_create_autocmd("VimEnter", { callback = function() vim.cmd.clearjumps()  end })






