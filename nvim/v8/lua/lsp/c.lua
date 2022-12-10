-- c settings
local c_settings = {
  lsp = {
    server = {
      root_dir = vim.fs.dirname(
        vim.fs.find({'compile_commands.json','compile_flags.txt','.git' }, { upward = true })[1]
      )
    }
  }
}

return c_settings
