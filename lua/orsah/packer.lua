vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use("rktjmp/lush.nvim")

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use {
    "nvim-treesitter/nvim-treesitter-context",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("treesitter-context").setup{
        enable = true,
        max_lines = 5,
        min_window_height = 0,
        trim_scope = "outer",
        throttle = true
      }
    end
  }

  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("mbbill/undotree")

  use {
    "hrsh7th/nvim-cmp",       -- completion plugin
    requires = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",   -- buffer completions
      "hrsh7th/cmp-path",     -- file path completions
      "hrsh7th/cmp-cmdline",  -- command-line completions
      "hrsh7th/vim-vsnip",    -- snippet engine
      "hrsh7th/cmp-vsnip",    -- snippet completions
    }
  }

  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        bind = true, -- automatically attach to LSP buffers
        floating_window = true, -- show a floating window with signature
        hint_enable = true, -- show hint text
        hint_prefix = " ", -- optional symbol
        hi_parameter = "Search", -- highlights the current parameter
        max_height = 8, -- max height of the floating window
        max_width = 80, -- max width of the floating window
        toggle_key = "<C-k>", -- optional toggle for signature
      })
    end
  }

  use {
    'echasnovski/mini.nvim',
    branch = 'stable', -- optional, stable branch
    config = function()
      -- Example: load mini.pairs and mini.comment modules
      require('mini.pairs').setup()
      require('mini.comment').setup()
    end
  }
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }
  use { "neoclide/coc.nvim", branch = "release" }

  use {
    'windwp/nvim-ts-autotag',
    after = 'nvim-treesitter',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }
--[[
  use {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      wk.setup {
        plugins = {
          spelling = { enabled = true },
        },
        win = {
          border = "single",
          position = "right",
          margin = { 0, 0, 1, 0 },
          padding = { 1, 2, 1, 2 },
          winblend = 20,
          zindex = 1000
        },
        layout = {
          align = "right",
          spacing = 3
        },
        show_help = false,
      }
    end
  }
  --]]
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  --[[
  use "nvim-lua/plenary.nvim"   -- required
  use "MunifTanjim/nui.nvim"    -- required

  use {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        -- disable everything except commandline UI
        lsp = {
          progress = { enabled = false },
          hover = { enabled = false },
          signature = { enabled = false },
        },
        messages = { enabled = false },
        notify = { enabled = false },
        popupmenu = { enabled = false },
        routes = {},
        commands = {},
        cmdline = {
          view = "cmdline_popup"
        },
        views = {
          cmdline_popup = {
            position = {
              row = 2,
              col = "50%",
            },
            size = {
              width = 70,
              height = "auto",
            },
            border = {
              style = "single",
              padding = { 0, 1 },
            }
          }
        }
      })
    end
  }
  --]]
  use("tpope/vim-fugitive")
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
       signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = {
         hl = "GitSignsChange",
         text = "│",
         numhl = "GitSignsChangeNr",
         linehl = "GitSignsChangeLn",
        },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = {
         hl = "GitSignsDelete",
         text = "‾",
         numhl = "GitSignsDeleteNr",
         linehl = "GitSignsDeleteLn",
        },
        changedelete = {
         hl = "GitSignsChange",
         text = "~",
         numhl = "GitSignsChangeNr",
         linehl = "GitSignsChangeLn",
        },
        untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
       },
      })
     end,
  }
end)
