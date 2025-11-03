local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
  },
})
-- -- 自定义 Ruff 格式化器
-- null_ls.register({
--   name = "ruff_format",
--   method = null_ls.methods.FORMATTING,
--   filetypes = { "python" },
--   generator = null_ls.generator({
--     command = "ruff",
--     -- args = { "format", "-" },
--     args = { "format", "." },
--     to_stdin = true,
--     -- 关键！加上 on_output 处理输出
--     on_output = function(params, done)
--       done({ text = params.output })
--     end,
--   }),
-- })
