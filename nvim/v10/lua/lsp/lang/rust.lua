return {
  -- cmd = { "rust-analyzer" },
  cmd = { "/home/zdz/Application/rust/lsp/rust-analyzer/rust-analyzer" },
  filetypes = { 'rust' },
  settings = {
    ["rust-analyzer"] = {
      -- checkOnSave = {
      --   command = "clippy", -- 即使没有 Cargo.toml 也启用代码检查
      -- },
      -- standalone = true,
      diagnostics = {
        disabled = { "unlinked-file", "unresolved-proc-macro" }, -- 禁用 unlinked-file 警告
      },
      procMacro = {
        enable = true, -- 启用宏支持
        attributes = {
          enable = true,
        },
      },
      buildScripts = {
        enable = true,
      },
    },
  }
}
