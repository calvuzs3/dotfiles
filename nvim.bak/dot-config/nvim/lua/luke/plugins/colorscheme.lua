return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 900,
	-- 	config = function()
	-- vim.cmd.colorscheme("catppuccin-macchiato")
	-- vim.cmd.colorscheme("catppuccin-mocha")
	-- 	end,
	-- },
	-- {
	-- "folke/tokyonight.nvim",
	-- priority = 500,
	--  config = function()
	--     require("tokyonight").setup({
	--        style = "night",
	--     })
	-- vim.cmd.colorscheme("tokyonight")
	--  end
	-- }
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.sonokai_enable_italic = true
			vim.g.sonokai_transparent_background = "1"
			vim.g.sonokai_style = "andromeda"
			vim.cmd.colorscheme("sonokai")
		end,
	},
}
