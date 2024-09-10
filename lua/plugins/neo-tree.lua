return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
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
		opts = {

			use_libuv_file_watcher = true,
			follow_current_file = {
				enabled = true,
			},
			filesystem = {
				filtered_items = {
					hide_gitignored = true,
				},
			},
		},

		keys = { {
			"<F4>",
			":Neotree toggle<cr>",
			desc = "Toggle file tree",
			silent = true,
		} },
	},
}
