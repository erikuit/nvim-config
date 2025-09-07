return {
  -- {
  --   'morhetz/gruvbox',
  --   priority = 1000,
  --   init = function()
  --     vim.cmd.colorscheme 'gruvbox'
  --     -- You can configure highlights by doing something like:
  --     vim.cmd.hi 'Comment gui=none'
  --     -- Remove background color
  --     vim.cmd 'autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE'
  --   end,
  -- },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'kanagawa'
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
      -- Remove background color
      vim.cmd 'autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE'
    end,
  },
}
