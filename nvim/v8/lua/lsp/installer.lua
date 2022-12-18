local lsp_installer = require('nvim-lsp-installer')
local handlers = require('lsp/handlers')



local server_settings = {
  ['rust_analyzer'] = 0,
  ['bashls'] = 0,
  ['sumneko_lua'] = require('lsp/lua'),
  ['tsserver'] = 0,
  ['ccls'] = require('lsp/ccls')
}

local function server_opts(name)
  local opts = handlers.make_config()
  if server_settings[name] ~= 0 then
    opts.settings = server_settings[name]
  end
  return opts
end

for name, _ in pairs(server_settings) do
  -- if name == 'ccls' then
  -- print('lsp_server_name:',vim.inspect(server_opts(name)))
  -- end
  require("lspconfig")[name].setup(server_opts(name))
end

lsp_installer.settings {
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗'
    }
  }
}

lsp_installer.on_server_ready(function(server)
  -- This setup() function is exactly the same as
  -- lspconfig's setup function (:help lspconfig-quickstart)
  server:setup(server_opts(server.name))
  -- vim.cmd [[ do User LspAttachBuffers ]]
end)


