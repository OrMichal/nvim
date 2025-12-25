local lush = require("lush")
local hsl = lush.hsl

local palette = {
  bg      = hsl(0,   0, 10),
  bg2     = hsl(40,  5, 14),
  fg      = hsl(33, 42, 84),
  comment = hsl(28,  9, 43),
  keyword = hsl(130, 7, 50),
  string  = hsl(82, 24, 61),
  func    = hsl(0, 14, 61),
  type    = hsl(138, 25, 40),
  number  = hsl(22, 56, 52),
  accent  = hsl(151, 29, 63),
  error   = hsl(0, 60, 56),
  warn    = hsl(37, 70, 52),
}

return lush(function()
  return {

    -- Core Editor
    Normal       { fg = palette.fg, bg = "none" },
    NormalFloat  { fg = palette.fg, bg = "none" },
    EndOfBuffer { fg = palette.fg, bg = "none" },
    Comment      { fg = palette.comment, gui = "italic" },
    CursorLine   { bg = palette.bg2 },
    CursorLineNr { fg = palette.accent, bg = palette.bg2 },
    LineNr       { fg = palette.comment.darken(10) },
    Visual       { bg = palette.bg2.lighten(8) },

    -- Syntax
    Keyword      { fg = palette.keyword },
    String       { fg = palette.string },
    Function     { fg = palette.func },
    Type         { fg = palette.type },
    Constant     { fg = palette.number },
    Number       { fg = palette.number },
    Operator     { fg = palette.accent },
    Special      { fg = palette.accent },

    -- Errors / Warnings
    Error        { fg = palette.error, gui = "bold" },
    ErrorMsg     { fg = palette.error },
    WarningMsg   { fg = palette.warn },
    Todo         { fg = palette.warn, bg = palette.bg2, gui = "bold" },

    -- UI Elements
    Pmenu        { bg = palette.bg2, fg = palette.fg },
    PmenuSel     { bg = palette.accent, fg = palette.bg },
    PmenuThumb   { bg = palette.fg },
    PmenuSbar    { bg = palette.bg2.darken(5) },

    StatusLine   { bg = palette.bg2, fg = palette.fg },
    StatusLineNC { bg = palette.bg, fg = palette.comment },

    TabLine      { bg = palette.bg2, fg = palette.comment },
    TabLineSel   { bg = palette.accent, fg = palette.bg },
    TabLineFill  { bg = palette.bg },

    Search       { bg = palette.accent, fg = palette.bg },
    IncSearch    { bg = palette.warn, fg = palette.bg },

    Title        { fg = palette.accent, gui = "bold" },

    WinSeparator { fg = palette.bg2.lighten(10) },

    -- Diagnostics (LSP)
    DiagnosticError   { fg = palette.error },
    DiagnosticWarn    { fg = palette.warn },
    DiagnosticInfo    { fg = palette.accent },
    DiagnosticHint    { fg = palette.keyword },

    DiagnosticUnderlineError { sp = palette.error, gui = "underline" },
    DiagnosticUnderlineWarn  { sp = palette.warn, gui = "underline" },
    DiagnosticUnderlineInfo  { sp = palette.accent, gui = "underline" },
    DiagnosticUnderlineHint  { sp = palette.keyword, gui = "underline" },

    -- Git / Diff
    DiffAdd        { bg = palette.accent.darken(50) },
    DiffChange     { bg = palette.keyword.darken(50) },
    DiffDelete     { bg = palette.error.darken(50), fg = palette.error },
    DiffText       { bg = palette.accent.darken(40) },

    GitSignsAdd    { fg = palette.accent },
    GitSignsChange { fg = palette.keyword },
    GitSignsDelete { fg = palette.error },

    -- Treesitter highlights
    ["@comment"] =         { Comment },
    ["@string"] =         { String },
    ["@function"] =       { Function },
    ["@type"] =            { Type },
    ["@number"] =          { Number },
    ["@keyword"] =         { Keyword },
    ["@variable"] =        { fg = palette.fg },
    ["@punctuation"] =     { fg = palette.accent.darken(10) },
    ["@property"] =        { fg = palette.func },
    ["@field"] =           { fg = palette.func },
    ["@constant"] =        { Constant },
    ["@parameter"] =       { fg = palette.fg.lighten(10) },

    TreesitterContext        { fg = hsl(220, 30, 90), bg = hsl(237, 16, 23), gui = "bold" },
    TreesitterContextLineNumber { fg = hsl(220, 40, 70), bg = hsl(220, 10, 15) },
    TreesitterContextSeparator  { fg = hsl(220, 40, 50), bg = hsl(220, 10, 15) },

    -- Telescope
    TelescopeBorder     { fg = palette.comment, bg = "none" },
    TelescopePromptBorder{ fg = palette.comment, bg = "none" },
    TelescopePromptTitle { fg = palette.bg, bg = palette.accent, gui = "bold" },
    TelescopeResultsTitle{ fg = palette.bg, bg = palette.keyword, gui = "bold" },
    TelescopeMatching    { fg = palette.accent, gui = "bold" },

    -- Indent guides
    IndentBlanklineChar       { fg = palette.bg2.lighten(10) },
    IndentBlanklineContextChar{ fg = palette.accent },

    -- Completion kinds (LSP)
    CmpItemKindFunction { fg = palette.func },
    CmpItemKindVariable { fg = palette.fg },
    CmpItemKindField    { fg = palette.func },
    CmpItemKindClass    { fg = palette.type },
    CmpItemKindKeyword  { fg = palette.keyword },
    CmpItemKindSnippet  { fg = palette.accent },

    AlphaHeader { fg = palette.accent }

  }
end)
