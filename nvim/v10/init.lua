-- ===================================================
vim.opt.rtp:prepend('/home/zdz/.zdz/nvim/v10')
vim.opt.packpath:prepend('/home/zdz/.zdz/nvim/v10')
-- ===================================================
local G = require('G')
G.setup('v10')

-- import('plugins/colors/init').set('embark')
-- import('plugins/colors/init').set('onedark')
G.import('plugins/init')
-- 回写路径
G.import('lsp/init')
G.import('dap/dap')
G.import('plugins/ranger')
G.import('keymap')
G.import('setting')



-- ===================================================
-- cmd ===============================================
-- ===================================================
-- vim.cmd('source $CLIENV/nvim/' .. G.version .. '/vim/scripts/base.vim')
-- vim.cmd(string.format('source $CLIENV/nvim/%s/vim/scripts/base.vim', G.version))
vim.cmd([[ source $CLIENV/nvim/]] .. G.version .. [[/vim/markdown.vim ]])
-- vim.cmd([[ source $CLIENV/nvim/]] .. G.version .. [[/vim/comment.vim ]])
vim.cmd([[ source $CLIENV/nvim/]] .. G.version .. [[/vim/scripts/base.vim ]])
vim.cmd([[ source $CLIENV/nvim/]] .. G.version .. [[/vim/scripts/replace.vim ]])
vim.cmd([[
  " 注释
  " noremap <silent> <C-_><C-_> :Commentary<CR>


  " 透明背景
  hi Normal guibg=NONE

  " 配置ranger 背景
  hi def NvimFloatingWindow  term=None guifg=white guibg=None ctermfg=white ctermbg=210
  " 配置ranger 边框
  hi def NvimFloatingBorder  term=None guifg=#668a95 guibg=None ctermfg=white ctermbg=1


  " 隐藏tab
  set showtabline=0

  " 日志
  set verbose=1
  set verbosefile=$HOME/.local/state/nvim/test.log
  " :messages 查看当前窗口print日志

  " 更改解析文件类型
  autocmd BufNewFile,BufRead *.wxml set filetype=html
  autocmd BufNewFile,BufRead *.iss set filetype=pascal
  autocmd BufNewFile,BufRead *.zon set filetype=zig

  " 设置c缩进
  autocmd FileType c setlocal shiftwidth=4


  " 配置xmake.lua文件不提示
  augroup LspDiagnosticConfig
    autocmd!
    autocmd BufEnter * lua require('lsp/diag').underline()
  augroup END

]])
