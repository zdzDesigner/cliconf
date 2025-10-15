if not pcall(require, "lspconfig") then return end -- 保护调用加载模块
-- local lspconfig = require('lspconfig')
return {
  -- cmd = { '/home/zdz/Application/zig/lsp/zls/zig-out/bin/zls' },
  cmd = { '/home/zdz/Application/zig/lsp/zls/zig-out/bin/zls' },
  -- cmd = { '/home/zdz/Application/zig/lsp/bin/zls' },
  filetypes = { "zig", "zon" },
  -- single_file_support = false, // false 支持库中跳转, 内存开销大
  settings = {
    zls = {
      -- zig_exe_path = '/home/zdz/Application/zig/zig-linux-x86_64-0.12.0-dev.3439+31a7f22b8/zig',
      -- zig_lib_path = '/home/zdz/Application/zig/zig-linux-x86_64-0.12.0-dev.3439+31a7f22b8/lib',
      -- zig_exe_path = '/home/zdz/Application/zig/zig-linux-x86_64-0.13.0/zig',
      -- zig_lib_path = '/home/zdz/Application/zig/zig-linux-x86_64-0.13.0/lib',
      -- zig_exe_path = '/home/zdz/Application/zig/zig-linux-x86_64-0.14.0/zig',
      -- zig_lib_path = '/home/zdz/Application/zig/zig-linux-x86_64-0.14.0/lib',
      -- zig_exe_path = '/home/zdz/Application/zig/zig-x86_64-linux-0.15.0-dev.1092+d772c0627/zig',
      -- zig_lib_path = '/home/zdz/Application/zig/zig-x86_64-linux-0.15.0-dev.1092+d772c0627/lib',
      zig_exe_path = '/home/zdz/Application/zig/zig-x86_64-linux-0.15.1/zig',
      zig_lib_path = '/home/zdz/Application/zig/zig-x86_64-linux-0.15.1/lib',
      -- semantic_tokens = "partial",
      semantic_tokens = "none", -- 去除自定义颜色(保存时高亮闪烁)
      -- semantic_tokens = "full",


      -- build_on_save_step = "",
      -- enable_snippets = false,
      -- enable_argument_placeholders = false,
      -- enable_build_on_save = false,
      -- enable_inlay_hints = false,
      -- completion_label_details = false,
      -- enable_autofix = false,
      skip_std_references = true,
      -- root_dir = lspconfig.util.root_pattern("build.zig", ".git"),
      -- root_dir = lspconfig.util.root_pattern('build.zig'),
    }
  }
}
