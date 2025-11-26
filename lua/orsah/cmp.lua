local cmp = require("cmp")

cmp.setup.filetype({"vue", "typescript", "typescript"}, {
  enabled = false
})

cmp.setup({
  experimental = {
    ghost_text = true,
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- or your snippet engine
    end,
  },
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged }, -- auto-trigger while typing
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),                 -- manual trigger
    ["<CR>"]      = cmp.mapping.confirm({ select = false }), -- only insert when confirmed

    ["<Down>"]     = cmp.mapping.select_next_item(),
    ["<Up>"]   = cmp.mapping.select_prev_item(),

    ["<C-Down>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Up>"] = cmp.mapping.scroll_docs(4),

    ["<Esc>"] = cmp.mapping.close()
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
  }),
  window = {
    completion = cmp.config.window.bordered({ border = "rounded" }),
    documentation = cmp.config.window.bordered({ border = "rounded" })
  }
})
