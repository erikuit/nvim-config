vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'config.opt'
require 'config.keymap'
require 'config.autocmd'
require 'config.usercmd'

-- Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth',
  -- require 'plugins.debug',
  -- require 'plugins.autopairs',
  require 'theme',
  require 'plugins.lsp',
  require 'plugins.autocomplete',
  require 'plugins.telescope',
  require 'plugins.lint',
  require 'plugins.treesitter',
  require 'plugins.which-key',
  require 'plugins.autoformat',
  require 'plugins.indent-blankline',
  require 'plugins.gitsigns',
  require 'plugins.mini',
  require 'plugins.copilot',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
