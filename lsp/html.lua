return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_dir = vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true })[1]),
}
