-- 提示
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         -- virtual_text = false
--         underline = true,
--         -- 在插入模式下是否显示诊断？不要
--         update_in_insert = false,
--         -- This sets the spacing and the prefix, obviously.
--         virtual_text = false
--         -- virtual_text = {
--         --     spacing = 4,
--         --     -- prefix = ''
--         --     prefix = '',
--         --     severity_limit = 'Error'
--         -- }
--     }
-- )

local ns = vim.api.nvim_create_namespace('zdz-diagnostics')
vim.diagnostic.config({

  -- virtual_text = false
  underline = true,
  -- 在插入模式下是否显示诊断？不要
  update_in_insert = false,
  -- This sets the spacing and the prefix, obviously.
  virtual_text = false
  -- virtual_text = {
  --     spacing = 4,
  --     -- prefix = ''
  --     prefix = '',
  --     severity_limit = 'Error'
  -- }
})


---custom namespace

---reference to the original handler
local orig_signs_handler = vim.diagnostic.handlers.signs

---Overriden diagnostics signs helper to only show the single most relevant sign
---@see `:h diagnostic-handlers`
vim.diagnostic.handlers.signs = {
  show = function(_, bufnr, _, opts)
    -- get all diagnostics from the whole buffer rather
    -- than just the diagnostics passed to the handler
    local diagnostics = vim.diagnostic.get(bufnr)

    -- local filtered_diagnostics = utils.filter_diagnostics(diagnostics)

    -- pass the filtered diagnostics (with the
    -- custom namespace) to the original handler
    -- orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
  end,

  hide = function(_, bufnr)
    orig_signs_handler.hide(ns, bufnr)
  end,
}
