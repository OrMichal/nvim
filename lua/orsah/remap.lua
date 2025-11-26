vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":Neotree<CR>")
vim.keymap.set("n", "<leader>t", ":split | terminal<CR> i clear<CR>", { noremap = true, silent = true})

vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Window actions" })
vim.keymap.set("n", "<leader>|", ":vsp<CR>", { desc = "Window vertical split" })
vim.keymap.set("n", "<leader>-", ":sp<CR>", { desc = "Window horizontal split" })

-- coc lsp settings
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', {expr = true, noremap = true})

-- Disable cmp in Vue files (if you also have nvim-cmp installed)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue",
  callback = function()
    vim.b.cmp_enabled = false
  end,
})

-- Optional: additional vim options for better completion popup
vim.o.completeopt = "menuone,noinsert,noselect"  -- best for Coc
vim.o.shortmess = vim.o.shortmess .. "c"

-- window resizing
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")
