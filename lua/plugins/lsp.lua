return {
	"onsails/lspkind-nvim",
	{ "neovim/nvim-lspconfig", lazy = true },
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"css-lsp",
				"emmet-language-server",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"typescript-language-server",
				"tailwindcss-language-server",
				"prettier",
				"prettierd",
				"stylua",
			},
			integrations = {
				["mason-lspconfig"] = true,
			},
		},
		cmd = "MasonToolsInstall",
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		event = { "BufRead", "BufNewFile", "BufEnter" },
		opts = {
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
			},
			on_attach = function(client, bufnr)
				require("config.keybindings").on_attach_keybindings(bufnr)
			end,
			handlers = require("config.lsp-handlers").handlers,
			settings = {
				tsserver_plugins = { "@vue/typescript-plugin" },
			},
		},
	},
}
