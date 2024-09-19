local G = require('G')

-- Bootstrap lazy.nvim
local lazyroot = G.rootpath .. "/lua/lazy"
local lazypath = lazyroot .. "/lazy.nvim"
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
-- vim.opt.rtp:prepend('/home/zdz/.zdz/nvim/v10')
-- vim.opt.packpath:prepend('/home/zdz/.zdz/nvim/v10')
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local lazy = require("lazy")

lazy.setup({
  -- 安装目录
  root = lazyroot,
  -- root = '/home/zdz/.zdz/nvim/v10/lua/lazy',
  spec = {
    {
      -- Theme
      'Mofiqul/dracula.nvim',
      -- config = function() require('plugins/dracula') end,
      config = function() G.import('plugins/dracula') end,
    },
    -- { 'dracula/vim', name = 'dracula' },
    -- icons
    {
      'kyazdani42/nvim-web-devicons',
      config = function() require('plugins/devicons') end,
      event = 'VimEnter',
    },
    -- 底部状态栏
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
      config = function() G.import('plugins/statusline') end,
      event = 'VimEnter',
    },
    -- 提示
    { 'jiangmiao/auto-pairs' },
    -- 提示
    -- 格式化
    {
      'MunifTanjim/prettier.nvim',
      config = function() G.import("plugins/prettier") end,
    },

    -- fzf
    {
      'ibhagwan/fzf-lua',
      dependencies = {
        'vijaymarupudi/nvim-fzf',
        'kyazdani42/nvim-web-devicons',
      },
      init = function() G.import('plugins/fzf/mappings') end,
      config = function() G.import('plugins/fzf/init') end,
      lazy = true,
    },

    -- 高亮
    {
      'nvim-treesitter/nvim-treesitter',
      config = function() G.import('plugins/treesitter') end,
      build = ':TSUpdate',
      event = 'BufRead',
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- 将外部工具（如代码格式化工具、诊断工具、代码片段和其他语言服务器功能）
    -- 无缝地集成到 Neovim 的内置 LSP（Language Server Protocol）框架中。
    -- 它的主要功能是通过一种“虚拟”语言服务器方式，允许 Neovim 使用本地可执行文件来提供 LSP 功能，而不需要真实的语言服务器。
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        -- 从当前插件文件路径查找
        require('null-ls').register({
          -- 避免覆盖其它lsp
          filetypes = { "text" },
          -- toggler = { line = '<C-_><C-_>', block = 'gbc' },
        })
      end
    },
    -- 补全
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'saadparwaiz1/cmp_luasnip',
        'LuaSnip'
      },
      config = function() G.import("plugins/cmp") end,
      -- event = "InsertEnter",
    },
    -- Snip
    {
      'L3MON4D3/LuaSnip',
      config = function() G.import("plugins/luasnips/init") end,
      event = 'InsertEnter'
    },

    -- LSP
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim', },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'mfussenegger/nvim-dap' },
    { 'jay-babu/mason-nvim-dap.nvim' },
    { 'rcarriga/nvim-dap-ui' },

    -- toggle table
    {
      'dhruvasagar/vim-table-mode',
      cmd = { 'TableModeToggle' },
      lazy = true,
    },

    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
          -- toggler = { line = '<C-_><C-_>', block = 'gbc' },
        })
      end
    },


    -- LLM Behaviour Cursor
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      lazy = false,
      version = false, -- set this if you want to always pull the latest change
      config = function() G.import('plugins/avante') end,
      opts = {
        -- add any opts here
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua",      -- for providers='copilot'
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    }



    -- use('ziglang/zig.vim')
    -- LLM
    -- use {
    --   'huggingface/llm.nvim',
    --   config = "require('plugins/llm')",
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

    -- 配色
    -- use({
    -- 'VonHeikemen/little-wonder',
    -- setup = function()print('xxx')end,
    -- })

    -- lua 插件开发工具库
    -- {'nvim-lua/plenary.nvim'}
    -- {
    --   'folke/neodev.nvim',
    --   config = function() G.import("plugins/neodev") end
    -- },
    -- {'folke/lazydev.nvim'}



    -- tinygo嵌入式更改gopls
    -- {
    --   "pcolladosoto/tinygo.nvim",
    --   config = function() require("tinygo").setup() end
    -- }


    -- {
    --   'natecraddock/sessions.nvim',
    --   config = function() G.import('plugins/sessions') end,
    -- },
    -- {
    --   'natecraddock/workspaces.nvim',
    --   requires = {
    --     { 'natecraddock/sessions.nvim', after = 'workspaces.nvim' },
    --   },
    --   -- lazy = true,
    --   config = function() g.import('plugins/workspaces') end,
    -- },

  }
})
