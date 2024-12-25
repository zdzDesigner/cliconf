local function zig(T)
  T.ls.add_snippets("zig", {
    T.s("\\std", {
      T.t("const std = @import(\"std\");"),
    }),
  })
end

return zig
