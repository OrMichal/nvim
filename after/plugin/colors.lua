require("lush")(require("lush_theme.orsah_dark"))

-- statusline
vim.o.laststatus = 2

local devicons = require("nvim-web-devicons")

local function git_branch()
  local branch = vim.trim(vim.fn.system({ "git", "branch", "--show-current" }))
  if branch ~= "" then
    return branch
  else
    return ""
  end
end

local function git_state() 
  local branch = vim.trim(vim.fn.system({ "git", "rev-list", "--count", "HEAD.." .. git_branch() }))
  if branch == "0" then
    return "%#StatusOk#  "
  else
    return "%#StatusError#  "
  end
end

local update_count = vim.trim(vim.fn.system({ "git", "rev-list", "--count", "HEAD.." .. git_branch() }))
if update_count == "0" then
  print("your branch is up to date")
else
  print("THERE ARE CHANGES IN YOUR GIT REPOSITORY PULL THEM AS SOON AS POSSIBLE!!!")
end


local function language_icon()
  local icon, color = devicons.get_icon_color_by_filetype(vim.bo.filetype)

  if icon then
    vim.api.nvim_set_hl(0, "StatusLanguageIconDynamic", { fg = color, bg = "#313244" })
    return "%#StatusLanguageIconDynamic#" .. icon
  else
    return ""
  end
end

vim.cmd([[
  hi StatusMode guifg=#1e1e2e guibg=#89b4fa gui=bold
  hi StatusFile guifg=#cdd6f4 guibg=#313244
  hi StatusFiletype guifg=#cdd6f4 guibg=#313244
  hi StatusGitbranch guifg=#ffffff guibg=#f25e40
  hi StatusLanguageIcon guifg=#cdd6f4 guibg=#313244
  hi StatusError guifg=#ff0000 guibg=#313244
  hi StatusOk guifg=#00ff00 guibg=#313244
]])

vim.o.statusline = "%#StatusMode# %{mode()} %#StatusFile# %f %= "
  .. git_state() .. " %#StatusGitbranch#  (" .. git_branch() .. ") "
  .. "%#StatusLanguageIcon#  " .. language_icon() .. "%#StatusFiletype# " .. vim.bo.filetype
