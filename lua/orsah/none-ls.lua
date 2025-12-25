local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
	},
})

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

--[[
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.lsp.buf.format()
	end,
})
]]
