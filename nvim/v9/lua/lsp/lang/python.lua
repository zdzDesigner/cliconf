return {
  pylsp = {
    plugins = {
      -- formatter options
      -- black = { enabled = true },
      -- autopep8 = { enabled = false },
      -- yapf = { enabled = false },
      -- linter options
      -- pylint = { enabled = true, executable = "pylint" },
      -- pyflakes = { enabled = false },
      -- pycodestyle = { enabled = false },
      -- type checker
      -- pylsp_mypy = { enabled = true },
      -- auto-completion options
      -- jedi_completion = { fuzzy = true },
      -- import sorting
      rope_autoimport = { enabled = true },
      -- pyls_isort = { enabled = true },
    },
  },
}


-- https://github.com/mtshiba/pylyzer
-- https://github.com/astral-sh/ruff
