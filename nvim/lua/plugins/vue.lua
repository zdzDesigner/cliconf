local lspconfig = require('lspconfig')
local util = require('lspconfig/util')



lspconfig.vuels.setup{
    cmd = { "vls" },
    filetypes = { "vue" },
    init_options = {
      config = {
        css = {},
        emmet = {},
        html = {
          suggest = {}
        },
        javascript = {
          format = {"prettier"}
        },
        stylusSupremacy = {},
        typescript = {
          format = {}
        },
        vetur = {
          ignoreProjectWarning = true,
          completion = {
            autoImport = false,
            tagCasing = "kebab",
            useScaffoldSnippets = false
          },
          format = {
            defaultFormatter = {
              js = "prettier",
              ts = "prettier"
            },
            defaultFormatterOptions = {},
            scriptInitialIndent = false,
            styleInitialIndent = false
          },
          useWorkspaceDependencies = false,
          validation = {
            script = true,
            style = true,
            template = true
          }
        }
      }
    },
    root_dir = util.root_pattern("package.json", "vue.config.js")
}
