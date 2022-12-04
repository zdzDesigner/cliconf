local M = {}

function M.write_file(path, contents)
  local fd = assert(vim.loop.fs_open(path, "w", 438))
  vim.loop.fs_write(fd, contents, -1)
  assert(vim.loop.fs_close(fd))
end
---@param filepath string
---@return string?
 function M.read_file(filepath)
  if not M.exists(filepath) then
    return nil
  end
  local fd = vim.loop.fs_open(filepath, "r", 420) -- 0644
  local stat = vim.loop.fs_fstat(fd)
  local content = vim.loop.fs_read(fd, stat.size)
  vim.loop.fs_close(fd)
  return content
end

-- Windows, buffers
function M.windowExists(win)
  local windows = vim.api.nvim_list_wins()
  for i, window in ipairs(windows) do
    if window == win then
      return true
    end
  end

  return false
end

function M.bufExists(buf)
  local bufs = vim.api.nvim_list_bufs()
  for i, buffer in ipairs(bufs) do
    if buffer == buf then
      return true
    end
  end
  return false
end


---Removes some ansi escape codes from a string
---@param str string
---@return string
function M.remove_ansi (str)
  local ret = str
  :gsub("\x1b%[[%d;]*m", "") -- Strip color codes
  :gsub("\x1b%[%d*K", "") -- Strip the "erase in line" codes
  return ret
end

---Removes carriage returns and some ansi escape codes from a string
---@param str string
---@return string
function M.clean_job_line (str)
  return M.remove_ansi(str:gsub("\r$", ""))
end
function M.get_stdout_line_iter ()
  local pending = ""
  return function(data)
    local ret = {}
    for i, chunk in ipairs(data) do
      if i == 1 then
        if chunk == "" then
          table.insert(ret, pending)
          pending = ""
        else
          pending = pending .. M.clean_job_line(chunk)
        end
      else
        if data[1] ~= "" then
          table.insert(ret, pending)
        end
        pending = M.clean_job_line(chunk)
      end
    end
    return ret
  end
end

function M.sleep(n)-- seconds
  local clock = os.clock
  local t0 = clock()
  while clock() - t0 <= n do end
end

return M
