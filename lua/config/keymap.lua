-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Center screen when moving up or down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz', { desc = 'Next search result with centering' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Previous search result with centering' })

-- Quickly edit vim config
vim.keymap.set('n', '<leader>vc', ':e ~/.config/nvim/init.lua<CR>:lcd %:p:h<CR>', { desc = 'Edit nvim config' })

-- Add newline without leaving normal mode
vim.keymap.set('n', '<M>o', 'o<Esc>', { desc = 'Add newline below' })
vim.keymap.set('n', '<M>O', 'O<Esc>', { desc = 'Add newline above' })

-- Move selected line / block of text in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR><CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR><CR>gv=gv")

vim.keymap.set({ 'n', 'v' }, '<C-a>', '^', { desc = 'Move to the first non-blank character of the line' })
vim.keymap.set({ 'n', 'v' }, '<C-e>', '$', { desc = 'Move to the last character of the line' })

-- Prefill replace command
vim.keymap.set('n', 'S', ':%s//g<Left><Left>')

-- Execute shell commands on the current buffer
vim.keymap.set('n', '<leader>!', ':%!', { desc = 'Execute shell command on buffer' })

-- Toggle MiniFiles binding
vim.keymap.set('n', '`', '<Cmd>lua MiniFiles.open()<CR>')

-- Move through buffers with Ctrl + n/p
vim.keymap.set('n', '<C-n>', '<Cmd>bn<CR>', { desc = 'Move to next buffer' })
vim.keymap.set('n', '<C-p>', '<Cmd>bp<CR>', { desc = 'Move to previous buffer' })

-- Remove trailing whitespace
local remove_trailing_whitespace = function()
  local save_cursor = vim.fn.getpos '.'
  vim.cmd [[%s/\s\+$//e]]
  vim.fn.setpos('.', save_cursor)
end

vim.keymap.set('n', '<leader>w', remove_trailing_whitespace, { desc = 'Remove trailing whitespace' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.o.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Leader p to keep the yank buffer after pasting in visual mode
vim.keymap.set('v', '<leader>p', '"_dP', { desc = 'Paste after yanking in visual mode' })

-- Use K in normal mode to split a line
vim.keymap.set('n', 'K', 'i<CR><Esc>')

-- Don't add spaces when joining lines
vim.keymap.set('n', 'J', 'gJ')

-- Disable/enable formatting
vim.keymap.set('n', '<leader>fd', '<cmd>FormatDisable<CR>', { desc = 'Disable formatting' })
vim.keymap.set('n', '<leader>fe', '<cmd>FormatEnable<CR>', { desc = 'Enable formatting' })

-- Navigate through the quickfix list
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<C-q>', '<cmd>cclose<CR>', { desc = 'Close the quickfix list' })

-- Simpler find and replace in the quickfix list
vim.api.nvim_create_user_command('QfReplace', function(opts)
  vim.api.nvim_command(string.format('cdo s/%s/%s', opts.fargs[1], opts.fargs[2]))
  vim.api.nvim_command 'cfdo update'
end, { nargs = '*' })

vim.keymap.set('n', '<leader>fr', ':QfReplace ', { desc = 'Find and replace in quickfix list' })
