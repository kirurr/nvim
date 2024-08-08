return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin"
				}
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim"
		},
		init = function()
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree").setup({
						filesystem = {
							hijack_netrw_behavior = "open_current"
						}
					})
				end
			end
		end,
		config = function()
			require("neo-tree").setup({
				use_libuv_file_watcher = true,
				follow_current_file = {
					enabled = true
				},
				filesystem = {
					filtered_items = {
						hide_gitignored = true
					}
				}
			})
		end,
		keys = { {
			"<F4>",
			":Neotree toggle<cr>",
			desc = "Toggle file tree",
			silent = true
		} }
	},

	"tpope/vim-commentary",

	"ap/vim-css-color",

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({
				with_sync = true
			})()
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
				sync_install = false,
				highlight = {
					enable = true
				},
				modules = {},
				auto_install = false,
				ignore_install = {},
			})
		end
	},

	"nvim-telescope/telescope-fzy-native.nvim",

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup()
			require("telescope").load_extension("fzy_native")
		end,
		keys = { {
			"<F2>",
			"<cmd>Telescope find_files<cr>",
			desc = "Open telescope file finder"
		}, {
			"<F3>",
			"<cmd>Telescope buffers<cr>",
			desc = "Open telescope file finder"
		} }
	},

	"powerman/vim-plugin-ruscmd",

	{
		"christoomey/vim-tmux-navigator",
		cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight", "TmuxNavigatePrevious" },
		keys = { { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" }, { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" }, { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" } }
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 600
		end,
		opts = {}
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				indent = {
					char = "▏"
				},
				scope = {
					show_start = false,
					show_end = false
				}
			})
		end
	},

	"saadparwaiz1/cmp_luasnip", {
	"L3MON4D3/LuaSnip",
	config = function()
		require("luasnip/loaders/from_vscode").load({
			paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" }
		})
	end
	},

	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
}
