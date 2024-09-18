local function all(T)
  T.ls.add_snippets("all", {
    T.s("/*", {
      T.t("/**"),
      T.i(' *' .. 1),
      T.t(" */"),
    }),
    T.s("ternary", {
      -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
      T.i(1, "cond"), T.t(" ? "), T.i(2, "then"), T.t(" : "), T.i(3, "else")
    }),
    T.s("trigger", {
      T.t({ "Wow! Text!", "And another line." })
    })

  })
end

return all
