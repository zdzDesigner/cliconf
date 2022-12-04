-- vim.opt.runtimepath:remove(vim.fn.expand("~/.config/nvim"))
-- vim.opt.packpath:remove(vim.fn.expand("~/.local/share/nvim/site"))
vim.opt.termguicolors = true

-- append test directory
local test_dir = vim.fn.stdpath('data')
-- vim.opt.runtimepath:append(vim.fn.expand(test_dir))
-- vim.opt.packpath:append(vim.fn.expand(test_dir))
print('test_dir::',test_dir)


function plugin(use)
  use('wbthomason/packer.nvim')
  -- optional for fzf-lua, telescope, nvim-tree, feline
  use({
    'kyazdani42/nvim-web-devicons',
    config = "require('v8.plugins.devicons')",
    event = 'VimEnter'
  })

  -- fancy statusline
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('v8.plugins.statusline')",
    after = 'nvim-web-devicons',
    event = 'VimEnter'
  })

  use({'VonHeikemen/little-wonder'})

end

local packer = require("packer")

local config = {
  package_root = test_dir .. "/pack", -- 包路径
  compile_path = test_dir .. "/plugin/packer_compiled.lua", -- 编译结果
}
packer.init(config)

if not vim.loop.fs_stat(config.compile_path) then
  packer.startup(plugin)
  packer.sync()
end



