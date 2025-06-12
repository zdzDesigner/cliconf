local res, devicons = pcall(require, "nvim-web-devicons")
if not res then return end
-- print('devicons...')

devicons.setup({
  override = {
    sol = {
      icon = "ﲹ",
      color = "#a074c4",
      name = "Sol"
    }
  },
})
