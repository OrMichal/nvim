local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local show_themes = function()
  require("telescope.builtin").colorscheme({
    prompt_title = "Choose a colorscheme",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      width = 40,
      height = 20
    },
    attach_mappings = function(prompt_bufnr, map)
      -- Override "move down"
      map("i", "<Down>", function()
        actions.move_selection_next(prompt_bufnr)

        local entry = action_state.get_selected_entry()
        if entry ~= nil then
          vim.cmd("colorscheme " .. entry.value)
        end
      end)

      -- Override "move up"
      map("i", "<Up>", function()
        actions.move_selection_previous(prompt_bufnr)

        local entry = action_state.get_selected_entry()
        if entry ~= nil then
          vim.cmd("colorscheme " .. entry.value)
        end
      end)

      return true
    end,
  })
end

vim.keymap.set("n", "<leader>uc", show_themes)
