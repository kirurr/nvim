return {
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		config = function()
			require("luasnip/loaders/from_vscode").load({
				paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "BufRead", "BufNewFile", "BufEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				performance = {
					max_view_entries = 7,
					debounce = 50,
				},
				mapping = cmp.mapping.preset.insert({

					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),

					["<C-j>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<C-k>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-u>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
			})
			local preferred_sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip", options = { show_autosnippets = true } },
				{ name = "path" },
			}

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

			vim.api.nvim_create_autocmd("BufRead", {
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
		end,
	},
}
