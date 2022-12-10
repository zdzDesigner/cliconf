local lsp_installer = require('nvim-lsp-installer')
local handlers = require('lsp/handlers')


lsp_installer.settings {
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗'
    }
  }
}
local servers = { 'rust_analyzer', 'bashls', 'sumneko_lua', 'tsserver', 'ccls' }

lsp_installer.on_server_ready(function(server)
  local opts = handlers.make_config()

  if server.name == 'sumneko_lua' then
    opts.settings = require('lsp/lua')
  end
  if server.name == 'tsserver' then
    print('-----open tsserver')
  end
  if server.name == 'ccls' then
    print('-----open ccls')
  end




  -- This setup() function is exactly the same as
  -- lspconfig's setup function (:help lspconfig-quickstart)
  server:setup(opts)
  -- vim.cmd [[ do User LspAttachBuffers ]]
end)


return servers
