local function zig(T)
  T.ls.add_snippets("zig", {
    T.s("pri", { T.t("std.debug.print(\""), T.i(1), T.t("\""), T.t(",.{"), T.i(2), T.t("})") }),

  })
end

return zig
