-- LSP commands
vim.api.nvim_create_user_command("LspShow", function()
  local names ={}
  for _, client in ipairs(vim.lsp.get_clients()) do
    table.insert(names, client.name)
  end
  local output = "[" .. table.concat(names, " ") .. "]"
  print(output)
end, {  })

vim.api.nvim_create_user_command("LspInfo", function()
  print(vim.inspect(vim.lsp.get_clients()))
end, { })
