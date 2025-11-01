local lush = require('lush')
local hsl = lush.hsl

-- lush() will parse the spec and
-- return a table containing all color information.
-- We return it for use in other files.
return lush(function()
  return {
    Normal       { fg = hsl("#f9f9f9"), bg = hsl("#070110") },
    Comment      { fg = hsl(0, 0, 50), gui = "italic" },
    Constant     { fg = hsl(200, 80, 50) },
    Identifier   { fg = hsl(50, 80, 50) },
    Statement    { fg = hsl("#0077b6") },
    Type         { fg = hsl("#8a13fd") },  }
end)
