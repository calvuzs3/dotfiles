-- Easily comment visual regions/lines
--
return {
  {

    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
  },

  {
    -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = true },
  },
}
