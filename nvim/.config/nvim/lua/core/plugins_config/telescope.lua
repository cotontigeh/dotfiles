local builtin = require('telescope.builtin')

require('telescope').setup{
      defaults = {
      },
      pickers = {
        find_files = {
          hidden = true
        }
      },
      extensions = {
      }
    }

vim.keymap.set('n', '<C-p>', builtin.find_files, {})

