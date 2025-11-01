return {
  cmd = { "rust-analyzer" },
  root_dir = vim.fn.getcwd(),
  filetypes = { "rust" },
  settings = {
    rust_analyzer = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    }
  }
}
