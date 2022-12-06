
-- vim.lsp.start({
--   name = 'typescript-language-server',
--   cmd = {'typescript-language-server'},
--   root_dir = vim.fs.dirname(vim.fs.find({'package.json'}, { upward = true })[1]),
-- })
-- vim.lsp.start({
--   name = 'vscode-html-language-server',
--   cmd = {'vscode-html-language-server'},
--   root_dir = vim.fs.dirname(vim.fs.find({'package.json'}, { upward = true })[1]),
-- })


local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

