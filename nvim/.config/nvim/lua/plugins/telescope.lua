return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup{
      defaults = {},
      pickers = {
        find_files = {
          hidden = true
        }
      },
      extensions = {}
    }
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
  end
}
