local neval = vim.api.nvim_eval
local ncmd = vim.api.nvim_command

local Prettier = require('plugins/prettier')



local M = {}
function M.TabCloseLeft ()
  local last_win_num = neval('winnr("$")')
  local cur_win_num = neval('winnr()')
  local last_tab_num = neval('tabpagenr("$")')
  local cur_tab_num = neval('tabpagenr()')
  print(last_win_num,cur_win_num,last_tab_num,cur_tab_num)
  if  last_win_num == 1 and last_tab_num > 1 and cur_tab_num > 1 and cur_tab_num < last_tab_num then
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
  ncmd('tabn '..n)
end


function M.TabPrev()
  local n = vim.fn.tabpagenr()-2
  if n < 0 then
    ncmd('tabm '..vim.fn.tabpagenr('$'))
    return
  end
  ncmd('tabm '..n)
end
--
function M.TabNext()
  local n = vim.fn.tabpagenr()+1
  if n > vim.fn.tabpagenr('$') then
    ncmd('tabm 0')
    return
  end
  ncmd('tabm '..n)
end

function M.ZReg()
    vim.cmd([[@b=@+]])
end

function M.Format()
    -- Prettier.config_exists()
  if Prettier.ismatch(vim.fn.expand('%:e')) then
    return vim.cmd([[:Prettier]])
  end
  vim.lsp.buf.format()
end

function M.SetUTF8()
  vim.cmd([[set fileencoding=utf-8]])
end


function M.LF()
    local temp = vim.fn.tempname()
    ncmd('exec "silent !lf -selection-path="'.. vim.fn.shellescape(temp)) 
    print(vim.fn.filereadable(temp))
    if vim.fn.filereadable(temp)~=nil then
        vim.cmd([[redraw!]])
        return
    end
    local names = vim.fn.readfile(temp)
    if vim.fn.empty(names) then
      vim.cmd([[redraw!]])
        return
    end
    nvim('edit ' .. vim.fn.fnameescape(names[1])) 
    for i,name in pairs(names)  do
      if i==1 then return end
    nvim('argadd ' .. vim.fn.fnameescape(name))
    end
    vim.cmd([[redraw!]])

end

-- vim.api.nvim_create_user_command('Upper', 'echo toupper(<q-args>)', { nargs = 1 })
-- vim.cmd('Upper hello world')

return M
