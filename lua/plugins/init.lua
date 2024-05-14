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
		 "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
		 init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree").setup({
            filesystem = {
              hijack_netrw_behavior = "open_current",
            },
          })
        end
      end
    end,
		config = function ()
			require("neo-tree").setup({
				use_libuv_file_watcher = true,
				follow_current_file = {
					enabled = true
				},
				filesystem = {
					filtered_items = {
						hide_gitignored = true,
					}
				}
			})
		end,
		keys = {
			{'<F4>', ':Neotree toggle<cr>', desc = "Toggle file tree", silent = true}
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
	"nvim-telescope/telescope-fzy-native.nvim",
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function ()
			require('telescope').setup()
			require('telescope').load_extension('fzy_native')
		end,
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
	},

	'saadparwaiz1/cmp_luasnip',

	{
		'L3MON4D3/LuaSnip',
		config = function ()
			require('luasnip/loaders/from_vscode').load({
				paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
			})
		end
	},


}
