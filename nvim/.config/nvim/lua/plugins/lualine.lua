return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'ayu',
      icons_enabled = true,
    },
    tabline = {
      -- lualine_a = {
      --   {
      --     'sections',
      --     path = 1,
      --   }
      -- }
    }
  }
}
