vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Dollar sign for PHP
vim.opt.iskeyword:append { '-', '$' }

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Visual
vim.opt.signcolumn = 'yes'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.scrolloff = 10
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Show substitutions while typing
vim.opt.inccommand = 'split'
-- Cursor
vim.opt.guicursor = 'n-v-i-c:block-Cursor'

-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
