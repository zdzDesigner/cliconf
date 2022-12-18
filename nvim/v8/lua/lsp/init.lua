if not pcall(require, 'lspconfig') or not pcall(require, 'nvim-lsp-installer') then return end

-- 载入模块
require('lsp/diag')
require('lsp/icons')


-- default 'on_attach' function

-- 开启hover和help
-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'none' })
-- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

-- servers
-- local handlers =require('lsp/handlers')
require('lsp/installer')
