-- vim.opt.runtimepath:remove(vim.fn.expand("~/.config/nvim"))
-- vim.opt.packpath:remove(vim.fn.expand("~/.local/share/nvim/site"))
vim.opt.termguicolors = true

-- append test directory
local test_dir = '/home/zdz/.config/nvim/v8'
-- vim.opt.runtimepath:append(vim.fn.expand(test_dir))
-- vim.opt.packpath:append(vim.fn.expand(test_dir))
-- print('test_dir::',test_dir)


local function plugin(use)

  use('wbthomason/packer.nvim')
  
  use('jiangmiao/auto-pairs') -- 成对符号
  -- use({ -- 快速删除或替换对称符号
  --   "kylechui/nvim-surround",
  --   tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   config = function()
  --       require("nvim-surround").setup({
  --           -- Configuration here, or leave empty to use defaults
  --       })
  --   end
  -- })

  use({
    'kyazdani42/nvim-web-devicons',
    config = "require('plugins/devicons')",
    event = 'VimEnter'
  })

  -- use('itchyny/lightline.vim')
  use({
    'nvim-lualine/lualine.nvim',
    -- requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('plugins/statusline')",
    after = 'nvim-web-devicons',
    event = 'VimEnter'
  })

  use({
    'ibhagwan/fzf-lua',
    requires = {
      { 'vijaymarupudi/nvim-fzf' },
      { 'kyazdani42/nvim-web-devicons' },
    },
    setup = "require('plugins/fzf/mappings')",
    config = "require('plugins/fzf/init')",
    opt = true,
  })

  if require('util').have_compiler() then
    -- TSxxx
    use({
      'nvim-treesitter/nvim-treesitter',
      config = "require('plugins/treesitter')",
      run = ':TSUpdate',
      event = 'BufRead'
    })
    use({ 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } })
  end

  use('nvim-lua/plenary.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim') -- 格式化

  use({ -- Theme
    'Mofiqul/dracula.nvim',
    config = "require('plugins/dracula')",
  })

  use({  -- Snip
    'L3MON4D3/LuaSnip',
    config = 'require("plugins/luasnip")',
    event = 'InsertEnter' 
  }) 

  -- LSP
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    },
    config = "require('plugins/cmp')",
    -- event = "InsertEnter", }
    after = 'LuaSnip' }
  )
  use({ 'neovim/nvim-lspconfig',    event = 'BufRead' })
  use({
    'williamboman/nvim-lsp-installer',
    config = function()
      require('lsp')
      -- ':command LspStart'
      -- require'lspconfig'._root.commands.LspStart[1]()
    end,
    after  = { 'nvim-lspconfig' },
  })

  use({
    'dhruvasagar/vim-table-mode',
    opt = true,
    cmd = {'TableModeToggle'},
  })

  use({
     'natecraddock/sessions.nvim', 
     config = "require('plugins/sessions')",
  })
  use({
    'natecraddock/workspaces.nvim',
    requires = {
      { 'natecraddock/sessions.nvim', after='workspaces.nvim' },
    },
     -- opt = true,
     config = "require('plugins/workspaces')",
  })


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

  end

  local packer = require("packer")

  local config = {
    package_root = test_dir .. "/pack", -- 包路径
    compile_path = test_dir .. "/plugin/packer_compiled.lua", -- 编译结果
  }
  packer.init(config)
  packer.startup(plugin)
  -- print(config.compile_path,vim.inspect(vim.loop.fs_stat(config.compile_path)))
  if not vim.loop.fs_stat(config.compile_path) then
    packer.sync()
  end


  -- use({
    --   'plugins.vv',
    --   config = function()print('config')end,
    --   setup = function()print('setup')end,
    -- })
