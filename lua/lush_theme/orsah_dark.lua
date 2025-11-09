local lush = require("lush")
local hsl = lush.hsl

-- Warm, mellow-inspired palette
local bg       = hsl(20, 10, 10)    -- dark brownish background
local fg       = hsl(30, 40, 80)
local comment  = hsl(25, 25, 45)
local keyword  = hsl(25, 45, 65)
local func     = hsl(90, 35, 70)
local string   = hsl(21, 26, 68)
local typecol  = hsl(200, 25, 65)
local number   = hsl(15, 60, 55)
local cursor   = hsl(360, 100, 100)

return lush(function()
  return {
    Normal       { fg = fg, bg = bg },
    Comment      { fg = comment, gui = "italic" },
    Keyword      { fg = keyword },
    Function     { fg = func },
    String       { fg = string },
    Type         { fg = typecol },
    Number       { fg = number },
    CursorLine   { bg = bg.lighten(5) },
    CursorLineNr { fg = cursor },
    Visual       { bg = bg.lighten(10) },
    StatusLine   { fg = fg, bg = bg.lighten(10) },
  }
end)
