local function js(T)
  T.ls.add_snippets("javascript", {
    T.s("cl", {
      T.t("console.log("),
      T.i(1),
      T.t(")"),
    }),
  })
end

return js
