return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({

			-- Define your formatters
			formatters_by_ft = {
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black", stop_after_first = true },
				bash = { "beautysh" },
				zsh = { "beautysh" },
			},
			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 800,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fmm", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
