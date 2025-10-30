local group = vim.api.nvim_create_augroup("autosave", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = group,
  callback = function()
    -- Don’t save if no buffer name or not modifiable
    if vim.bo.readonly or vim.bo.buftype ~= "" or vim.bo.filetype == "" then
      return
    end

    -- Only save if buffer has unsaved changes
    if vim.bo.modified then
      -- Use :update instead of :write
      -- :update only writes if changes exist and avoids E13
      pcall(vim.cmd.update)
    end
  end,
})
