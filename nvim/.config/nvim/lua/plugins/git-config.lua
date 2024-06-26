return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
			vim.keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk, { desc = "Git reset hunk" })
			vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis, { desc = "Git show diff" })
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gg", "<Cmd>Git<CR>", { desc = "Git" })
		end,
	},
}
