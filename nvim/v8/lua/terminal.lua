local util = require("util")

local M = {}
local lastOpenedTerminalJobId = nil

-- Terminals
function M.openFullTerminal(cmd)
  local buf = vim.api.nvim_create_buf(true, false)
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)

  local on_exit = function()
    vim.api.nvim_buf_delete(buf, { force = true })
  end

  vim.api.nvim_command("startinsert")
  lastOpenedTerminalJobId = vim.fn.termopen(cmd or vim.o.shell, {
    on_exit = on_exit,
  })
end

function M.openPopupTerminal(cmd)
  -- Create window if it doesn't exist
  vim.cmd("bot 15sp")
  local popUpWindow = vim.api.nvim_get_current_win()

  local popUpBuffer = vim.api.nvim_create_buf(true, false)

  vim.api.nvim_win_set_buf(popUpWindow, popUpBuffer)
  vim.cmd("set nobl")

  local on_exit = function()
    vim.api.nvim_buf_delete(popUpBuffer, { force = true })
    vim.api.nvim_win_close(popUpWindow, true)
    lastOpenedTerminalJobId = nil
  end

  vim.api.nvim_command("startinsert")
  lastOpenedTerminalJobId = vim.fn.termopen(cmd or vim.o.shell, {
    on_exit = on_exit,
  })
end

function M.execInTerminal(cmd, job)
  vim.fn.chansend(job, cmd)
end

function M.execInPopupTerminal(cmd)
  vim.fn.chansend(lastOpenedTerminalJobId, cmd)
end



function M.openFloatTerm(cmd, hook)

  -- local ratio = 0.6
  local ratio = 0.95
  local buf = vim.api.nvim_create_buf(false, true)
  local win_height = math.ceil(vim.api.nvim_get_option("lines") * ratio - 4)
  local win_width = math.ceil(vim.api.nvim_get_option("columns") * ratio)
  local col = math.ceil((vim.api.nvim_get_option("columns") - win_width) * 0.5)
  local row = math.ceil((vim.api.nvim_get_option("lines") - win_height) * 0.5 - 1)
  local opts = {
    style = "minimal",
    relative = "editor",
    -- border = "rounded",
    -- border = "none",
    border = "single",
    -- border = "double",
    -- border = "shadow",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
  }
  local win = vim.api.nvim_open_win(buf, true, opts)
  -- 设置高亮
  vim.api.nvim_win_set_option(win,'winhl','Normal:NvimFloatingWindow,FloatBorder:NvimFloatingBorder')
  local on_exit = function()
    hook.exit()
    vim.api.nvim_win_close(win, true)
    vim.api.nvim_buf_delete(buf, { force = true })
  end

  local on_stdout = function(jobid,data)
    -- print(data)
    if jobid~=lastOpenedTerminalJobId then return end
    -- util.write_file('/tmp/xxx', jobid..'-'..lastOpenedTerminalJobId)
    
    -- util.write_file('/tmp/xxx', jobid..'-'..vim.inspect(stdout_iter(data)))
    util.write_file('/tmp/xxx', data)
    -- vim.o.tabline = 'stdout-'..lastOpenedTerminalJobId..'-'..jobid
  end

  vim.api.nvim_command("startinsert")
  lastOpenedTerminalJobId = vim.fn.termopen(cmd or vim.o.shell, {
    on_exit = on_exit,
    -- on_stdout = on_stdout,
  })

end


return M
