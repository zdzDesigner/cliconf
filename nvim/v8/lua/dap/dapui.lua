if not pcall(require, "dapui") then return end -- 保护调用加载模块
if not pcall(require, "dap") then return end   -- 保护调用加载模块

local dap = require('dap')
local dapui = require('dapui')

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup {
  -- Set icons to characters that are more likely to work in every terminal.
  --    Feel free to remove or use ones that you like more! :)
  --    Don't feel like these are good choices.
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  controls = {
    icons = {
      pause = '⏸',
      play = '▶',
      step_into = '⏎',
      step_over = '⏭',
      step_out = '⏮',
      step_back = 'b',
      run_last = '▶▶',
      terminate = '⏹',
    },
  },
  highlights = {
    -- 执行行的高亮样式
    line_highlight = 'DapUIExecution',
    -- 断点的高亮样式
    breakpoints = 'DapUIBreakpoints',
    -- 变量的高亮样式
    variables = 'DapUIVariables',
    -- 堆栈的高亮样式
    frames = 'DapUIFrames',
    -- 表达式的高亮样式
    watches = 'DapUIWatches',
    -- 日志的高亮样式
    logs = 'DapUILogs',
    -- REPL 的高亮样式
    repl = 'DapUIRepl',
  }
}

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

require('dap/highlight').setup()
