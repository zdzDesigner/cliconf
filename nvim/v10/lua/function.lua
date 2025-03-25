local G = require('G')

local neval = vim.api.nvim_eval
local ncmd = vim.api.nvim_command

local Prettier = G.import('plugins/prettier')
-- local comment = require('Comment/')
-- print(vim.inspect(comment))



local M = {}
function M.TabCloseLeft()
  local last_win_num = neval('winnr("$")')
  local cur_win_num = neval('winnr()')
  local last_tab_num = neval('tabpagenr("$")')
  local cur_tab_num = neval('tabpagenr()')
  print(last_win_num, cur_win_num, last_tab_num, cur_tab_num)
  if last_win_num == 1 and last_tab_num > 1 and cur_tab_num > 1 and cur_tab_num < last_tab_num then
    print('quit------')
    ncmd(':q | tabprevious')
  else
    print('quit')
    ncmd(':q')
  end
end

function M.TabJump(n)
  n = neval('tabpagenr("$")') - n
  if n < 1 then
    ncmd('tabn 1')
    return
  end
  ncmd('tabn ' .. n)
end

function M.TabPrev()
  local n = vim.fn.tabpagenr() - 2
  if n < 0 then
    ncmd('tabm ' .. vim.fn.tabpagenr('$'))
    return
  end
  ncmd('tabm ' .. n)
end

--
function M.TabNext()
  local n = vim.fn.tabpagenr() + 1
  if n > vim.fn.tabpagenr('$') then
    ncmd('tabm 0')
    return
  end
  ncmd('tabm ' .. n)
end

function M.ZReg()
  -- vim.cmd([[@b=@+]])
  ncmd('@b=@+')
end

function M.Format()
  -- print(vim.fn.expand('%:e'))
  -- Prettier.config_exists()
  if Prettier.ismatch(vim.fn.expand('%:e')) then
    -- return vim.cmd([[:Prettier]])
    return ncmd(':Prettier')
  end
  if vim.fn.expand('%:e') == 'md' then
    return
  end
  vim.lsp.buf.format()
end

-- TODO: has gd
function M.ClangToggle()
  local active_lsp = vim.lsp.get_active_clients()
  print(vim.inspect(active_lsp))
end

-- function M.LF()
--   local temp = vim.fn.tempname()
--   ncmd('exec "lf -selection-path="' .. vim.fn.shellescape(temp))
--   -- print(temp)
--   -- print(vim.fn.filereadable(temp))
--   if vim.fn.filereadable(temp) ~= nil then
--     vim.cmd([[redraw!]])
--     return
--   end
--   local names = vim.fn.readfile(temp)
--   if vim.fn.empty(names) then
--     vim.cmd([[redraw!]])
--     return
--   end
--   ncmd('edit ' .. vim.fn.fnameescape(names[1]))
--   for i, name in pairs(names) do
--     if i == 1 then return end
--     ncmd('argadd ' .. vim.fn.fnameescape(name))
--   end
--   vim.cmd([[redraw!]])
-- end

function M.SetUTF8()
  vim.cmd([[set fileencoding=utf-8]])
end

-- vim.api.nvim_create_user_command('Upper', 'echo toupper(<q-args>)', { nargs = 1 })
-- vim.cmd('Upper hello world')



-- vim.api.nvim_create_augroup("debounce_save", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*",
--   group = "debounce_save",
--   callback = function()
--     -- 在这里添加你想要执行的命令
--     -- 例如，自动格式化代码
--     print('xxxxxxx')
--     vim.lsp.buf.format()
--   end,
--   debounce = 500, -- 500ms 的延迟
-- })


local debounce_timers = {}
-- 防抖保存函数
function M.Debounced_save()
  local buf = vim.api.nvim_get_current_buf()
  -- 如果当前缓冲区已有定时器，则先关闭
  if debounce_timers[buf] then
    debounce_timers[buf]:close()
  end
  -- 设置新的定时器，延迟 500 毫秒后保存
  debounce_timers[buf] = vim.defer_fn(function()
    vim.cmd('silent! update') -- 使用 :update 仅在修改时保存
    debounce_timers[buf] = nil
  end, 500)
end

function M.Save()
  vim.cmd('silent! update') -- 使用 :update 仅在修改时保存
end

-- debounced_save()

-- 自定义防抖保存命令
-- vim.api.nvim_create_user_command('DebouncedWrite', function()
--     if manual_debounce_timer then
--         manual_debounce_timer:close()
--     end
--     manual_debounce_timer = vim.defer_fn(function()
--         vim.cmd('silent! write') -- 执行保存
--         manual_debounce_timer = nil
--     end, 500)
-- end, {})


return M
