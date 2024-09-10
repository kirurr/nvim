return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufRead", "BufNewFile" },
		build = function()
			require("nvim-treesitter.install").update({
				with_sync = true,
			})()
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
					"json",
					"html",
					"css",
					"tsx",
					"javascript",
					"typescript",
				},
				sync_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>ss",
						node_incremental = "<leader>si",
						scope_incremental = "<leader>sc",
						node_decremental = "<leader>sd",
					},
				},
				indent = { enable = true },
				modules = {},
				auto_install = true,
				ignore_install = {},
			})
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-context", 
		opts = { }
	},
}
