return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
		opts = {
			integrations = {
				treesitter = true,
				treesitter_context = true,
				which_key = true,
				mason = true,
				cmp = true,
				gitsigns = true,
				telescope = {
					enabled = true,
				},
				indent_blankline = {
					enabled = true,
					scope_color = "lavender",
					colored_indent_levels = false,
				},
			},
		},
	},
}
