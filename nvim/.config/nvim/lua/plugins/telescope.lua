return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
      local builtin = require("telescope.builtin")

      -- Keymaps
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>bb", builtin.buffers, {desc = "Show open buffers"})
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "List diagnostics" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("live_grep_args")

      vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
      vim.keymap.set("v", "<leader>ff", "y:lua require('telescope.builtin').live_grep()<CR><c-r>\"", {})
    end,
  },
}
