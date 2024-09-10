local map = vim.keymap.set

local assign_opts = function(desc, bufnr)
	local opts = {}
	if not bufnr == nil then
		opts.buffer = bufnr
	end
	opts.noremap = true
	opts.silent = true
	opts.desc = desc
	return opts
end

-- Buffers
map("n", "[b", ":bp<CR>", assign_opts("Previous buffer", nil))
map("n", "]b", ":bn<CR>", assign_opts("Next buffer", nil))

map("n", "<leader>bo", ":Telescope buffers<CR>", assign_opts("Open telescope buffers", nil))
map("n", "<leader>bd", ":bd<CR>", assign_opts("Delete current buffer", nil))
map("n", "<leader>bp", ":bp<CR>", assign_opts("Previous buffer", nil))
map("n", "<leader>bn", ":bn<CR>", assign_opts("Next buffer", nil))

-- Diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, assign_opts("Line diagnostic", nil))
map("n", "[d", vim.diagnostic.goto_prev, assign_opts("Go to previous diagnostic", nil))
map("n", "]d", vim.diagnostic.goto_next, assign_opts("Go to next diagnostic", nil))

-- LSP
local on_attach_keybindings = function(bufnr)
	map("n", "gD", vim.lsp.buf.declaration, assign_opts("Go to declaration", bufnr))
	map("n", "gd", vim.lsp.buf.definition, assign_opts("Go to definition", bufnr))
	map("n", "K", vim.lsp.buf.hover, assign_opts("Hover", bufnr))
	map("n", "gi", vim.lsp.buf.implementation, assign_opts("Go to implementation", bufnr))
	map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, assign_opts("Signature help", bufnr))
	map("n", "<leader>D", vim.lsp.buf.type_definition, assign_opts("Type definition", bufnr))
	map("n", "<leader>r", vim.lsp.buf.rename, assign_opts("Rename", bufnr))
	map("n", "gr", vim.lsp.buf.references, assign_opts("Go to references", bufnr))
	map("n", "<leader>ca", vim.lsp.buf.code_action, assign_opts("Code action", bufnr))
end


return {
	on_attach_keybindings = on_attach_keybindings,
}
