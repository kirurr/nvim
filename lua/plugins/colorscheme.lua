return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					coc_nvim = true,
					treesitter = true,
					telescope = {
						enabled = true,
					},
					indent_blankline = {
						enabled = true,
						scope_color = "lavender",
						colored_indent_levels = false,
					},
					ufo = true,
				},
			})
			vim.cmd.colorscheme "catppuccin-mocha"
		end,
	}
}
