-- NEOVIM OPTIONS

-- Top {{{
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.scriptencoding = "utf-8"
--}}}

-- Coinciseness {{{
local opt = vim.opt
-- }}}

-- General {{{
opt.encoding = "utf-8" -- set encoding UTF-8
opt.fileencoding = "utf-8" -- set encoding UTF-8
opt.title = true
opt.backup = false -- disable backup file creation
opt.showcmd = true -- show last command
opt.cmdheight = 0 --
opt.laststatus = 0 --
opt.inccommand = "split"
opt.splitright = true -- split vertical win to the right
opt.splitbelow = true -- split horizontal win to the bottom
opt.splitkeep = "cursor"
opt.conceallevel = 0 -- show conceal characters in markdown files
opt.mouse = "a" -- enable mouse support
opt.cursorline = true -- enable mouse
opt.undofile = true -- enable persistant undo
opt.clipboard = "unnamedplus" -- enable sys clipboard access
-- opt.clipboard:append("unnamedplus") -- use sys clipboard as default register
opt.path:append({ "**" }) -- Search down in subfolders
opt.wildignore:append({ "*/node_modules/*" }) -- Avoid node_modules
-- }}}

-- Colors {{{
opt.termguicolors = true -- enable term GUI colors
-- opt.background = "dark"  -- light || dark
opt.formatoptions:append({ "r" })
-- }}}

-- Spacing / Behaviors {{{
opt.number = true -- display line numbers
opt.relativenumber = true -- display relative numbers
opt.numberwidth = 3 -- width of linenumbers collumn
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.wrap = false --(true) display lines as single lines
opt.scrolloff = 2 -- number of lines to keep above/belove cursor
opt.sidescrolloff = 2 -- number of columns to keep to the left/right of cursor
opt.autoindent = true
opt.smartindent = true -- enable smart function
opt.smarttab = true
opt.tabstop = 2 -- number of spaces inserted for <TAB> character
opt.softtabstop = 2 -- number of spaces inserted for <TAB> key
opt.shiftwidth = 2 -- number of spaces inserted for each indentation level
opt.expandtab = true -- convert tabs to spaces
opt.breakindent = true -- enable line breaking indentation
opt.backspace = { "start", "eol", "indent" } -- allow bcakspace on indent EOL or 'I'start position
opt.foldmethod = "marker"
opt.virtualedit = "block" -- (C-v) Visual-BLOCK made easy
-- }}}

-- Search {{{
opt.hlsearch = true -- enable highlight of searches
opt.ignorecase = true -- case insensitive (useful in commands)
opt.smartcase = true -- case is smart
-- }}}

-- More Behaviors {{{
-- Black, the python formatter wants to know
-- Lets try toput ths before everyting else
-- vim.cmd("let g:black_virtualenv = '~/.local/share/nvim/mason/packages/black/venv'")
-- vim.cmd("let g:python3_host_prog = '~/.local/share/nvim/mason/packages/black/venv/bin/python'")

-- }}}
