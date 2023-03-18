local neval = vim.api.nvim_eval
local ncmd = vim.api.nvim_command

local Prettier = require('plugins/prettier')



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
  -- Prettier.config_exists()
  if Prettier.ismatch(vim.fn.expand('%:e')) then
    -- return vim.cmd([[:Prettier]])
    return ncmd(':Prettier')
  end
  vim.lsp.buf.format()
end

-- vim.api.nvim_create_user_command('Upper', 'echo toupper(<q-args>)', { nargs = 1 })
-- vim.cmd('Upper hello world')

return M
