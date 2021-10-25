local lspconfig = require('lspconfig')
require('plugins/go')

lspconfig.tsserver.setup {}
lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            gofumpt = true,
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}
-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        -- This sets the spacing and the prefix, obviously.
        virtual_text = {
            spacing = 4,
            -- prefix = ''
            prefix = ''
        }
    }
)
-- vim.lsp.buf.document_highlight()
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]]) 

-- vim.lsp.buf.hover
-- 'ESC' key: show 'tip window', jump 'tip window', 'q' key quit 'tip window'
vim.api.nvim_set_keymap('n', '<C-[>', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})


-- vim.lsp.buf.definition
vim.api.nvim_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
