return {
  cmd = { "vscode-html-languageserver", "--stdio" },
  filetypes = { "html", "vue" },
  root_dir = vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true })[1]),
}
