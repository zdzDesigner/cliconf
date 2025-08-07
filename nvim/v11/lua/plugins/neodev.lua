local res, neodev = pcall(require, 'neodev')
if not res then return end

neodev.setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
