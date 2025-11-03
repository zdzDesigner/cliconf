if not pcall(require, "lspconfig") then return end -- 保护调用加载模块
local lspconfig = require("lspconfig")
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

-- masonlsp.setup()

local server_settings = {
  ['rust_analyzer'] = require('lsp/lang/rust'),
  ['bashls'] = 0,
  ['lua_ls'] = require('lsp/lang/lua'),
  -- ['tsserver'] = require('lsp/lang/tsserver'),
  ['ts_ls'] = require('lsp/lang/tsserver'),
  ['zls'] = require('lsp/lang/zig'),
  -- ['gopls'] = 0,
  ['gopls'] = require('lsp/lang/go'),
  ['clangd'] = 0,
  ['dockerls'] = 0,
  ['asm_lsp'] = 0,
  ['neocmake'] = 0,
  -- ['yamlls'] = 0,
  ['sqlls'] = require('lsp/lang/sqlls'),
  -- python3 -m pip install --user --upgrade pynvim
  ['pylsp'] = require('lsp/lang/python'),
  -- ['pyrefly'] = require('lsp/lang/python'),
  -- ['pylyzer'] = 0,
  -- ['llm-ls'] = 0,
  -- ['ccls'] = require('lsp/ccls')
}

local function server_opts(name)
  local opts = handlers.make_config()
  if server_settings[name] ~= 0 then
    opts = handlers.merge(opts, server_settings[name])
  end
  -- print(name, vim.inspect(opts.settings))
  return opts
end

for name, _ in pairs(server_settings) do
  -- if name == 'ccls' then
  -- print('lsp_server_name:',vim.inspect(server_opts(name)))
  -- end
  -- {
  --   on_attach,
  --   capabilities,
  -- }
  lspconfig[name].setup(server_opts(name))
end



-- mason template
-- {
--   "name": "codelldb",
--   "primary_source": {
--     "release": "1.9.0",
--     "file": "https://github.com/vadimcn/codelldb/releases/download/v1.9.0/codelldb-x86_64-linux.vsix",
--     "repo": "vadimcn/codelldb",
--     "type": "github_release_file"
--   },
--   "links": { "share": {}, "bin": { "codelldb": "codelldb/extension/lldb/bin/lldb" } },
--   "schema_version": "1.1",
--   "secondary_sources": [],
--   "metrics": { "completion_time": 1677192334680, "start_time": 1677192310148 }
-- }
