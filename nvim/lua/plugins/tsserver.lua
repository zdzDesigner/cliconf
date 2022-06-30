local lspconfig = require('lspconfig')

lspconfig.tsserver.setup{
  filetypes = {"tsx","ts","jsx","typescript","javascript","javascript.jsx","typescript.tsx"},
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual_text
        underline = false,
        update_in_insert = false,
        virtual_text = false,
        -- signs = false -- 左侧图标
      }
    ),
  },
}

vim.cmd([[autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx]])
vim.cmd([[autocmd BufNewFile,BufRead *_vsyntaxoff*.* setlocal filetype=log]]) -- 更改类型, 禁止高亮
vim.cmd([[autocmd BufNewFile,BufRead *_vsyntaxoff*.* lua vim.diagnostic.disable(<abuf>)]]) -- 禁止诊断


-- local tsconfig = require('plugins/tsconfig')
-- vim.cmd([[setlocal includeexpr=tsconfig.includeexpr(v:fname)]])

