local function js(T)
  T.ls.add_snippets("javascript", {
    T.s("cl", {
      T.t("console.log("),
      T.i(1),
      T.t(")"),
    }),
  })
  T.ls.add_snippets("typescript", {
    T.s("cl", {
      T.t("console.log("),
      T.i(1),
      T.t(")"),
    }),
  })
  T.ls.add_snippets("javascriptreact", {
    T.s("cl", {
      T.t("console.log("),
      T.i(1),
      T.t(")"),
    }),
  })
  T.ls.add_snippets("typescriptreact", {
    T.s("cl", {
      T.t("console.log("),
      T.i(1),
      T.t(")"),
    }),
  })
  T.ls.add_snippets("vue", {
    T.s("cl", {
      T.t("console.log("),
      T.i(1),
      T.t(")"),
    }),
  })
  T.ls.add_snippets("html", {
    T.s("cl", {
      T.t("console.log("),
      T.i(1),
      T.t(")"),
    }),
  })
end

return js
