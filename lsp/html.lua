return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	root_dir = function(fname)
		local root = vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true, path = fname })[1])

		if root and vim.fs.find("angular.json", { upward = true, path = fname })[1] then
			return nil
		end

		return root
	end,
}
