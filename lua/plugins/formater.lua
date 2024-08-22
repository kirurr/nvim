return {
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({
						lsp_fallback = true,
						async = false,
					})
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
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					vue = { "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd", "prettier", stop_after_first = true },
					css = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				},
			})

			-- vim.keymap.set("", "<leader>f", function()
			-- 	conform.format({
			-- 		lsp_fallback = true,
			-- 		async = false,
			-- 	})
			-- end, { desc = "format" })

			-- vim.keymap.set("n", "<leader>F", "<cmd>:Format<cr>", { desc = "format async", silent = true })

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
			end, { range = true })
		end,
	},
}
