local dracula = require("dracula")
-- print('dracula...')
-- markdown
-- markdown_inline

local colors = {
  bg = "#282A36",
  fg = "#F8F8F2",
  selection = "#44475A",
  comment = "#6272A4",
  red = "#FF5555",
  orange = "#FFB86C",
  yellow = "#F1FA8C",
  green = "#50fa7b",
  purple = "#BD93F9",
  cyan = "#8BE9FD",
  pink = "#FF79C6",
  bright_red = "#FF6E6E",
  bright_green = "#69FF94",
  bright_yellow = "#FFFFA5",
  bright_blue = "#D6ACFF",
  bright_magenta = "#FF92DF",
  bright_cyan = "#A4FFFF",
  bright_white = "#FFFFFF",
  menu = "#21222C",
  visual = "#3E4452",
  gutter_fg = "#4B5263",
  nontext = "#3B4048",
  deep = "#1f1f28",
  -- #482b3f
}
dracula.setup({
  -- customize dracula color palette
  colors = colors,
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = true,     -- default false
  -- set custom lualine background color
  -- lualine_bg_color = "#222222", -- default nil
  lualine_bg_color = "None", -- default nil
  -- set italic comment
  italic_comment = true,     -- default false
  -- reset color https://github.com/Mofiqul/dracula.nvim/issues/90
  overrides = {
    -- 高亮行
    CursorLine = { bg = colors.deep, },
    -- ["@markup.heading.2"] = { fg = dracula.colors().purple },
    -- ["@markup.heading.3"] = { fg = dracula.colors().yellow },
    -- ["@markup.raw"] = { fg = dracula.colors().deep },
    -- markdownCodeBlock = { fg = dracula.colors().deep },
    -- ['@markup.emphasis'] = { fg = colors.green, italic = true, },   -- italic
    -- Normal = { bg='NONE' }
    -- Examples
    -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
    -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
    -- Nothing = {} -- clear highlight of Nothing
  },
})
-- 设置颜色
vim.cmd [[colorscheme dracula]]
