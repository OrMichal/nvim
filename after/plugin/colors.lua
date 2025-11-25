require("lush")(require("lush_theme.orsah_dark"))

-- statusline
vim.o.laststatus = 2

local function git_branch()
  local branch = vim.trim(vim.fn.system({ "git", "branch", "--show-current" }))
  if branch ~= "" then
    return " (" .. branch .. ")"
  else
    return ""
  end
end

vim.cmd([[
  hi StatusMode guifg=#1e1e2e guibg=#89b4fa gui=bold
  hi StatusFile guifg=#cdd6f4 guibg=#313244
  hi StatusFiletype guifg=#cdd6f4 guibg=#313244
  hi StatusGitbranch guifg=#ffffff guibg=#f25e40
]])

vim.o.statusline = "%#StatusMode# %{mode()} %#StatusFile# %f %= %#StatusGitbranch# " .. git_branch() .. " %#StatusFiletype# %y "
