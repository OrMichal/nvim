local lush = require("lush")
local hsl = lush.hsl

-- Define your colorscheme
local theme = lush(function()
  return {
    Normal       { fg = hsl(0, 0, 100), bg = hsl(0, 0, 0) },
    Comment      { fg = hsl(0, 0, 50), gui = "italic" },
    Constant     { fg = hsl(200, 80, 50) },
    Identifier   { fg = hsl(50, 80, 50) },
    Statement    { fg = hsl(350, 80, 50) },
    Type         { fg = hsl(100, 80, 50) },
  }
end)

return theme
