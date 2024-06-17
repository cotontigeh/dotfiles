-- Lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {"nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' }}, 
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  -- Themes
  "Shatur/neovim-ayu",
} 

local opts = {}

require("lazy").setup(plugins, opts)
