local cmp = require("cmp")

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
    ["<Tab>"]     = cmp.mapping.select_next_item(),
    ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
  }),
})

-- Disable cmp for .vue files (Coc will handle completion)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue",
  callback = function()
    require("cmp").setup.buffer({
      enabled = false
    })
  end,
})
