-- Get utils
local vim = vim
local nnoremap = require("calvuzs3.core.keymap-utils").nnoremap
local vnoremap = require("calvuzs3.core.keymap-utils").vnoremap
local inoremap = require("calvuzs3.core.keymap-utils").inoremap
local tnoremap = require("calvuzs3.core.keymap-utils").tnoremap
local xnoremap = require("calvuzs3.core.keymap-utils").xnoremap
local comment = require("Comment.api")
local illuminate = require("illuminate")
local utils = require("calvuzs3.core.user-utils")

local M = {}

local TERM = os.getenv("TERM")

-- Normal --
-- Disable Space bar since it'll be used as the leader key
nnoremap("<space>", "<nop>")

-- Window +  better kitty navigation
nnoremap("<C-j>", function()
  if vim.fn.exists(":KittyNavigateDown") ~= 0 and TERM == "xterm-kitty" then
    vim.cmd.KittyNavigateDown()
  elseif vim.fn.exists(":NvimTmuxNavigateDown") ~= 0 then
    vim.cmd.NvimTmuxNavigateDown()
  else
    vim.cmd.wincmd("j")
  end
end)

nnoremap("<C-k>", function()
  if vim.fn.exists(":KittyNavigateUp") ~= 0 and TERM == "xterm-kitty" then
    vim.cmd.KittyNavigateUp()
  elseif vim.fn.exists(":NvimTmuxNavigateUp") ~= 0 then
    vim.cmd.NvimTmuxNavigateUp()
  else
    vim.cmd.wincmd("k")
  end
end)

nnoremap("<C-l>", function()
  if vim.fn.exists(":KittyNavigateRight") ~= 0 and TERM == "xterm-kitty" then
    vim.cmd.KittyNavigateRight()
  elseif vim.fn.exists(":NvimTmuxNavigateRight") ~= 0 then
    vim.cmd.NvimTmuxNavigateRight()
  else
    vim.cmd.wincmd("l")
  end
end)

nnoremap("<C-h>", function()
  if vim.fn.exists(":KittyNavigateLeft") ~= 0 and TERM == "xterm-kitty" then
    vim.cmd.KittyNavigateLeft()
  elseif vim.fn.exists(":NvimTmuxNavigateLeft") ~= 0 then
    vim.cmd.NvimTmuxNavigateLeft()
  else
    vim.cmd.wincmd("h")
  end
end)

-- Swap between last two buffers
nnoremap("<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- OIL - file manager like a buffer
nnoremap("-", "<cmd>Oil --float<CR>", { desc = "Oil FILE browser" })

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")

-- Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "[S]ubstitution" })

-- Open Spectre for global find/replace
nnoremap("<leader>SS", function()
  require("spectre").toggle()
end, { desc = "[S]pectre find and replace" })

-- Open Spectre for global find/replace for the word under the cursor in normal mode
nnoremap("<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
-- Open Spectre for global find/replace for the word under the cursor in visual mode
vnoremap("<leader>sw", function()
  require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word" })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("L", "$")
nnoremap("H", "^")

-- Press 'U' for undo
nnoremap("U", "<C-r>")

-- Turn off highlighted results
nnoremap("<leader>no", "<cmd>noh<cr>")

-- DIAGNOSTICS

-- Goto next diagnostic of any severity
nnoremap("]d", function()
  vim.diagnostic.goto_next({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous diagnostic of any severity
nnoremap("[d", function()
  vim.diagnostic.goto_prev({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next error diagnostic
nnoremap("]e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous error diagnostic
nnoremap("[e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next warning diagnostic
nnoremap("]w", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous warning diagnostic
nnoremap("[w", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Open floating win ( previously "GL")
nnoremap("<leader>d", function()
  vim.diagnostic.open_float({
    border = "rounded",
  })
end, { desc = "Open [D]iagnostics in a float win" })

-- Place all dignostics into a qflist
nnoremap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })

-- Navigate to next qflist item
nnoremap("<leader>cn", ":cnext<cr>zz")

-- Navigate to previos qflist item
nnoremap("<leader>cp", ":cprevious<cr>zz")

-- Open the qflist
nnoremap("<leader>co", ":copen<cr>zz")

-- Close the qflist
nnoremap("<leader>cc", ":cclose<cr>zz")

-- END DIAGNOSTICS --

-- NAVIGATION --

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>")

-- Resize split windows to be equal size
nnoremap("<leader>=", "<C-w>=")

-- Press leader rw to rotate open windows
nnoremap("<leader>rw", ":RotateWindows<cr>", { desc = "[R]otate [W]indows" })

-- Press gx to open the link under the cursor
nnoremap("gx", ":sil !open <cWORD><cr>", { silent = true })

-- TSC autocommand keybind to run TypeScripts tsc
nnoremap("<leader>tc", ":TSC<cr>", { desc = "[T]ypeScript [C]ompile" })

-- GRAPPLE - a replace for Harpoon, which doesn't seem to work

-- Open Grapple ui
nnoremap("<leader>ho", "<cmd>Grapple toggle_tags<cr>", { desc = "Grapple[H] [O]pen tags window" })
nnoremap("<leader>ht", "<cmd>Grapple toggle<cr>", { desc = "Grapple[H]] [T]oggle tag" })
nnoremap("<leader>hn", "<cmd>Grapple cycle_tags next<cr>", { desc = "Grapple[H] cycle [N]ext tag" })
nnoremap("<leader>hp", "<cmd>Grapple cycle_tags prev<cr>", { desc = "Grapple[H] cycle [P]rev tag" })

-- GIT --

nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<cr>")
nnoremap("<leader>gf", function()
  local cmd = {
    "sort",
    "-u",
    "<(git diff --name-only --cached)",
    "<(git diff --name-only)",
    "<(git diff --name-only --diff-filter=U)",
  }

  if not utils.is_git_directory() then
    vim.notify(
      "Current project is not a git directory",
      vim.log.levels.WARN,
      { title = "Telescope Git Files", git_command = cmd }
    )
  else
    require("telescope.builtin").git_files()
  end
end, { desc = "Search [G]it [F]iles" })

-- TELESCOPE
nnoremap("<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
nnoremap("<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch Open [B]uffers" })
nnoremap("<leader>sf", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "[S]earch [F]iles" })
nnoremap("<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
nnoremap("<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
nnoremap("<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
nnoremap("<leader>sd", require("telescope.builtin").git_files, { desc = "[S]earch [D]iagnostics" })

nnoremap("<leader>sc", function()
  require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "[S]earch [C]ommands" })

nnoremap("<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer]" })

nnoremap("<leader>ss", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "[S]earch [S]pelling suggestions" })

-- LSP --
-- (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --

M.map_lsp_keybinds = function(buffer_number)
  nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
  nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

  nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })

  -- Telescope LSP keybinds --
  nnoremap(
    "gr",
    require("telescope.builtin").lsp_references,
    { desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
  )

  nnoremap(
    "gi",
    require("telescope.builtin").lsp_implementations,
    { desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number }
  )

  nnoremap(
    "<leader>bs",
    require("telescope.builtin").lsp_document_symbols,
    { desc = "LSP: [B]uffer [S]ymbols", buffer = buffer_number }
  )

  nnoremap(
    "<leader>ps",
    require("telescope.builtin").lsp_workspace_symbols,
    { desc = "LSP: [P]roject [S]ymbols", buffer = buffer_number }
  )

  -- See `:help K` for why this keymap
  nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
  nnoremap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })
  inoremap("<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

  -- Lesser used LSP functionality
  nnoremap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })
  nnoremap("td", vim.lsp.buf.type_definition, { desc = "LSP: [T]ype [D]efinition", buffer = buffer_number })
end

-- Symbol Outline keybind
nnoremap("<leader>st", ":SymbolsOutline<cr>", { desc = "[S]ysmbols Outline [T]ree" })

-- Vim Illuminate keybinds
nnoremap("<leader>]", function()
  illuminate.goto_next_reference()
  vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto next reference" })

nnoremap("<leader>[", function()
  illuminate.goto_prev_reference()
  vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto previous reference" })

-- Open Copilot panel
nnoremap("<leader>oc", function()
  require("copilot.panel").open({})
end, { desc = "[O]pen [C]opilot panel" })

-- nvim-ufo keybinds
nnoremap("zR", require("ufo").openAllFolds)
nnoremap("zM", require("ufo").closeAllFolds)

-- Tabs
nnoremap("<leader>to", "<cmd>tabnew<CR>", { desc = "Open new Tab" })
nnoremap("<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Tab" })
nnoremap("<leader>tn", "<cmd>tabn<CR>", { desc = "goto Next Tab" })
nnoremap("<leader>tp", "<cmd>tabp<CR>", { desc = "goto Previous Tab" })
nnoremap("<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current bufFer in new Tab" })

-- Buffers
nnoremap("<leader>bn", "<cmd>bn<CR>", { desc = "Next buffer" })
nnoremap("<leader>bN", "<cmd>bp<CR>", { desc = "Previous buffer" })
nnoremap("<leader>bx", "<cmd>bd<CR>", { desc = "Close buffer" })
nnoremap("<tab>", "<cmd>bn<CR>", { desc = "Next Buf" })
nnoremap("<s-tab>", "<cmd>bp<CR>", { desc = "Prev Buf" })

-- Comments-TODO
local tc = require("todo-comments")
nnoremap("]t", function()
  tc.jump_next()
end, { desc = "Next todo comment" })
nnoremap("[t", function()
  tc.jump_prev()
end, { desc = "Previous todo comment" })

-- Comments - fast iomplementation for gcc (gbc)
nnoremap("<C-c>", comment.toggle.linewise.current, { desc = "Comment Toggle" })
nnoremap("<C-/>", comment.toggle.linewise.current, { desc = "Comment Toggle" })

-- Markdown Preview
nnoremap("<leader>mp", ":MarkdownPreviewToggle<CR>", { desc = "Markdown preview toggle" })

-- Conform formatting
nnoremap("<leader>fmm", function()
  require("conform").format({
    lsp_format = "fallback",
  })
end, { desc = "[C]onform [F]ormat code CurBuf[F]" })

-- Normal --
nnoremap("x", '"_x"', { desc = "Keymap hole" })

-- Insert --
inoremap("jk", "<esc>") -- map JK to exit I-mod bne

-- Visual --
vnoremap("<space>", "<nop>") -- Disable Space bar since it'll be used as the leader key

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vnoremap("L", "$<left>")
vnoremap("H", "^")

-- Paste without losing the contents of the register
xnoremap("<leader>p", '"_dP')

-- Move selected text up/down in visual mode
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")
vnoremap("<", "<gv", { desc = "Indent left in Visual mode" })
vnoremap(">", ">gv", { desc = "Indent right in Visual mode" })

-- Increment or decrement
nnoremap("<leader>+", "<C-a>", { desc = "Increment number" })
nnoremap("<leader>-", "<C-x>", { desc = "Decrement number" })

-- Reselect the last visual selection
xnoremap("<<", function()
  vim.cmd("normal! <<")
  vim.cmd("normal! gv")
end)
xnoremap(">>", function()
  vim.cmd("normal! >>")
  vim.cmd("normal! gv")
end)

-- Terminal --
-- Enter normal mode while in a terminal
tnoremap("<esc>", [[<C-\><C-n>]])
tnoremap("jk", [[<C-\><C-n>]])

-- Window navigation from terminal
tnoremap("<C-h>", [[<Cmd>wincmd h<CR>]])
tnoremap("<C-j>", [[<Cmd>wincmd j<CR>]])
tnoremap("<C-k>", [[<Cmd>wincmd k<CR>]])
tnoremap("<C-l>", [[<Cmd>wincmd l<CR>]])

-- Reenable default <space> functionality to prevent input delay
tnoremap("<space>", "<space>")

-- RETURN
return M
