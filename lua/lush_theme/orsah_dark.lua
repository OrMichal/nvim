local lush = require("lush")
local hsl = lush.hsl
--[[
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--]]

local palette = {
  bg      = hsl(0,   0, 10),
  bg2     = hsl(40,  5,  14),
  fg      = hsl(33, 42,  84),
  comment = hsl(28,  9,  43),
  keyword = hsl(130, 7,  50),
  string  = hsl(82, 24,  61),
  func    = hsl(0, 14,  61),
  type    = hsl(138, 25,  40),
  number  = hsl(22, 56,  52),
  accent  = hsl(151, 29, 63),
  error   = hsl(0,  60,  56),
  warn    = hsl(37, 70,  52),
}

return lush(function()
  return {
    Normal       { fg = palette.fg, bg = palette.bg },
    Comment      { fg = palette.comment, gui = "italic" },
    Keyword      { fg = palette.keyword },
    String       { fg = palette.string },
    Function     { fg = palette.func },
    Type         { fg = palette.type },
    Constant     { fg = palette.number },
    Number       { fg = palette.number },
    Operator     { fg = palette.accent },
    Special      { fg = palette.accent },

    Error        { fg = palette.error, gui = "bold" },
    WarningMsg   { fg = palette.warn },

    CursorLine   { bg = palette.bg2 },
    Visual       { bg = palette.bg2.lighten(8) },
    TreesitterContext        { fg = hsl(220, 30, 90), bg = hsl(237, 16, 23), gui = "bold" },
    TreesitterContextLineNumber { fg = hsl(220, 40, 70), bg = hsl(220, 10, 15) },
    TreesitterContextSeparator  { fg = hsl(220, 40, 50), bg = hsl(220, 10, 15) },
  }
end)
