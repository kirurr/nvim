return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({
						lsp_fallback = true,
						async = false,
					})
					print("formatting")
				end,
				desc = "format",
			},
			{ "<leader>F", "<cmd>:Format<cr>", desc = "format async", silent = true },
		},

		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					vue = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					python = { "black" },
					yaml = { "yamlfmt" },
				},
			})

			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range })
				print("formatting async")
			end, { range = true })
		end,
	},
}
