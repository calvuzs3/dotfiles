-- local base = require("luke.plugins.lspconfig")
-- local on_attach = base.on_attach
-- local capabilities = base.capabilities

-- local opts = { on_attach = on_attach, capabilities = capabilities }

return {
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					-- null_ls.builtins.diagnostics.rubocop,
					-- null_ls.builtins.formatting.rubocop,
					-- null_ls.builtins.formatting.black,
					-- null_ls.builtins.formatting.isort,
					-- null_ls.builtins.diagnostics.eslint, --cant find this one
					null_ls.builtins.formatting.prettierd,
				},
			})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = { "lua", "tsserver" }, -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local base = require("luke.plugins.lspconfig")
			local on_attach = base.on_attach
			local capabilities = base.capabilities

			local opts = { on_attach = on_attach, capabilities = capabilities }
			local servers = { "lua_ls", "ts_ls", "tailwindcss", "eslint" }

			local lspconf = require("lspconfig")

			for _, lsp in ipairs(servers) do
				lspconf[lsp].setup(opts)
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			-- "williamboman/mason-lspconfig.nvim",
			-- "WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		opts = {
			ensure_installed = {
				"prettierid",
				"eslint_lsp",
				"tailwindcss-language-server",
				"typescript-language-server",
				"html",
				"svelte",
				"prismals",
				"pyright",
				"jdtls",
				"lua_ls",
			},
		},
		-- config = function()
		-- 	-- import mason
		-- 	local mason = require("mason")
		--
		-- 	-- import mason-lspconfig
		-- 	local mason_lspconfig = require("mason-lspconfig")
		-- 	local mason_tool_installer = require("mason-tool-installer")
		--
		-- 	-- enable mason and configure icons
		-- 	mason.setup({
		-- 		ui = {
		-- 			icons = {
		-- 				package_installed = "✓",
		-- 				package_pending = "➜",
		-- 				package_uninstalled = "✗",
		-- 			},
		-- 		},
		-- 	})
		--
		-- 	mason_lspconfig.setup({
		-- 		-- list of servers for mason to install
		-- 	})
		--
		-- 	mason_tool_installer.setup({
		-- 		ensure_installed = {
		-- 			"prettier", -- prettier formatter
		-- 			"stylua", -- lua formatter
		-- 			"isort", -- python formatter
		-- 			"black", -- python formatter
		-- 			"pylint",
		-- 			"eslint_d",
		-- 		},
		-- 	})
		-- end,
	},
}
