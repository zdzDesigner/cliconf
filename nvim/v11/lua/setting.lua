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

