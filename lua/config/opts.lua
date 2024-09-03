local opt = vim.opt

-- Columns
opt.number = true
opt.signcolumn = "yes"

-- Tabs & Indents
opt.shiftwidth = 4
opt.shiftround = true
opt.tabstop = 4
opt.autoindent = true
opt.expandtab = true

-- Search Options
opt.ignorecase = true
opt.smartcase = true

-- Cursor
opt.cursorline = true

-- Backspace
opt.backspace = "indent,start,eol"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Set Leader
local map = vim.api.nvim_set_keymap
map("n", "<space>", "", {})
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bypass netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Spell checking
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Set EOL
vim.o.fixeol = true
