if not pcall(require, 'sessions') then return end

require('sessions').setup({
  events = { 'BufEnter' },
  -- /home/zdz/.local/share/nvim/sessions
  session_filepath = vim.fn.stdpath('data') .. '/sessions',
  absolute = true,
})
