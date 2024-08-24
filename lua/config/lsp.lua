vim.diagnostic.config({
	signs = false,
	severity_sort = true,
	virtual_text = true,
	float = {
		border = "rounded",
		focusable = true,
	},
})

local on_attach = function(client, bufnr)
	require("config.keybindings").on_attach_keybindings(bufnr)
end

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local handlers = require("config.lsp-handlers").handlers

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = handlers,
		})
	end,

	["tsserver"] = function() end,

	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = handlers,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
})
