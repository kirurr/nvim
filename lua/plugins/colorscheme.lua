return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {},
		init = function()
			vim.cmd([[colorscheme tokyonight-night]])
			if vim.g.colors_name == "tokyonight-night" then
				vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#292e42" })
				vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#16161e" })
			end
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
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
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				lsp_saga = true,
			},
		},
	},
}
