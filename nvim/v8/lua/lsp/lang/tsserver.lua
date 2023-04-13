if not pcall(require, "lspconfig") then return end -- 保护调用加载模块

local lspconfig = require('lspconfig')

return {
  init_options        = { hostInfo = 'neovim' },
  cmd                 = { 'typescript-language-server', '--stdio' },
  filetypes           = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  -- root_dir            = function(fname)
  --   return util.root_pattern 'tsconfig.json' (fname)
  --       or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
  -- end,
  -- root_dir            = lspconfig.util.root_pattern('package.json', 'jsconfig.json', '.git'),
  root_dir            = lspconfig.util.root_pattern('.git'),
  single_file_support = false
}
