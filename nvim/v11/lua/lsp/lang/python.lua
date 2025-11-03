-- 自动获取 UV 虚拟环境的 Python 路径
local function get_uv_venv_python()
  local uv_venv_path = vim.fn.finddir(".venv", ".;") -- 查找项目根目录的 .venv
  if uv_venv_path ~= "" then
    return uv_venv_path .. "/bin/python"             -- Linux/macOS
    -- return uv_venv_path .. "/Scripts/python"  -- Windows
  end
  return nil -- 未找到则使用系统默认
end

-- return {
--   -- cmd = { "python", "-m", "pylsp" }, -- 自定义
--   init_options = {
--     python = {
--       pythonPath = get_uv_venv_python(), -- 指定虚拟环境的 Python 解释器
--     },
--   },
--   settings = {
--     pylsp = {
--       plugins = {
--         signature = {
--           -- formatter = 'ruff'
--           -- formatter = 'black'
--         },
--         diagnostics = {
--           args = { "--max-line-length=120" }, -- 调整行长度
--         },
--         pycodestyle = {
--           ignore = { 'W391', 'E402', 'E261', 'E226', 'E303' },
--           maxLineLength = 160
--         },
--         mccabe = {
--           threshold = 30,
--         },
--         -- ruff = { enabled = true },
--         -- black = { enabled = false },
--       },
--     },
--   }
-- }
--

-- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md


return {
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
