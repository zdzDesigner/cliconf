local function go(T)
  T.ls.add_snippets("go", {
    T.s("fp", { T.t("fmt.Println("), T.i(1), T.t(")"), }),
    T.s("fn", {
      T.t("func "), T.i(1), T.t("("), T.i(2), T.t(") "), T.i(3), T.t({ "{", "\t" }),
      T.i(4), T.t({ "", "}" }),

    }),

  })
end

return go
