local function start_vue_lsp()
  local buf = vim.api.nvim_get_current_buf()

  local root = vim.fs.root(buf, { "package.json", "pnpm-lock.yaml", "yarn.lock", "package-lock.json", ".git" })
    or vim.fn.getcwd()

  local client_id = vim.lsp.start({
    name = "volar",
    cmd = { "vue-language-server", "--stdio" },
    root_dir = root,
    filetypes = { "vue" },
    single_file_support = false,

    init_options = {
      vue = { hybridMode = false },
      typescript = {
        tsdk = vim.fn.expand(
          "$HOME/.local/share/nvim/mason/packages/typescript/node_modules/typescript/lib"
        ),
      },
    },
  })

  -- ✅ manually send didOpen so LSP starts analyzing
  if client_id then
    local client = vim.lsp.get_client_by_id(client_id)
    client.notify("textDocument/didOpen", {
      textDocument = vim.lsp.util.make_text_document_params(buf),
    })
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue",
  callback = start_vue_lsp,
})
