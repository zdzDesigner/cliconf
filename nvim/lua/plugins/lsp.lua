local lspconfig = require('lspconfig')
vim.lsp.set_log_level("debug")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.bashls.setup{}
-- lspconfig.html.setup{
--     capabilities = capabilities,
--     -- cmd = { "vscode-html-language-server", "--stdio" },
--     filetypes = { "html" , "vue"}
-- }

-- require('plugins/v6')
require('plugins/tsserver')
require('plugins/go')
require('plugins/vue')
require('plugins/lua')
require('plugins/ccls')
require('plugins/diagnostics')

-- require('lspfuzzy').setup {}


-- 显示提示信息
vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true})

-- vim.lsp.buf.hover
-- 'ESC' key: show 'tip window', jump 'tip window', 'q' key quit 'tip window'
vim.api.nvim_set_keymap('n', '<C-[>', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})


-- vim.lsp.buf.definition
vim.api.nvim_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})

function format()
  -- vim.lsp.buf.formatting()
  vim.lsp.buf.formatting_sync(nil, 1000)
  vim.cmd('write')
end

vim.cmd([[autocmd BufWritePre *.go noremap S :lua format()<CR>]])
vim.cmd([[autocmd BufWritePre *.js noremap S :lua format()<CR>]])
vim.cmd([[autocmd BufWritePre *.ts noremap S :lua format()<CR>]])
vim.cmd([[autocmd BufWritePre *.lua noremap S :lua format()<CR>]])
vim.cmd([[autocmd BufWritePre *.sh noremap S :lua format()<CR>]])
vim.cmd([[autocmd BufWritePre *.html noremap S :lua format()<CR>]])






-- v5
-- vim.lsp.buf.document_highlight()
-- vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])


-- lspconfig.xxx.setup{
--     flags = {
--         debounce_text_changes = 150,
--     },
-- }
