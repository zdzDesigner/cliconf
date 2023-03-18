-- ccls settings
return {
  lsp = {
    lspconfig = {
      -- root_dir 默认.git , 这里只设置Makefile无效
      -- root_dir = vim.fs.dirname(vim.fs.find({'Makefile'}, { upward = true })[1])
    }
  }
}
