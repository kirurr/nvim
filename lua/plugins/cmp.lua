return {
	{ "hrsh7th/cmp-nvim-lsp", lazy = false },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
		},
		event = { "BufRead", "BufNewFile", "CmdlineEnter" },
		config = function()
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-u>"] = cmp.mapping.scroll_docs(4),
					["<C-s>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({
								select = true,
							})
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
			})
			local preferred_sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
			}

			-- check if buffer is too big for buffer source to be used
			local function tooBig(bufnr)
				local max_filesize = 10 * 1024 -- 100 KB
				local check_stats = (vim.uv or vim.loop).fs_stat
				local ok, stats = pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
				if ok and stats and stats.size > max_filesize then
					return true
				else
					return false
				end
			end
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				group = vim.api.nvim_create_augroup("CmpBufferDisableGrp", { clear = true }),
				callback = function(ev)
					local sources = preferred_sources
					if not tooBig(ev.buf) then
						sources[#sources + 1] = { name = "buffer", keyword_length = 4 }
					end
					cmp.setup.buffer({
						sources = cmp.config.sources(sources),
					})
				end,
			})

			-- set tailwindcss trigger characters
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					for _, client in pairs((vim.lsp.get_clients({}))) do
						if client.name == "tailwindcss" then
							client.server_capabilities.completionProvider.triggerCharacters =
								{ '"', "'", "`", ".", "(", "[", "!", "/", ":" }
						end
					end
				end,
			})
		end,
	},
}
