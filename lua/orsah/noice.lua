require("noice").setup({
  lsp = {
    progress = { enabled = false },
    signature = { enabled = false },
  },

  presets = {
    bottom_search = false,
    command_palette = false,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },

  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
    },
  },

  views = {
    cmdline_popup = {
      position = {
        row = "95%",    -- near bottom like your plugin
        col = "50%",    -- left horizontal offset
      },
      size = {
        width = "50",
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winblend = 0,
        winhighlight = {
          Normal = "Normal",
          FloatBorder = "NoiceCmdlineBorder",
        },
      },
    },
  },
})
