local G = require('G')


G.set({
  mouse = '',
  wrap = false,     -- 不换行
  swapfile = false, -- 无bak
  tabstop = 2,
  expandtab = true,
  shiftwidth = 2,
  softtabstop = -1,
  number = true,
  relativenumber = true, -- 相对行号
  cursorline = true,
  wildmenu = true,
  showcmd = true,
  hlsearch = true,           -- 设置搜索高亮
  incsearch = true,
  ignorecase = true,         -- 设置默认进行大小写不敏感查找
  smartcase = true,          -- 如果有一个大写字母，则切换到大小写敏感查找
  showtabline = 2,
  scrolloff = 10,            -- 上下预留空间
  foldmethod = 'indent',     -- 折叠方式
  foldlevel = 15,            -- 设置折叠层数
  encoding = 'utf-8',
  clipboard = 'unnamedplus', -- 剪切板
  smartindent = true,
  autoread = true,
  fileencodings = 'utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1'
})

-- 补全策略
-- vim.g.completeopt = "menu,menuone,noselect,noinsert"


-- 1. 设置剪贴板提供者为 Neovim 内置的 OSC 52
-- vim.g.clipboard = {
--   name = 'osc52',
--   copy = {
--     ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
--   },
--   paste = {
--     ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
--   },
-- }


-- 1. 定义 xclip 的配置 (本地使用，速度快)
local clipboard_xclip = {
  name = 'xclip',
  copy = {
    ['+'] = { 'xclip', '-selection', 'clipboard' },
    ['*'] = { 'xclip', '-selection', 'primary' },
  },
  paste = {
    ['+'] = { 'xclip', '-selection', 'clipboard', '-o' },
    ['*'] = { 'xclip', '-selection', 'primary', '-o' },
  },
  cache_enabled = 1,
}

-- 2. 定义 OSC 52 的配置 (远程/WSL 使用，为了解决 *p 慢的问题，这里禁用了粘贴)
local clipboard_osc52 = {
  name = 'OSC 52 copy-only',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    -- 关键点：这里直接返回空，避免 *p 触发 "Waiting for OSC 52 response" 卡顿
    ['+'] = function() return {} end,
    ['*'] = function() return {} end,
  },
}

-- 3. 切换函数
local function use_clipboard(provider)
  if provider == 'xclip' then
    vim.g.clipboard = clipboard_xclip
    print("✅ Clipboard provider switched to: xclip")
  elseif provider == 'osc52' then
    vim.g.clipboard = clipboard_osc52
    print("📡 Clipboard provider switched to: OSC 52 (copy-only)")
  else
    print("❌ Unknown provider. Use 'xclip' or 'osc52'")
  end
end

-- 4. 注册命令，方便在 Neovim 里手动调用
-- 用法 :Clip xclip 或 :Clip osc52
vim.api.nvim_create_user_command('Clip', function(opts)
  use_clipboard(opts.args)
end, {
  nargs = 1,
  complete = function()
    return { 'xclip', 'osc52' }
  end,
})

-- 5. (可选) 智能自动检测：如果是 SSH 连接，默认用 OSC 52，否则用 xclip
if vim.env.SSH_CLIENT or vim.env.SSH_TTY then
  use_clipboard('osc52')
else
  use_clipboard('xclip')
end

-- 2. 启用 unnamedplus
-- 这一步很关键，它让你直接使用 y/d/p 就对应到系统剪切板
-- 而不需要每次都输入 "+y
vim.opt.clipboard = 'unnamedplus'
