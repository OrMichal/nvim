vim.keymap.set("i", "<BS>", function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local prev_line = vim.fn.getline(vim.fn.line(".") - 1)

  if line:match("^%s*$") and col == 1 then
    return "<Esc><Esc>kddi"
  end

  if line:match("^%s+$") and col > #line then
    return "<Esc>kddi"
  end

  return "<BS>"
end, { expr = true, noremap = true })
