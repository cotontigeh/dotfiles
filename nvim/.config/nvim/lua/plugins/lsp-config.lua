return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
        ensure_installed = { "lua_ls", "tsserver", "html" },
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      -- lsp signature
      require("lsp_signature").on_attach({
        bind = true,
        floating_window = true,
        hint_prefix = {
          above = "↙ ", -- when the hint is wn the line above the current line
          current = "← ", -- when the hint is on the same line
          below = "↖ ", -- when the hint is on the line below the current line
        },
      })

      vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers["signature_help"], { border = "rounded" })

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>q", vim.lsp.buf.code_action, {})
    end,
  },
}
