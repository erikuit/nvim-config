-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Hide the cmdline when it's not in use
vim.opt.cmdheight = 0
vim.api.nvim_create_augroup('MacroCmdHeight', { clear = true })
vim.api.nvim_create_autocmd('RecordingEnter', {
  group = 'MacroCmdHeight',
  callback = function()
    vim.opt.cmdheight = 1
  end,
})

vim.api.nvim_create_autocmd('RecordingLeave', {
  group = 'MacroCmdHeight',
  callback = function()
    vim.opt.cmdheight = 0
  end,
})

-- Use 'q' to close some buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'qf', 'help' },
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
  end,
})
