if not pcall(require, "lspconfig") then return end -- 保护调用加载模块
local util = require('lspconfig/util')
local lastRootPath = nil
local gopath = os.getenv("GOPATH")
if gopath == nil then
  gopath = "/home/zdz/go"
end
local gopathmod = gopath .. '/pkg/mod'

return {
  cmd = { "gopls" },
  settings = {
    gopls = {
      allowModfileModifications = true,
      gofumpt = true,
      completion = {
        usePlaceholders = true,
      },
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = false,
  },
  -- 解决依赖pak/mod/第三方模块 jump to define 无效 https://github.com/neovim/nvim-lspconfig/issues/804
  root_dir = function(fname)
    local fullpath = vim.fn.expand(fname, ':p')
    if string.find(fullpath, gopathmod) and lastRootPath ~= nil then
      return lastRootPath
    end
    lastRootPath = util.root_pattern("go.mod", ".git")(fname)
    return lastRootPath
  end,
}
