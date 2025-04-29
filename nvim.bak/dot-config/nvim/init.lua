-- setup sessionoptions as sugggested by auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Basic settings
require("luke.config.options")

-- Plugins with lua
require("luke.lazy")

-- Basic settings
require("luke.config.keymaps")
