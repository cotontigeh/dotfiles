return {
	"smoka7/hop.nvim",
	version = "*",
	config = function()
		local hop = require("hop")

		hop.setup({})

		vim.keymap.set("n", "f", function()
			hop.hint_char1({ current_line_only = false })
		end, { remap = true })
		vim.keymap.set("n", "F", function()
			hop.hint_char1({ current_line_only = false })
		end, { remap = true })
		vim.keymap.set("n", "t", function()
			hop.hint_char1({ current_line_only = false, hint_offset = -1 })
		end, { remap = true })
		vim.keymap.set("n", "T", function()
			hop.hint_char1({ current_line_only = false, hint_offset = 1 })
		end, { remap = true })
	end,
}
