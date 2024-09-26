return {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        disabled = { "unlinked-file" }, -- 禁用 unlinked-file 警告
      },
    },
  }
}

