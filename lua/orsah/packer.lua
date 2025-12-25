vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("rktjmp/lush.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 5,
				min_window_height = 0,
				trim_scope = "outer",
				throttle = true,
			})
		end,
	})

	use("nvim-treesitter/playground")
	use("theprimeagen/harpoon")
	use("mbbill/undotree")

	use({
		"hrsh7th/nvim-cmp", -- completion plugin
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- file path completions
			"hrsh7th/cmp-cmdline", -- command-line completions
			"hrsh7th/vim-vsnip", -- snippet engine
			"hrsh7th/cmp-vsnip", -- snippet completions
		},
	})

	use({
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
		end,
	})

	use({
		"echasnovski/mini.nvim",
		branch = "stable", -- optional, stable branch
		config = function()
			-- Example: load mini.pairs and mini.comment modules
			require("mini.pairs").setup()
			require("mini.comment").setup()
		end,
	})
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	use({ "neoclide/coc.nvim", branch = "release" })

	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	use("tpope/vim-fugitive")
	use({
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
					delete = {
						hl = "GitSignsDelete",
						text = "_",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
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
	})
	use({
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				rust = { "clippy" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	})
	use("nvim-tree/nvim-web-devicons")
	use({
		"windwp/nvim-autopairs",
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({})

			-- cmp integration
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	})
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})
	use({
		"goolord/alpha-nvim",
		requires = {
			"nvim-mini/mini.icons",
			"nvim-lua/plenary.nvim",
		},
	})

	-- Color themes
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "folke/tokyonight.nvim", as = "tokyonight" })
	use({ "kooparse/vim-color-desert-night" })

	use({ "nvimtools/none-ls.nvim" })
	use({ "nvim-lualine/lualine.nvim" })
end)
