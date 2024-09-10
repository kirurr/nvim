return {
	{
		"nvim-lualine/lualine.nvim",
		enabled = false,
		opts = {
			options = {
				theme = "auto"
			},
			extensions = {
				"neo-tree",
				"lazy",
				"mason",
			},
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = { "filetype" },
			},
		},
	},
}
