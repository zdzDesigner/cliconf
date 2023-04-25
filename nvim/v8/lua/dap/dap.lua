local masondap = require("mason-nvim-dap")

local G = require('G')



local function adapter(config)
  return function(defconfig)
    defconfig.adapters = config
    print(vim.inspect(config))
    require('mason-nvim-dap').default_setup(defconfig) -- don't forget this!
  end
end

masondap.setup({
  ensure_installed = { 'codelldb' },
  handlers         = {
    function(config)
      -- all sources with no handler get passed here

      -- Keep original functionality
      require('mason-nvim-dap').default_setup(config)
    end,
    codelldb = adapter(require('dap/codelldb'))
  }
})


G.import('dap/dapui')
