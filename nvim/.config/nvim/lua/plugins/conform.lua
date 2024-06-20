return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conf = require("conform")

		conf.setup({
			log_level = vim.log.levels.DEBUG,
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "eslintd", "prettierd", "prettier" },
				typescriptreact = { "eslintd", "prettierd", "prettier" },
				javascript = { "eslintd", "prettierd", "prettier" },
				javascriptreact = { "eslintd", "prettierd", "prettier" },
				go = { "goimports", "gofmt" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },

				["*"] = { "codespell" },
				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				["_"] = { "trim_whitespace" },
			},
		})

		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	pattern = "*",
		-- 	callback = function(args)
		-- 		require("conform").format({ bufnr = args.buf, lsp_fallback = true })
		-- 	end,
		-- })

		function _G.format_current_buffer()
			require("conform").format({ bufnr = vim.api.nvim_get_current_buf(), lsp_fallback = true })
		end

		vim.api.nvim_set_keymap("n", "<Leader>f", ":lua format_current_buffer()<CR>", { noremap = true, silent = true })

		-- Customize prettier args
		-- require("conform.formatters.prettier").args = function(_, ctx)
		-- 	local prettier_roots = { ".eslintrc.js", ".prettierrc", ".prettierrc.json", "prettier.config.js" }
		-- 	local args = { "--stdin-filepath", "$FILENAME" }
		-- 	local config_path = vim.fn.stdpath("config")
		--
		-- 	local localPrettierConfig = vim.fs.find(prettier_roots, {
		-- 		upward = true,
		-- 		path = ctx.dirname,
		-- 		type = "file",
		-- 	})[1]
		-- 	local globalPrettierConfig = vim.fs.find(prettier_roots, {
		-- 		path = type(config_path) == "string" and config_path or config_path[1],
		-- 		type = "file",
		-- 	})[1]
		-- 	local disableGlobalPrettierConfig = os.getenv("DISABLE_GLOBAL_PRETTIER_CONFIG")
		--
		-- 	-- Project config takes precedence over global config
		-- 	if localPrettierConfig then
		-- 		vim.list_extend(args, { "--config", localPrettierConfig })
		-- 	elseif globalPrettierConfig and not disableGlobalPrettierConfig then
		-- 		vim.list_extend(args, { "--config", globalPrettierConfig })
		-- 	end
		--
		-- 	local hasTailwindPrettierPlugin = vim.fs.find("node_modules/prettier-plugin-tailwindcss", {
		-- 		upward = true,
		-- 		path = ctx.dirname,
		-- 		type = "directory",
		-- 	})[1]
		--
		-- 	if hasTailwindPrettierPlugin then
		-- 		vim.list_extend(args, { "--plugin", "prettier-plugin-tailwindcss" })
		-- 	end
		--
		-- 	return args
		-- end
	end,
}
