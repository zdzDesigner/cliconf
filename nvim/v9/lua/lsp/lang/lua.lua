-- Lua settings
local paths = vim.split(package.path, ';')
table.insert(paths, '/home/zdz/Application/xmake/xmake/xmake/**/*.lua')
return {
  settings = {
    Lua = {
      runtime = {
        -- LuaJIT in the case of Neovim
        version = 'LuaJIT',
        path = paths,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'root',          -- awesomeWM
          'awesome',       -- awesomeWM
          'screen',        -- awesomeWM
          'client',        -- awesomeWM
          'clientkeys',    -- awesomeWM
          'clientbuttons', -- awesomeWM
        },
      },
      workspace = {
        -- library = {
        --   '/home/zdz/.local/share/xmake'
        -- }
        -- Make the server aware of Neovim runtime files
        -- library = {
        --   [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        --   [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        -- },
      },
    }
  }
}
