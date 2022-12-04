local res, devicons = pcall(require, "nvim-web-devicons")

print('devicons::',res)

if not res then
  return
end

devicons.setup({
  override = {
    sol = {
      icon = "ﲹ",
      color = "#a074c4",
      name = "Sol"
    }
  };
})
