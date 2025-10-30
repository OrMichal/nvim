return {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less", "vue" },
  init_opitions = {
    provideFormatter = true,
  },
  root_markers = {
    "package.json",
    ".git"
  },
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    },
  },
}
