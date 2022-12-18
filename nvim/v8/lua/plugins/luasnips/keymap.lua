local res, ls = pcall(require, 'luasnip')
if not res then return end


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
