return {

	'kevinhwang91/nvim-ufo',
	init = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
		vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

		vim.api.nvim_set_hl(0, 'Folded', { fg = "NONE", bg = "NONE" })
		vim.api.nvim_set_hl(0, 'UfoFoldedEllipsis', { bg = "NONE" })
	end,
	dependencies = 'kevinhwang91/promise-async',
	config = function()
		require('ufo').setup({
			enable_get_fold_virt_text = true,
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate, ctx)
				-- include the bottom line in folded text for additional context
				local filling = ' ⋯ '
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				table.insert(virtText, { filling, 'Folded' })
				local endVirtText = ctx.get_fold_virt_text(endLnum)
				for i, chunk in ipairs(endVirtText) do
					local chunkText = chunk[1]
					local hlGroup = chunk[2]
					if i == 1 then
						chunkText = chunkText:gsub("^%s+", "")
					end
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(virtText, { chunkText, hlGroup })
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						table.insert(virtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				return virtText
			end,
			provider_selector = function(bufnr, filetype, buftype)
				return { 'treesitter', 'indent' }
			end
		})
	end
}
