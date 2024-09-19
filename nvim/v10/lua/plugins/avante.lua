-- local res, avante = pcall(require, "yetone/avante.nvim")

-- local res, avante = pcall(require, "avante.nvim")
-- if not res then return end

local G = require('G')
print("cccccc")
-- vim.opt.packpath:prepend('/home/zdz/.zdz/nvim/v10')
-- local avante = require("../lazy/avante.nvim")
local avante = G.import("avante.nvim")
print("xxxxxxxxxyyyyy")



-- avante.setup({
--   override = {
--     sol = {
--       icon = "ﲹ",
--       color = "#a074c4",
--       name = "Sol"
--     }
--   };
-- })
