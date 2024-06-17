return {
  "nvim-tree/nvim-tree.lua",
  init = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function()
    require("nvim-tree").setup()
    -- :NvimTreeFocus
    vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
    vim.keymap.set('n', '<c-b>', ':NvimTreeFocus<CR>')
  end
}

