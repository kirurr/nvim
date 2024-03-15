return {
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup({
				options = {
					theme = "catppuccin"
				}
			})
		end,
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	"tpope/vim-surround",

	{
		"nvim-tree/nvim-tree.lua",
		config = function() require("nvim-tree").setup() end,
		keys = {
			{'<F4>', ':NvimTreeToggle<cr>', desc = "Toggle file tree", silent = true}
		}
	},

	"tpope/vim-commentary",

	"ap/vim-css-color",

	"terryma/vim-multiple-cursors",

	{
		"lewis6991/gitsigns.nvim",
		config = function() require('gitsigns').setup() end
	},

	"Raimondi/delimitMate",

	{
		"nvim-treesitter/nvim-treesitter",
		build = function() require("nvim-treesitter.install").update({ with_sync = true })() end,
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
				sync_install = false,
				highlight = {
					enable = true, }
			}
		end
	},

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{ "<F2>", '<cmd>Telescope find_files<cr>', desc = 'Open telescope file finder' }
		}
	},

	"powerman/vim-plugin-ruscmd",

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
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
		"Pocco81/auto-save.nvim",
		config = function() require("auto-save").setup {} end,
	},

	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup(
				{
					relculright = true,
					segments = {
						{ text = { builtin.foldfunc },      click = "v:lua.ScFa" },
						{ text = { "%s" },                  click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" }
					}
				}
			)
		end
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require('ibl').setup({
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

	{
		'declancm/cinnamon.nvim',
		config = function()
				require('cinnamon').setup {
					extra_keymaps = true,
					override_keymaps = true,
					extended_keymaps = true,
					max_length = 500,
					scroll_limit = -1,
				}
		end
	},

	{
		'willothy/moveline.nvim',
		build = 'make',
		config = function()
			local moveline = require('moveline')
			vim.keymap.set('n', '<M-k>', moveline.up)
			vim.keymap.set('n', '<M-j>', moveline.down)
			vim.keymap.set('v', '<M-k>', moveline.block_up)
			vim.keymap.set('v', '<M-j>', moveline.block_down)
		end
	}
}

