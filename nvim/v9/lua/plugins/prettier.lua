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
    "vue",
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


local M = {}
M.filetypes = {
  css = "css",
  graphql = "graphql",
  gql = "graphql",
  html = "html",
  vue = "vue", -- 格式化出错无提示(在shell中主动使用 pretter xxxx.file 查看错误)
  js = "javascript",
  jsm = "javascript",
  mjs = "javascript",
  jsx = "javascriptreact",
  json = "json",
  less = "less",
  -- md = "markdown",
  scss = "scss",
  sass = "scss",
  ts = "typescript",
  tsx = "typescriptreact",
  yml = "yaml",
}

function M.ismatch(ext) return M.filetypes[ext] ~= nil end

return M
