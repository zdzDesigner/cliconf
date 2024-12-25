-- ===================================================
vim.g.my_version = 'v9'
vim.g.my_rootpath = '/home/zdz/.zdz/nvim/' .. vim.g.my_version
vim.opt.rtp:prepend(vim.g.my_rootpath)
vim.opt.packpath:prepend(vim.g.my_rootpath)
-- ===================================================
local G = require('G')
G.setup(vim.g.my_version, vim.g.my_rootpath)

-- print(vim.inspect(vim.opt.packpath:get()))
-- print('vim.lsp::',vim.lsp.start)
-- require('plugins/fzf/mappings')
-- require('plugins/fzf/init')
-- import('vimapi')

-- import('plugins/colors/init').set('embark')
-- import('plugins/colors/init').set('onedark')
local util = G.import('util')
G.import('plugins/init')
G.import('lsp/init')
G.import('dap/dap')
G.import('plugins/ranger')
G.import('keymap')
G.import('setting')


-- 在 Neovim 的 init.lua 文件中设置 GOARCH 和 GOOS 环境变量
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.go",
  callback = function()
    if util.go_js() then
      vim.env.GOARCH = "wasm"
      vim.env.GOOS = "js"
      print("Setting GOARCH=wasm GOOS=js for WebAssembly project")
    end
    -- local file_name = vim.fn.expand('%:t')
    -- if file_name:match("main.go") then
    --   vim.env.GOARCH = "wasm"
    --   vim.env.GOOS = "js"
    --   print("Setting GOARCH=wasm GOOS=js for WebAssembly project")
    -- end
  end,
})
-- vim.cmd('source $CLIENV/nvim/' .. G.version .. '/vim/scripts/base.vim')
-- vim.cmd(string.format('source $CLIENV/nvim/%s/vim/scripts/base.vim', G.version))
vim.cmd([[ source $CLIENV/nvim/]] .. G.version .. [[/vim/markdown.vim ]])
-- vim.cmd([[ source $CLIENV/nvim/]] .. G.version .. [[/vim/comment.vim ]])
vim.cmd([[ source $CLIENV/nvim/]] .. G.version .. [[/vim/scripts/base.vim ]])
vim.cmd([[ source $CLIENV/nvim/]] .. G.version .. [[/vim/scripts/replace.vim ]])
vim.cmd([[
  " 注释
  " source $CLIENV/nvim/v8/vim/comment.vim
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
  " autocmd BufNewFile,BufRead *.vue set filetype=html
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
