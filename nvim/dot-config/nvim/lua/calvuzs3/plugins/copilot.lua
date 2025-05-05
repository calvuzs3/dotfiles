return {
  {
    "zbirenbaum/copilot.lua",
    event = { "BufEnter" },
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
        },
        panel = { enabled = true },
      })
    end,
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   event = { "BufEnter" },
  --   dependencies = { "zbirenbaum/copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
}
