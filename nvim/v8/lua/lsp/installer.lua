if not pcall(require, "lspconfig") then return end -- 保护调用加载模块
local mason = require("mason")
local masonlsp = require("mason-lspconfig")

local handlers = require('lsp/handlers')


mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

masonlsp.setup()
-- require("mason-lspconfig").setup({
--    ensure_installed = { "tsserver" },
-- })

local server_settings = {
  ['rust_analyzer'] = 0,
  ['bashls'] = 0,
  ['lua_ls'] = require('lsp/lua'),
  ['tsserver'] = 0,
  ['zls'] = 0,
  ['clangd'] = 0,
  -- ['ccls'] = require('lsp/ccls')
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
-- local mason = require('mason')
-- local mason_lspconfig = require('mason-lspconfig')

-- local handlers = require('lsp/handlers')


-- local server_settings = {
--   ['rust_analyzer'] = 0,
--   ['bashls'] = 0,
--   ['lua_ls'] = require('lsp/lua'),
--   ['tsserver'] = 0,
--   ['ccls'] = require('lsp/ccls')
-- }

-- local function server_opts(name)
--   local opts = handlers.make_config()
--   if server_settings[name] ~= 0 then
--     opts.settings = server_settings[name]
--   end
--   return opts
-- end

-- for name, _ in pairs(server_settings) do
-- if name == 'ccls' then
-- print('lsp_server_name:',vim.inspect(server_opts(name)))
-- end
-- lspconfig.setup(server_opts(name))
-- end



-- mason_lspconfig.setup({
--   ensure_installed = {
--     "lua_ls",
--     "cssls",
--     "clangd"
--   },
-- })


-- lsp_installer.on_server_ready(function(server)
--   -- This setup() function is exactly the same as
--   -- lspconfig's setup function (:help lspconfig-quickstart)
--   server:setup(server_opts(server.name))
--   -- vim.cmd [[ do User LspAttachBuffers ]]
-- end)
