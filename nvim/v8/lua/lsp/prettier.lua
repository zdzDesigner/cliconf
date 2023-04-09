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
if not pcall(require, "lspconfig") then return end -- 保护调用加载模块

local prettier = require("prettier")
-- print('prettier:',prettier)

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  cli_options = {
    printWidth = 160,
    arrowParens = "always",
    singleQuote = true,
    bracketSpacing = true,
    endOfLine = "lf",
    semi = false,
    tabWidth = 2,
    trailingComma = "none"
  },
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
