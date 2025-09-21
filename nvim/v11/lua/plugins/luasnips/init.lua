local res, ls = pcall(require, 'luasnip')
if not res then return end

local T = {}
T.ls = ls
T.s = ls.snippet
T.sn = ls.snippet_node
T.t = ls.text_node
T.i = ls.insert_node
T.f = ls.function_node
T.c = ls.choice_node
T.copy = function(args) return args[1] end
ls.filetype_extend("javascript", { "javascriptreact" })
ls.filetype_extend("javascript", { "html" })




-- require("luasnip.loaders.from_lua").load({ paths = "$CLIENV/nvim/v8/snippets/" })

require('snippets/all')(T)
require('snippets/js')(T)
require('snippets/python')(T)
require('snippets/go')(T)
require('snippets/zig')(T)
