local util = require('lspconfig.util')

local root_dir = util.root_pattern(
  '.git',
  'pyproject.toml',
  'setup.cfg',
  '.venv',
  'venv'
);

-- return {
--   root_dir = root_dir,
--   cmd = { '/home/zdz/Documents/Try/Python/course/http-server/.venv/bin/python', '-m', 'pylsp' },
--   pylsp = {
--     plugins = {
--       -- formatter options
--       -- black = { enabled = true },
--       -- autopep8 = { enabled = false },
--       -- yapf = { enabled = false },
--       -- linter options
--       -- pylint = { enabled = true, executable = "pylint" },
--       -- pyflakes = { enabled = false },
--       -- pycodestyle = { enabled = false },
--       -- type checker
--       -- pylsp_mypy = { enabled = true },
--       -- auto-completion options
--       -- jedi_completion = { fuzzy = true },
--       -- import sorting
--       rope_autoimport = { enabled = true },
--       -- pyls_isort = { enabled = true },
--     },
--   },
-- }


return {
  root_dir = root_dir,
  cmd = { "pyrefly", "lsp" },
  filetypes = { "python" },
  -- settings = {
  --   pyrefly = {
  --     diagnostics_delay_ms = 2000, -- 延迟诊断，减少 CPU 峰值
  --     type_checking_mode = "off",  -- 关闭实时全量检查，只在保存时
  --     worker_count = 1,            -- 限制 worker 到 1，适合单核优化
  --
  --   }
  -- }
}

-- https://github.com/mtshiba/pylyzer
-- https://github.com/astral-sh/ruff
