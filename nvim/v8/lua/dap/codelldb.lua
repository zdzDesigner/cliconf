if not pcall(require, "dap") then return end -- 保护调用加载模块

local dap = require('dap')

dap.configurations.cpp = {
  {
    name = "Launch filexx",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
--
dap.configurations.c = dap.configurations.cpp

return {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/zdz/.local/share/nvim/mason/packages/codelldb/codelldb',
    args = { "--port", "${port}" },
    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}
-- dap.adapters.codelldb = {
--   type = 'server',
--   port = "${port}",
--   executable = {
--     -- CHANGE THIS to your path!
--     command = '/home/zdz/.local/share/nvim/mason/packages/codelldb/codelldb',
--     args = {"--port", "${port}"},
--
--     -- On windows you may have to uncomment this:
--     -- detached = false,
--   }
-- }


-- dap.configurations.rust = dap.configurations.cpp
