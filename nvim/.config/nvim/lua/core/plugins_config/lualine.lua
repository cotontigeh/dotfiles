require('lualine').setup {
  options = {
    theme = 'ayu',
    icons_enabled = true,
  },
  tabline = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
