local function python(T)
  T.ls.add_snippets("python", {
    T.s("pr", { T.t("print("), T.i(1), T.t(")"), }),

    T.s("cls", {
      T.t("class "), T.i(1), T.t({ ":", "\t" }), --  T.t({ ":", "\t" }) 换行
      T.t("def __init__(self,"), T.i(2), T.t("):"),
      T.t({ "", "\t\tpass" })
    }),

  })
end

return python
