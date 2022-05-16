local lspconfig = require('lspconfig')

lspconfig.ccls.setup {
  capabilities = capabilities,
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  },
  single_file_support = true
}

-- #### 非git目录, git init 解决
-- [DEBUG][2022-05-14 16:35:23] .../vim/lsp/rpc.lua:454	"rpc.receive"	
-- {  
--      error = {    
--        code = -32602,    
--        message = "invalid params of initialize: expected array for /workspaceFolders"  
--      },  
--     id = 1,  
--     jsonrpc = "2.0"
--}

