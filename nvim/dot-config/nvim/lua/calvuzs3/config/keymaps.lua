-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Coiciseness
local km = vim.keymap
local opts = { noremap = true, silent = true }

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrPlugin = 1
-- Utils
km.set("i", "jk", "<ESC>", { desc = "Exit Insert mode (jk)" })
km.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })
km.set("n", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
km.set("n", "x", '"_x"', { desc = "Keymap hole" })

-- Increment or decrement
km.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
km.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
km.set("v", "<", "<gv", { desc = "Indent left in Visual mode" })
km.set("v", ">", ">gv", { desc = "Indent right in Visual mode" })

-- Windows
km.set("n", "<leader>sv", "<C-w>v", { desc = "Split Vertically" })
km.set("n", "<leader>sh", "<C-w>s", { desc = "Split Horizontally" })
km.set("n", "<leader>se", "<C-w>=", { desc = "Splits Equal size" })
km.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current window" })

-- Tabs
km.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new Tab" })
km.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Tab" })
km.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "goto Next Tab" })
km.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "goto Previous Tab" })
km.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current bufFer in new Tab" })

-- Buffers
km.set("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Next buffer" })
km.set("n", "<leader>bN", "<cmd>bp<CR>", { desc = "Previous buffer" })
km.set("n", "<leader>bx", "<cmd>bd<CR>", { desc = "Close buffer" })
km.set("n", "<tab>", "<cmd>bn<CR>", { desc = "Next Buf" })
km.set("n", "<s-tab>", "<cmd>bp<CR>", { desc = "Prev Buf" })

-- Comments-TODO
local tc = require("todo-comments")
km.set("n", "]t", function()
  tc.jump_next()
end, { desc = "Next todo comment" })
km.set("n", "[t", function()
  tc.jump_prev()
end, { desc = "Previous todo comment" })

-- Comments
km.set({ "n", "v" }, "<F7>", "<cmd>CommentToggle<CR>", { desc = "Comment toggle" })

-- Markdown Preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { desc = "Markdown preview toggle" })
