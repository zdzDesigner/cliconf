local function import(module)
  package.loaded[module] = nil
  return require(module)
end

local util = import("util")
local Term = import('../terminal')
local vimscript = vim.api.nvim_exec

vim.api.nvim_create_user_command('Range', function() Term.openFullTerminal('ranger') end, {})


local function ranger()
  local filepath = '/tmp/temp.plugin.ranger'
  local current_path = vim.fn.expand('%')
  local fd = assert(vim.loop.fs_open(filepath, "w", 438))
  local stat = vim.loop.fs_fstat(fd)

  local cmd = 'ranger ' .. '--choosefiles=' .. filepath .. ' --selectfile=' .. current_path
  -- local cmd = 'lf '..'--choosefiles='..filepath..' --selectfile='..current_path

  -- util.write_file('/tmp/xxx', 'aaa')
  Term.openFloatTerm(cmd, {
    exit = function()
      assert(vim.loop.fs_close(fd))

      if vim.fn.filereadable(filepath) then
        for _, v in pairs(vim.fn.readfile(filepath)) do
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
