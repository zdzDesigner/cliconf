local M = {}

local neval = vim.api.nvim_eval
local ncmd = vim.api.nvim_command

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


-- function! TabPrev()
--     let l:n = tabpagenr()-2
--     if l:n < 0
--         exe 'tabm '.tabpagenr('$')
--         return
--     endif
--     exe 'tabm '.l:n
-- endfunction
--
-- function! TabNext()
--     let l:n = tabpagenr()+1
--     if l:n > tabpagenr('$')
--         exe 'tabm '.0
--         return
--     endif
--     exe 'tabm '.l:n
-- endfunction

-- vim.api.nvim_create_user_command('Upper', 'echo toupper(<q-args>)', { nargs = 1 })
-- vim.cmd('Upper hello world')

return M
