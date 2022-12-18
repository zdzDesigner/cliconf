local function all(T)
  T.ls.add_snippets("all", {
    T.s("/*", {
      T.t("/**"),
      T.i(' *'..1),
      T.t(" */"),
    }),
  })
end

return all
