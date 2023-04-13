local function import(module)
  package.loaded[module] = nil
  return require(module)
end

-- local util = import("util")
local Term = import('../terminal')
local vimscript = vim.api.nvim_exec

vim.api.nvim_create_user_command('Range', function() Term.openFullTerminal('ranger') end, {})


local function ranger()
  local targetpath = '/tmp/temp.plugin.ranger'
  local currentpath = vim.fn.expand('%')
  local fd = assert(vim.loop.fs_open(targetpath, "w", 438))
  -- local stat = vim.loop.fs_fstat(fd)

  -- print('targetpath:', targetpath, current_path)
  -- local cmd = 'ranger ' .. '--choosefiles=' .. targetpath .. ' --selectfile=' .. current_path
  -- lf  /tmp/temp.plugin.ranger ~/.ssh/known_hosts
  local cmd = 'lf ' .. '-selection-path ' .. targetpath .. ' ' .. currentpath

  -- util.write_file('/tmp/xxx', 'aaa')
  Term.openFloatTerm(cmd, {
    exit = function()
      assert(vim.loop.fs_close(fd))

      if vim.fn.filereadable(targetpath) then
        for _, v in pairs(vim.fn.readfile(targetpath)) do
          -- util.write_file('/tmp/xxx', v)
          -- vimscript(':tab drop '..v, true)
          vimscript(':tabedit ' .. v, true)
        end
      end
    end
  })
end

return ranger

-- <leader>f :lua vim.Ranger<CR>
-- vim.keymap.set('','<LEADER>f', function() Term.openFullTerminal('ranger') end,{})
-- vim.keymap.set('','<LEADER>f', function() Term.openFloatTerm('sh /vim/plugins/ranger.sh') end,{})

-- vim.keymap.set('','<LEADER>f', function() Term.openPopupTerminal('ranger') end,{})
