return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					extensions = {
						fzf = {
							fuzzy = true,
							override_generic_sorter = true,
							override_file_sorter = true,
							case_mode = "smart_case",
						},
					},
				},
			})
			require("telescope").load_extension("fzf")
		end,
		keys = {
			{
				"<F2>",
				"<cmd>Telescope find_files<cr>",
				desc = "Open telescope file finder",
			},
			{
				"<F3>",
				"<cmd>Telescope live_grep<cr>",
				desc = "Open telescope live grep",
			},
		},
	},
}
