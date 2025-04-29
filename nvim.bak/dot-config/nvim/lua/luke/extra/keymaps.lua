-- Coinciseness
local km = vim.keymap

-- Auto-Session
-- km.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
-- km.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for cwd" })

-- Telescope
-- local builtin = require("telescope.builtin")
-- km.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
-- km.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep in cwd" })
-- km.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
-- km.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- km.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope recent files" })
-- km.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Telescope str under cursor" })
-- km.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })

-- Tree and NeoTree
-- km.set("n", "<leader>nn", ":Neotree filesystem reveal left<CR>", { desc = "FS Tree *R*eveal" })
-- km.set("n", "<leader>nt", ":Neotree focus filesystem toggle<CR>", { desc = "Filesystem Tree show and focus toggle" })
-- km.set("n", "<leader>nb", ":Neotree focus buffers toggle<CR>", { desc = "Buffers Tree show and focus toggle" })

-- Markdown Preview
-- vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { desc = "Markdown preview toggle" })

-- yank to clipboard (passing the copy to everything out of nvim)
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy yank to clipboard" })

-- Formatting code
-- vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format, { desc = "Format the code in buffer" })

-- Formatting code BLACK
-- vim.keymap.set("n", "<leader>fmp", ":silent !black %<CR>", { desc = "Format python code of file" })

-- Comments-TODO
local tc = require("todo-comments")
km.set("n", "]t", function()
	tc.jump_next()
end, { desc = "Next todo comment" })
km.set("n", "[t", function()
	tc.jump_prev()
end, { desc = "Previous todo comment" })

-- Comments
km.set("n", "<F8>", "<cmd>CommentToggle<CR>", { desc = "Comment toggle" })
-- km.set("v", "<leader>/", "<cmd>CommentToggle<CR>", { desc = "Comment block toggle" })
