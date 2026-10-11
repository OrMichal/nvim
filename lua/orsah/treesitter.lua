vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter"
	}
})

sitter = require('nvim-treesitter')

sitter.install({ 'rust', 'c', 'javascript', 'typescript' }):wait(300000)

sitter.setup {
	install_dir = vim.fn.stdpath('data') .. '/site',

	highlight = {
		enable = true
	},
}
