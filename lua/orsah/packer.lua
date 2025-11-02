vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {"eldritch-theme/eldritch.nvim"}

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
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
    'yaegassy/coc-volar',
    run = 'yarn install --frozen-lockfile'
  }

  use {
    'yaegassy/coc-volar-tools',
    run = 'yarn install --frozen-lockfile'
  }
end)
