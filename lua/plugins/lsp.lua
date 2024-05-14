return {
	'onsails/lspkind-nvim',
	'neovim/nvim-lspconfig',
	{
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require('mason-lspconfig').setup()

			-- mason.setup_handlers {
			-- function(server_name)
			-- 	require('lspconfig')[server_name].setup {
			-- 		on_attach = on_attach
			-- 	}
			-- end,
			-- }
		end
}
}
