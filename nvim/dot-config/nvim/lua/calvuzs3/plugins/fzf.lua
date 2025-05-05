return {
  {
    -- This allows FZF startinf from PROJECT CWD
    "ahmedkhalf/project.nvim",
    init = function()
      require("project_nvim").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  {
    -- FZF is FuzzyFind
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- setups
    opts = {},

    keys = {
      {
        "<leader>ff",
        function()
          require("fzf-lua").files()
        end,
        desc = "FZF in cwd",
      },
      {
        "<leader>fg",
        function()
          require("fzf-lua").live_grep()
        end,
        desc = "GREP files in cwd",
      },
      {
        "<leader>fc",
        function()
          require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "FZF in CONFIG",
      },
      {
        "<leader>fb",
        function()
          require("fzf-lua").builtin()
        end,
        desc = "FZF builtin()",
      },
      {
        "<leader>fh",
        function()
          require("fzf-lua").helptags()
        end,
        desc = "FZF find Tags",
      },
      {
        "<leader>fw",
        function()
          require("fzf-lua").grep_cword()
        end,
        desc = "GREP find Cur Word",
      },
      {
        "<leader>fW",
        function()
          require("fzf-lua").grep_cWORD()
        end,
        desc = "GREP find Cur WORD",
      },
      {
        "<leader>fd",
        function()
          require("fzf-lua").diagnostic_document()
        end,
        desc = "FZF Diagnostics",
      },
      {
        "<leader>fr",
        function()
          require("fzf-lua").resume()
        end,
        desc = "FZF Resume",
      },
      {
        "<leader>fk",
        function()
          require("fzf-lua").keymaps()
        end,
        desc = "FZF find Keymaps",
      },
      {
        "<leader>f<leader>",
        function()
          require("fzf-lua").buffers()
        end,
        desc = "FZF Buffers",
      },
      {
        "<leader>f/",
        function()
          require("fzf-lua").lgrep_curbuf()
        end,
        desc = "GREP Cur Buf",
      },
      {
        "<leader>fo",
        function()
          require("fzf-lua").oldfiles()
        end,
        desc = "FZF find Old files",
      },
    },
  },
}
