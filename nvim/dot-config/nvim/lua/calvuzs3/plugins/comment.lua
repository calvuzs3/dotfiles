-- Easily comment visual regions/lines
--
return {
  {

    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<C-_>", require("Comment.api").toggle.linewise.current, opts)
      vim.keymap.set("n", "<C-c>", require("Comment.api").toggle.linewise.current, opts)
      vim.keymap.set("n", "<C-/>", require("Comment.api").toggle.linewise.current, opts)
      vim.keymap.set(
        "v",
        "<C-_>",
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        opts
      )
      vim.keymap.set(
        "v",
        "<C-c>",
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        opts
      )
      vim.keymap.set(
        "v",
        "<C-/>",
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        opts
      )
    end,
  },

  {
    -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
}
