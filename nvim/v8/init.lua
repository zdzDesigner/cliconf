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
-- 清除jumps ctrl-o
vim.api.nvim_create_autocmd("VimEnter", { callback = function() vim.cmd.clearjumps() end })
-- print(vim.inspect(vim.opt.packpath:get()))
-- print('vim.lsp::',vim.lsp.start)
-- require('plugins/fzf/mappings')
-- require('plugins/fzf/init')
-- import('vimapi')

-- import('plugins/colors/init').set('embark')
-- import('plugins/colors/init').set('onedark')
import('test')
import('plugins/ranger')
import('keymap')
import('setting')


vim.cmd([[
  " 注释
  source $CLIENV/nvim/v8/vim/comment.vim
  noremap <silent> <C-_><C-_> :Commentary<CR>

  " markdown
  source $CLIENV/nvim/v8/vim/markdown.vim

  " 透明背景
  hi Normal guibg=NONE


  " 配置ranger 背景
  hi def NvimFloatingWindow  term=None guifg=white guibg=None ctermfg=white ctermbg=210
  " 配置ranger 边框
  hi def NvimFloatingBorder  term=None guifg=#668a95 guibg=None ctermfg=white ctermbg=1

  " 隐藏tab
  set showtabline=0

  " 日志
  set verbose=20
  set verbosefile=$HOME/.local/state/nvim/test.log

 
]])
