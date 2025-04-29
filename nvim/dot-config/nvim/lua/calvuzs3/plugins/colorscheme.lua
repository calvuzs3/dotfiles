return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    colorscheme = "catppuccin",
  },
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- auto, latte, frappe, macchiato, mocha
    })
  end,
}
