require('lualine').setup {
  options = {
    theme = 'ayu',
    icons_enabled = true,
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
