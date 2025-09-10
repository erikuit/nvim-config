vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.opt.clipboard:append { 'unnamedplus' }
vim.o.mouse = 'a'
vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.jumpoptions = 'stack,view'

-- Dollar sign for PHP
vim.opt.iskeyword:append { '-', '$' }

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.breakindent = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Visual
vim.o.signcolumn = 'yes'
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.scrolloff = 10
-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
-- Show substitutions while typing
vim.o.inccommand = 'split'
-- Cursor
vim.o.guicursor = 'n-v-i-c:block-Cursor'

-- Decrease update time
vim.o.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.o.timeoutlen = 300
