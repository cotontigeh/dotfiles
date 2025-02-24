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
				ensure_installed = { "lua_ls", "ts_ls", "html", "eslint", "gopls", "yamlls", "jsonls", "denols" },
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
      local util = require('lspconfig.util')

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			local ts_root = util.root_pattern("package.json")(vim.fn.getcwd())
      if ts_root then

        -- TS Server
        lspconfig.ts_ls.setup({
          root_dir = ts_root,
          capabilities = capabilities,
          settings = {
            typescript = {
              importModuleSpecifierPreference = 'relative',
              importModuleSpecifierEnding = 'minimal',
            }
          }
        })

        -- ESLINT
        lspconfig.eslint.setup({
          capabilities = capabilities,
        })
      end

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

      lspconfig.denols.setup({
        root_dir = function(fname)
          -- return nil if no specified root_files match in the root of the current directory
          local root_files = {
            'deno.json'
          }
          local root = lspconfig.util.find_git_ancestor(fname) or lspconfig.util.path.dirname(fname)
          for _, file in ipairs(root_files) do
            if lspconfig.util.path.exists(lspconfig.util.path.join(root, file)) then
              return root
            end
          end
          return nil
        end,
        capabilities = capabilities,
        on_attach = function()
          local active_clients = vim.lsp.get_active_clients()
          for _, client in pairs(active_clients) do
            -- stop tsserver if denols is already active
            if client.name == "ts_ls" then
              client.stop()
            end
          end
        end,
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
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>q", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>ll", ":LspRestart<CR>", { desc = "Reload LSP" })

			local telescope = require("telescope.builtin")
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_keybindings", { clear = true }),
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					-- View diagnostics
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end, { buffer = event.buf, desc = "Diagnostic message" })

					-- Go to next error
					vim.keymap.set("n", "<leader>vn", function()
						vim.diagnostic.goto_next()
					end, { buffer = event.buf, desc = "Diagnostic next" })

					-- Go to previous error
					vim.keymap.set("n", "<leader>vp", function()
						vim.diagnostic.goto_prev()
					end, { buffer = event.buf, desc = "Diagnostic prev" })

					-- List errors with telescope
					vim.keymap.set(
						"n",
						"<leader>vl",
						telescope.diagnostics,
						{ buffer = event.buf, desc = "Diagnostic telescope list" }
					)

					-- Rename
					vim.keymap.set("n", "<leader>R", function()
						vim.lsp.buf.rename()
					end, { desc = "Rename symbol", buffer = event.buf })

					-- Signature help
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, opts)

					-- Get references
					vim.keymap.set("n", "gr", function()
						telescope.lsp_references({ include_declaration = false })
					end, opts)

					vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)

					-- eslint
					vim.keymap.set("n", "<leader>lf", ":EslintFixAll<CR>", { desc = "Eslint Fix All" })

          -- deno fmt
          vim.keymap.set("n", "<leader>ld", function()
            vim.api.nvim_command('write')
            local output = vim.fn.system('deno fmt ' .. vim.fn.expand('%:p'))
            print(output)
            vim.api.nvim_command('edit!')
          end, { noremap = true, silent = true, desc = "Deno format" })
				end,
			})
		end,
	},
}
