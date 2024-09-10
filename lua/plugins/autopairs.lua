return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.setup({ check_ts = true })

		local brackets = { { "{", "}" } }
		npairs.add_rules({
			Rule(" ", " "):with_pair(function(opts)
				local pair = opts.line:sub(opts.col - 1, opts.col)
				return vim.tbl_contains({
					brackets[1][1] .. brackets[1][2],
				}, pair)
			end),
		})
		for _, bracket in pairs(brackets) do
			npairs.add_rules({
				Rule(bracket[1] .. " ", " " .. bracket[2])
					:with_pair(function()
						return false
					end)
					:with_move(function(opts)
						return opts.prev_char:match(".%" .. bracket[2]) ~= nil
					end)
					:use_key(bracket[2]),
			})
		end

		npairs.add_rules({
			Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
				:use_regex(true)
				:set_end_pair_length(2),
		})

		npairs.add_rule(Rule("<", ">", {
			"-html",
			"-javascriptreact",
			"-typescriptreact",
		}):with_pair(
			cond.before_regex("%a+:?:?$", 3)
		):with_move(function(opts)
			return opts.char == ">"
		end))
	end,
}
