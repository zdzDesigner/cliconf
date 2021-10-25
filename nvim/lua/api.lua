local v = vim.api

local win_width = v.nvim_win_get_width(0)
print('win_width::', win_width)

-- 获取窗口大小
local width = v.nvim_get_option("columns")
local height = v.nvim_get_option("lines")
print(width,height)

-- 别名 --
-- vim.api.nvim_command: vim.cmd

-- 创建缓冲区 -- 
-- nvim_create_buf({listed}, {scratch}): buf
-- listed :boolean 是否显示在缓冲区列表中，"ls 是否能查看到"
-- scratch:boolean 创建一个临时缓存区

-- 缓冲区存数据 --
-- nvim_buf_set_option({buf}, {name}, {value}): void
-- buf: 缓冲区
-- name: 缓冲区的key
-- value: 缓冲区中key对应的value

-- 缓冲区取数据 --
-- nvim_buf_get_option({buf}, {name}): value
-- buf: 缓冲区
-- name: 缓冲区的key

-- 在缓冲区中设置行 --
-- nvim_buf_set_lines({buf}, {start}, {end}, {strict_indexing}, {replacement}): void
-- buf: 缓冲区
-- start: 起始位置
-- end: 结束字符
-- strict_indexing: boolean 越界错误
-- replacement: array 要渲染的字符数组，每一项对应这每一行的内容

-- 创建浮动窗口 --
-- nvim_open_win()
-- buf: 缓冲区
-- enter: boolean 是否设置为当前窗口
-- config: 窗口配置 {style, relative, width, height, row, col}


local buf = v.nvim_create_buf(false, true)
v.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
print(v.nvim_buf_get_option(buf, 'bufhidden'))



local function center(str)
  local width = v.nvim_win_get_width(0)
  local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
  return string.rep(' ', shift) .. str
end

local function ZBufSetLines()
  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col
  }
  -- win = v.nvim_open_win(buf, false, opts)
  win = v.nvim_open_win(buf, true, opts)
  -- v.nvim_buf_set_lines(buf, 0, -1, false, { center('What have i done?'), '', ''})
  v.nvim_buf_set_lines(buf, 0, -1, false, { center('What have i done?'), '------', '------'})
  v.nvim_buf_set_lines(buf, 0, -1, false, { 'aaaa', 'bbbb' })
end

return {
  ZBufSetLines = ZBufSetLines
}
