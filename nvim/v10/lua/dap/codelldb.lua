if not pcall(require, "dap") then return end -- 保护调用加载模块

local dap = require('dap')

dap.configurations.cpp = {
  {
    name = "load debug file:",
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
    -- TODO:: codelldb路径, 不同系统可能不同
    command = '/home/zdz/.local/share/nvim/mason/packages/codelldb/codelldb/extension/adapter/codelldb',
    -- command = '/home/zdz/.local/share/nvim/mason/packages/codelldb/codelldb',
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
--


-- https://github.com/mfussenegger/nvim-dap/discussions/434
-- https://github.com/jedrzejboczar/nvim-dap-cortex-debug
