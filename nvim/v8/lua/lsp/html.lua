-- html settings
local html_settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {
        'vim',
        'root', -- awesomeWM
        'awesome', -- awesomeWM
        'screen', -- awesomeWM
        'client', -- awesomeWM
        'clientkeys', -- awesomeWM
        'clientbuttons', -- awesomeWM
      },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      -- library = {
      --   [vim.fn.expand('$VIMRUNTIME/lua')] = true,
      --   [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      -- },
    },
  }
}

return html_settings
