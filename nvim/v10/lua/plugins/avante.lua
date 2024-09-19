-- 使用avante简写
-- vim.opt.packpath:prepend('/home/zdz/.zdz/nvim/v10/lua/lazy/avante.nvim')
-- local avante = G.import("avante.nvim")

local avante = require("avante")




avante.setup({
  override = {
    sol = {
      icon = "ﲹ",
      color = "#a074c4",
      name = "Sol"
    }
  };
})
