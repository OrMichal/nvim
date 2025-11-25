return {
  cmd = { "rust-analyzer" },
  root_dir = function(bufnr, on_dir)
    local root_markers = { "Cargo.toml" }
    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

    on_dir(project_root)
  end,
  filetypes = { "rust" },
  settings = {
    rust_analyzer = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    }
  }
}
