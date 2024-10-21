return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{ "echasnovski/mini.icons", version = false, opts = {} },

	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	{
		"stevearc/dressing.nvim",
		opts = {}
	},

	{
		"tpope/vim-commentary",
		cmd = "Commentary",
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	{
		"christoomey/vim-tmux-navigator",
		enabled = true,
		cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight", "TmuxNavigatePrevious" },
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
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
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "▏",
			},
			scope = {
				show_start = false,
				show_end = false,
			},
		},
	},

	{
		"supermaven-inc/supermaven-nvim",
		enabled = false,
		opts = {
			keymaps = {
				accept_suggestion = "<C-CR>",
				accept_word = "<C-j>",
			},
			log_level = "off",
		},
		event = { "BufRead", "BufNewFile", "BufEnter" },
	},

	{ "brenoprata10/nvim-highlight-colors", opts = {}, event = { "BufRead", "BufEnter", "BufNewFile" } },
}
