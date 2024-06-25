return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
			vim.keymap.set("n", "<leader>hr", require("gitsigns").reset_hunk, {desc = "Git reset hunk"})
		end,
	},
	{
		"tpope/vim-fugitive",
	},
}
