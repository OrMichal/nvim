local cmp = require("cmp")

cmp.setup.filetype({"vue", "typescript", "typescript"}, {
  enabled = false
})

vim.api.nvim_set_hl(0, "CmpNormal", { bg="#313244" })

cmp.setup({
  experimental = {
    ghost_text = true,
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged },
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"]      = cmp.mapping.confirm({ select = false }),

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
    completion = {
      border = "none",
      winhighlight = "Normal:CmpNormal",
    },
    documentation = {
      border = "none",
      winhighlight = "Normal:CmpNormal",
      side_padding = 1,
    }
  }
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    if vim.bo.filetype ~= "vue" then
      vim.b.coc_enabled = false
    else
      vim.b.coc_enabled = true
    end
  end,
})
