local function md(T)
  T.ls.add_snippets("markdown", {
    T.s("\\tree", {
      T.t("\t"),
      T.t({ "root", "\t" }),
      T.t({ "├── sub", "\t" }),
      T.t({ "│   ├── 1", "\t" }),
      T.t({ "│   ├── 2", "\t" }),
      T.t({ "│   └── 3", "\t" }),
      T.t({ "└── ", "\t" }),
    }),
  })

  T.ls.add_snippets("markdown", {
    T.s("\\box", {
      T.t("\t"),
      T.t({ "┌──────┐", "\t" }),
      T.t({ "│      │", "\t" }),
      T.t({ "└──────┘", "\t" }),
    }),
  })
  T.ls.add_snippets("markdown", {
    T.s("\\box_raw", {
      T.t("\t"),
      T.t({ "┌--------┐", "\t" }),
      T.t({ "|        |", "\t" }),
      T.t({ "└--------┘", "\t" }),
    }),
  })
end

return md
