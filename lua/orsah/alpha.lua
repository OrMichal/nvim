local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Center ASCII art header
dashboard.section.header.val = {
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                     ]],
  [[       ████ ██████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      █████████ ███████████████████ ███   ███████████   ]],
  [[     █████████  ███    █████████████ █████ ██████████████   ]],
  [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
  [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
  [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
}

dashboard.section.header.opts = { position = "center" }

-- Buttons (optional)
dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene<CR>"),
  { type = "padding", val = 1 },
  dashboard.button("s", "󰈞 Find file", "<leader><leader><CR>"),
  { type = "padding", val = 1 },
  dashboard.button("n", "󰝰 Open file explorer", ":Ex<CR>"),
  { type = "padding", val = 1 },
  dashboard.button("q", "  Quit", ":qa<CR>"),
}
dashboard.section.buttons.opts = { position = "center" }

-- Footer
dashboard.section.footer.val = "Welcome to Neovim"
dashboard.section.footer.opts = { position = "center" }

-- Final centered layout
dashboard.config.layout = {
  { type = "padding", val = 4 },
  dashboard.section.header,
  { type = "padding", val = 2 },
  dashboard.section.buttons,
  { type = "padding", val = 2 },
  dashboard.section.footer,
}

alpha.setup(dashboard.config)
