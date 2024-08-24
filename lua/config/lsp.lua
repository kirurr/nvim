local map = vim.keymap.set
-- удалить ошибки диагностики в левом столбце (SignColumn)
vim.diagnostic.config({ signs = false, severity_sort = true })

local assignOpts = function(desc, bufnr)
	local opts = {}
	if not bufnr == nil then
		opts.buffer = bufnr
	end
	opts.noremap = true
	opts.silent = true
	opts.desc = desc
	return opts
end

map("n", "<leader>e", vim.diagnostic.open_float, assignOpts("line diagnostic", nil))

map("n", "[d", vim.diagnostic.goto_prev, assignOpts("go to previous diagnostic", nil))

map("n", "]d", vim.diagnostic.goto_next, assignOpts("go to next diagnostic", nil))

map("n", "<leader>q", vim.diagnostic.setloclist, assignOpts("set loclistset loclist", nil))

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	map("n", "gD", vim.lsp.buf.declaration, assignOpts("go to declaration", bufnr))

	map("n", "gd", vim.lsp.buf.definition, assignOpts("go to definition", bufnr))

	map("n", "K", vim.lsp.buf.hover, assignOpts("hover", bufnr))

	map("n", "gi", vim.lsp.buf.implementation, assignOpts("goto implementationgoto implementation", bufnr))

	map("n", "<C-k>", vim.lsp.buf.signature_help, assignOpts("signature helpsignature help", bufnr))

	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, assignOpts("add workspace folder", bufnr))

	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, assignOpts("remove workspace folder", bufnr))

	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, assignOpts("list workspace folders", bufnr))

	map("n", "<leader>D", vim.lsp.buf.type_definition, assignOpts("type definition", bufnr))

	map("n", "<leader>r", vim.lsp.buf.rename, assignOpts("rename", bufnr))

	map("n", "gr", vim.lsp.buf.references, assignOpts("go to references", bufnr))

	map("n", "<leader>ca", vim.lsp.buf.code_action, assignOpts("code action", bufnr))
end

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,

	["tsserver"] = function() end,

	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
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
