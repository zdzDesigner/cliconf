-- local function plugin(use)
--   use('wbthomason/packer.nvim')
--   use('jiangmiao/auto-pairs') -- 成对符号
--   -- use({ -- 快速删除或替换对称符号
--   --   "kylechui/nvim-surround",
--   --   tag = "*", -- Use for stability; omit to use `main` branch for the latest features
--   --   config = function()
--   --       require("nvim-surround").setup({
--   --           -- Configuration here, or leave empty to use defaults
--   --       })
--   --   end
--   -- })
--
--   use({
--     'kyazdani42/nvim-web-devicons',
--     config = "require('plugins/devicons')",
--     -- 加载条件
--     event = 'VimEnter'
--   })
--
--   use({
--     'nvim-lualine/lualine.nvim',
--     -- requires = { 'kyazdani42/nvim-web-devicons' },
--     config = "require('plugins/statusline')",
--     after = 'nvim-web-devicons',
--     event = 'VimEnter'
--   })
--
--   use({
--     'ibhagwan/fzf-lua',
--     requires = {
--       { 'vijaymarupudi/nvim-fzf' },
--       { 'kyazdani42/nvim-web-devicons' },
--     },
--     setup = "require('plugins/fzf/mappings')",
--     config = "require('plugins/fzf/init')",
--     opt = true,
--   })
--
--   if require('util').have_compiler() then
--     -- TSxxx
--     use({
--       'nvim-treesitter/nvim-treesitter',
--       config = "require('plugins/treesitter')",
--       run = ':TSUpdate',
--       event = 'BufRead'
--     })
--     -- use({ 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } })
--     use({
--       "nvim-treesitter/nvim-treesitter-textobjects",
--       after = "nvim-treesitter",
--       requires = "nvim-treesitter/nvim-treesitter",
--     })
--   end
--
--   use('nvim-lua/plenary.nvim')
--   use({
--     'jose-elias-alvarez/null-ls.nvim',
--     config = function()
--       require('null-ls').register({
--         -- 避免覆盖其它lsp
--         filetypes = { "text" },
--         -- toggler = { line = '<C-_><C-_>', block = 'gbc' },
--       })
--     end
--   })
--   use({
--     'MunifTanjim/prettier.nvim',
--     config = 'require("plugins/prettier")',
--   }) -- 格式化
--
--   use({
--     -- Theme
--     'Mofiqul/dracula.nvim',
--     config = "require('plugins/dracula')",
--   })
--
--
--   -- LSP
--   use({
--     'hrsh7th/nvim-cmp',
--     requires = {
--       { 'hrsh7th/cmp-path',         after = 'nvim-cmp' },
--       { 'hrsh7th/cmp-buffer',       after = 'nvim-cmp' },
--       { 'hrsh7th/cmp-nvim-lsp',     after = 'nvim-cmp' },
--       { 'hrsh7th/cmp-nvim-lua',     after = 'nvim-cmp' },
--       { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
--     },
--     config = 'require("plugins/cmp")',
--     -- event = "InsertEnter", }
--     after = { 'LuaSnip' }
--   })
--
--   use({
--     -- Snip
--     'L3MON4D3/LuaSnip',
--     config = 'require("plugins/luasnips/init")',
--     event = 'InsertEnter'
--   })
--
--   use({
--     "pcolladosoto/tinygo.nvim",
--     config = function() require("tinygo").setup() end
--   })
--
--   -- ======  bug (loop or previous error loading module 'cmp_luasnip_choice')
--   -- use {
--   --   'L3MON4D3/cmp-luasnip-choice',
--   --   config = function()
--   --     require('cmp_luasnip_choice').setup({
--   --       auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
--   --     });
--   --   end,
--   -- }
--
--   use({
--     'williamboman/mason.nvim',
--     run = ":MasonUpdate"
--   })
--   use({ 'williamboman/mason-lspconfig.nvim' })
--   use({ 'neovim/nvim-lspconfig' })
--   use({ 'mfussenegger/nvim-dap' })
--   use({ 'jay-babu/mason-nvim-dap.nvim' })
--   use({ 'rcarriga/nvim-dap-ui' })
--   use({
--     'folke/neodev.nvim',
--     config = 'require("plugins/neodev")'
--   })
--   -- use({
--   --   'jedrzejboczar/nvim-dap-cortex-debug',
--   --   requires = 'mfussenegger/nvim-dap'
--   -- })
--
--
--   -- 代码片段
--   -- use('SirVer/ultisnips')
--
--
--   -- use({
--   --   'williamboman/nvim-lsp-installer',
--   --   config   = function()
--   --     require('lsp')
--   --     -- ':command LspStart'
--   --   end,
--   --   after    = { 'nvim-lspconfig' },
--   -- })
--   -- use({
--   --   'neovim/nvim-lspconfig',
--   --   event = 'BufRead'
--   -- })
--
--   use({
--     'dhruvasagar/vim-table-mode',
--     opt = true,
--     cmd = { 'TableModeToggle' },
--   })
--
--   use({
--     'natecraddock/sessions.nvim',
--     config = "require('plugins/sessions')",
--   })
--   use({
--     'natecraddock/workspaces.nvim',
--     requires = {
--       { 'natecraddock/sessions.nvim', after = 'workspaces.nvim' },
--     },
--     -- opt = true,
--     config = "require('plugins/workspaces')",
--   })
--
--   use({
--     'numToStr/Comment.nvim',
--     config = function()
--       require('Comment').setup({
--         -- toggler = { line = '<C-_><C-_>', block = 'gbc' },
--       })
--     end
--   })

-- use('ziglang/zig.vim')
-- use {
--   'huggingface/llm.nvim',
--   config = "require('plugins/llm')",
-- }
-- use {
--   'huggingface/llm.nvim',
--   config = function()
--     require('llm').setup({
--       -- cf Setup
--     })
--   end
-- }
-- ssh 远程编辑
-- use {
--   'chipsenkbeil/distant.nvim',
--   config = function()
--     require('distant').setup {
--       -- Applies Chip's personal settings to every machine you connect to
--       --
--       -- 1. Ensures that distant servers terminate with no connections
--       -- 2. Provides navigation bindings for remote directories
--       -- 3. Provides keybinding to jump into a remote file's parent directory
--       ['*'] = require('distant.settings').chip_default()
--     }
--   end
-- }


-- use({ 'dracula/vim',as='dracula' })

-- use({
-- 'VonHeikemen/little-wonder',
-- setup = function()print('xxx')end,
-- })
-- end


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"



local lazy = require("lazy")
lazy.setup({
  {
    -- Theme
    'Mofiqul/dracula.nvim',
    config = function() require('v10/lua/plugins/dracula') end,
  },
  -- {
  --   'dracula/vim',
  --   name = 'dracula'
  -- },
  -- icons
  {
    'kyazdani42/nvim-web-devicons',
    event = 'VimEnter',
    config = function() require('v10/lua/plugins/devicons') end,
  },
  -- 底部状态栏
  {
    'nvim-lualine/lualine.nvim',
    -- event = 'VimEnter',
    config = function() require('v10/lua/plugins/statusline') end,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  -- 提示
  { 'jiangmiao/auto-pairs' },
  -- 提示
  -- LSP
  { 'neovim/nvim-lspconfig' },
  -- 格式化
  {
    'MunifTanjim/prettier.nvim',
    config = function() require("v10/lua/plugins/prettier") end,
  },
})
