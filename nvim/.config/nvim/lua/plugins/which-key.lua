return {
	{
		"folke/which-key.nvim",
		dependencies = {
			"echasnovski/mini.icons",
			init = function()
				require("mini.icons").setup({
					style = "glyph",
				})
			end,
		},
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("which-key").setup({
				win = { border = "single" },
			})
		end,
	},
}
