local lspconfig = require('lspconfig')


lspconfig.tsserver.setup{}
lspconfig.bashls.setup{}
require('plugins/go')
-- require('plugins/vue')
require('plugins/lua')


-- require('lspfuzzy').setup {}


-- 提示
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        -- update_in_insert = false,
        -- This sets the spacing and the prefix, obviously.
        virtual_text = {
            spacing = 4,
            -- prefix = ''
            prefix = '',
            severity_limit = 'Error'
        }
    }
)

-- 显示提示信息
vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true})
-- vim.lsp.buf.document_highlight()
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]]) 

-- vim.lsp.buf.hover
-- 'ESC' key: show 'tip window', jump 'tip window', 'q' key quit 'tip window'
vim.api.nvim_set_keymap('n', '<C-[>', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})


-- vim.lsp.buf.definition
vim.api.nvim_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})

function format()
    -- vim.lsp.buf.formatting()
    vim.lsp.buf.formatting_sync(nil, 100)
    vim.cmd('write')
end

vim.cmd([[autocmd BufWritePre *.go noremap S :lua format()<CR>]])
vim.cmd([[autocmd BufWritePre *.js noremap S :lua format()<CR>]])
vim.cmd([[autocmd BufWritePre *.vue noremap S :lua format()<CR>]])
vim.cmd([[autocmd BufWritePre *.lua noremap S :lua format()<CR>]])
