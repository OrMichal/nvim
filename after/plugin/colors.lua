require("lush")(require("lush_theme.my-rusty"))

-- window separators
vim.opt.fillchars = {
	eob = " ",
	vert = "▏",
	horiz = "─",
}

vim.api.nvim_set_hl(0, "WinSeparator", {
	fg = "#4e4e4e",
	bg = "NONE",
})
