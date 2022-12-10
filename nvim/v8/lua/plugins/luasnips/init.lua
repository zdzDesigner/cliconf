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

require('plugins/luasnips/js')(T)

-- require("luasnip.loaders.from_lua").load({ paths = "$CLIENV/nvim/v8/snippets/" })
local remap = require('util').remap

remap({ "i", "s" }, "<C-j>", function(fallback)
  if ls.jumpable(-1) then
    ls.jump(-1)
  else
    fallback()
  end
end, {})

remap({ "i", "s" }, "<C-k>", function(fallback)
  if ls.jumpable(1) then
    ls.jump(1)
  else
    fallback()
  end
end, {})

remap({ "i", "s" }, "<C-l>", function(fallback)
  if ls.choice_active() then
    ls.change_choice(1)
  else
    fallback()
  end
end, {})
