-- if not pcall(require, "lspconfig") then return end -- 保护调用加载模块
-- local lspconfig = require('lspconfig')

-- https://rust-analyzer.github.io/manual.html#vimneovim
return {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        disabled = { "unlinked-file" }, -- 禁用 unlinked-file 警告
      },
    },
  }
}
