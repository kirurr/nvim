return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { { "prettierd", "prettier" } },
					go = {"gofmt"},
					vue = {"prettier"},
					html = {"prettier"},
					css = {"prettier"},
					json = {"prettier"},

				},
			})

			vim.keymap.set("", "<leader>f", function()
				conform.format({
					lsp_fallback = true,
					async = false,
				})
			end, { desc = "format" })
		end,
	},
}
