local M = {}

function M.isstr(v) return type(v) == "string" end

function M.isfunc(v) return type(v) == "function" end

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
function M.remove_ansi(str)
  local ret = str
      :gsub("\x1b%[[%d;]*m", "") -- Strip color codes
      :gsub("\x1b%[%d*K", "")    -- Strip the "erase in line" codes
  return ret
end

---Removes carriage returns and some ansi escape codes from a string
---@param str string
---@return string
function M.clean_job_line(str)
  return M.remove_ansi(str:gsub("\r$", ""))
end

function M.get_stdout_line_iter()
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

function M.sleep(n) -- seconds
  local clock = os.clock
  local t0 = clock()
  while clock() - t0 <= n do end
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end

function _G.reload(package)
  package.loaded[package] = nil
  return require(package)
end

_G.myluafunc = setmetatable({}, {
  __call = function(self, idx, args, count)
    if self[idx] == nil then
      return ''
    end
    return self[idx](args, count)
  end,
})

local func2str = function(func, args)
  local idx = #_G.myluafunc + 1
  _G.myluafunc[idx] = func
  if not args then
    -- print('idx:',idx)
    return ("lua myluafunc(%s)"):format(idx)
  else
    -- return ("lua myluafunc(%s, <q-args>)"):format(idx)
    return ("lua myluafunc(%s, <q-args>, <count>)"):format(idx)
  end
end


M.t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
---API for key mapping.
---
---@param lhs string
---@param modes string|table
---@param rhs string|function
---@param opts string|table
--- opts.buffer: current buffer only
--- opts.cmd: command (format to <cmd>%s<cr>)
function M.remap(modes, lhs, rhs, opts)
  modes = M.isstr(modes) and { modes } or modes
  opts = M.isstr(opts) and { opts } or (opts or {})

  -- plan B
  local fallback = function()
    return vim.api.nvim_feedkeys(M.t(lhs), "n", true)
  end

  local _rhs = (function()
    if M.isfunc(rhs) then
      opts.noremap = true
      opts.cmd = true
      return func2str(function() rhs(fallback) end)
    end
    return rhs
  end)()

  for key, opt in ipairs(opts) do
    opts[opt] = true
    opts[key] = nil
  end

  local buffer = (function()
    if opts.buffer then
      opts.buffer = nil
      return true
    end
  end)()

  _rhs = (function()
    if opts.cmd then
      opts.cmd = nil
      return ("<cmd>%s<cr>"):format(_rhs)
    else
      return _rhs
    end
  end)()

  for _, mode in ipairs(modes) do
    if buffer then
      vim.api.nvim_buf_set_keymap(0, mode, lhs, _rhs, opts)
    else
      vim.api.nvim_set_keymap(mode, lhs, _rhs, opts)
    end
  end
end

function M.have_compiler()
  if vim.fn.executable('cc') == 1 or
      vim.fn.executable('gcc') == 1 or
      vim.fn.executable('clang') == 1 or
      vim.fn.executable('cl') == 1 then
    return true
  end
  return false
end

function M.go_js()
  -- 获取当前文件的扩展名
  -- local filename = vim.fn.expand('%:t')
  -- local file_extension = filename:match("^.+(%..+)$")
  -- -- 检查是否为 Go 文件
  -- if file_extension ~= '.go' then return end
  -- 获取当前缓冲区的内容
  local buf_content = vim.fn.join(vim.fn.getline(1, "$"), "\n")

  -- 匹配整个 import 块（跨多行的情况）
  local pattern = 'import%s*%(.-%)' -- 匹配 import (...) 块
  local imports_block = buf_content:match(pattern)

  if imports_block == nil then return false end
  -- 移除注释掉的部分（以 // 开头的行）
  imports_block = imports_block:gsub('%s*//[^\n]*', '') -- 移除注释
  -- 检查是否包含 "syscall/js"
  return imports_block:find('syscall/js')
end

return M
