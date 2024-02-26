local ncmd = vim.api.nvim_command

M = {}
local _STATE = {}
local UPDATE_STATE = function()
  _STATE = {
    curtabidx = vim.fn.tabpagenr(),
    curtab = vim.api.nvim_win_get_tabpage(0),
    curbuf = vim.api.nvim_get_current_buf(),
    prevbuf = vim.fn.bufnr("#"),
    buflist = vim.api.nvim_list_bufs(),
    bufmap = (function()
      local map = {}
      for _, b in ipairs(vim.api.nvim_list_bufs()) do
        map[b] = true
      end
      return map
    end)()
  }
  _STATE._3 = _STATE.prevbuf

end

-- TODO::优化方案:第一次计算时间后面可以可以从%# 获取当前bufnr来计算出排序
function BufTemp()

  local buflist = vim.api.nvim_list_bufs()
  local buffers = {}
  for _, t in pairs(buflist) do
    -- if not vim.api.nvim_buf_is_loaded(t) then return end
    if vim.fn.buflisted(t) == 0 then return end
    local info = vim.fn.getbufinfo(t)[1]
    -- print(info.bufnr, info.lastused, info.name)
    -- print('loaded:', vim.api.nvim_buf_is_loaded(t), vim.fn.bufexists(t),vim.fn.buflisted(t))

    table.insert(buffers, {
      bufnr = info.bufnr,
      lastused = info.lastused,
      name = info.name,
    })
  end
  table.sort(buffers, function(a, b)
    return a.lastused > b.lastused
  end)

  -- 找出序列3
  for i, v in pairs(buffers) do
    print(i, v.bufnr, v.lastused, v.name)
    if i == 3 then
      print('----3---', i, v.bufnr, v.lastused)
      _STATE._3 = v.bufnr
    end
  end

end

function M.BufNNext()
  BufTemp()
  print('-------buf nnext--------', _STATE._3)
  print('-------buf nnext--------', _STATE._3)
  ncmd('b ' .. _STATE._3)
end

-- print(vim.inspect(vim.api.nvim_list_bufs()))
function Buf()
  local res = {}
  print('------- buf --------', vim.inspect(vim.api.nvim_list_tabpages()))

  for _, t in pairs(vim.api.nvim_list_tabpages()) do
    -- print('------- wins --------', vim.inspect(vim.api.nvim_tabpage_list_wins(t)))
    for _, w in pairs(vim.api.nvim_tabpage_list_wins(t)) do
      local b = vim.api.nvim_win_get_buf(w)
      print('------- buf --------', vim.inspect(b), vim.fn.getbufinfo(b))
      -- if _STATE.bufmap[b] then
      --   print('------- bufmap --------')
      --   -- opts._tab_to_buf[i] = opts._tab_to_buf[i] or {}
      --   -- opts._tab_to_buf[i][b] = t
      --   table.insert(res, b)
      --   print(vim.inspect(res))
      -- end
    end
  end
end

vim.cmd([[
" command! ZBuf lua BufTemp()<CR>
command! ZBuf lua M.BufNNext()<CR>
""augroup BUF_MODE
""  autocmd BufEnter * lua BufTemp()
""augroup END

"" command! ZBuf lua Buf()<CR>
]])

return M
