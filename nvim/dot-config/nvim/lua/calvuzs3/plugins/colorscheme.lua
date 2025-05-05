-- lua/plugins/rose-pine.lua
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     vim.cmd("colorscheme rose-pine")
--   end,
-- }

--
-- return {
--   "shaunsingh/moonlight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Example config in lua
--     vim.g.moonlight_italic_comments = true
--     vim.g.moonlight_italic_keywords = true
--     vim.g.moonlight_italic_functions = true
--     vim.g.moonlight_italic_variables = false
--     vim.g.moonlight_contrast = true
--     vim.g.moonlight_borders = false
--     vim.g.moonlight_disable_background = false
--     -- Load the colorscheme
--     require("moonlight").set()
--
--     -- Toggle background transparency
--     local bg_transparent = true
--
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       vim.g.moonlight_disable_background = bg_transparent
--       vim.cmd([[colorscheme moonlight]])
--     end
--
--     vim.keymap.set(
--       "n",
--       "<leader>bg",
--       toggle_transparency,
--       { noremap = true, silent = true, desc = "Backgroud transparency" }
--     )
--   end,

-- "rebelot/kanagawa.nvim",
-- config = function()
--   vim.cmd.colorscheme("kanagawa")
-- end,
--
-- "shaunsingh/nord.nvim",
-- lazy = false,
-- priority = 1000,
-- config = function()
--   -- Example config in lua
--   vim.g.nord_contrast = true
--   vim.g.nord_borders = false
--   vim.g.nord_disable_background = true
--   vim.g.nord_italic = false
--   vim.g.nord_uniform_diff_background = true
--   vim.g.nord_bold = false
--
--   -- Load the colorscheme
--   require("nord").set()
--
--   -- Toggle background transparency
--   local bg_transparent = true
--
--   local toggle_transparency = function()
--     bg_transparent = not bg_transparent
--     vim.g.nord_disable_background = bg_transparent
--     vim.cmd([[colorscheme nord]])
--   end
--
--   vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
-- end,

--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   opts = {
--     colorscheme = "catppuccin",
--   },
--   config = function()
--     require("catppuccin").setup({
--       flavour = "macchiato", -- auto, latte, frappe, macchiato, mocha
--     })
--   end,
--
--

return {

  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        integrations = {
          cmp = true,
          gitsigns = true,
          harpoon = true,
          illuminate = true,
          indent_blankline = {
            enabled = false,
            scope_color = "sapphire",
            colored_indent_levels = false,
          },
          mason = true,
          native_lsp = { enabled = true },
          notify = true,
          nvimtree = true,
          neotree = true,
          symbols_outline = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
        },
      })

      vim.cmd.colorscheme("catppuccin-macchiato")

      -- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end
    end,
  },
}
