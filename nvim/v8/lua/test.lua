-- vim.opt.runtimepath:remove(vim.fn.expand("~/.config/nvim"))
-- vim.opt.packpath:remove(vim.fn.expand("~/.local/share/nvim/site"))
vim.opt.termguicolors = true

-- append test directory
local test_dir = '/home/zdz/.config/nvim/v8'
-- vim.opt.runtimepath:append(vim.fn.expand(test_dir))
-- vim.opt.packpath:append(vim.fn.expand(test_dir))
print('test_dir::',test_dir)


function plugin(use)
  print('----------start------xx---')
  use('wbthomason/packer.nvim')
  -- optional for fzf-lua, telescope, nvim-tree, feline
  use({
    'kyazdani42/nvim-web-devicons',
    config = "require('plugins.devicons')",
    event = 'VimEnter'
  })

  -- fancy statusline
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('plugins.statusline')",
    after = 'nvim-web-devicons',
    event = 'VimEnter'
  })

  use({
    'VonHeikemen/little-wonder',
    setup = function()print('xxx')end,
  })
  -- use({
  --   'plugins.vv',
  --   config = function()print('config')end,
  --   setup = function()print('setup')end,
  -- })
  -- require('plugins.statusline')
  -- require('nvim-lualine/lualine.nvim')
  -- require('plugins.vv')
  -- require('plugins.statusline')
  -- require('plugins.devicons')

  print('----------start------xx---')
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



