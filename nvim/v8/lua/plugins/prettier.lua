local M = {}
M.filetypes = {
  css = "css",
  graphql = "graphql",
  gql = "graphql",
  html = "html",
  vue = "html",
  js = "javascript",
  jsm = "javascript",
  jsx = "javascriptreact",
  json = "json",
  less = "less",
  md = "markdown",
  scss = "scss",
  sass = "scss",
  ts = "typescript",
  tsx = "typescriptreact",
  yml = "yaml",
}

function M.ismatch(ext) return M.filetypes[ext]~=nil end
return M
