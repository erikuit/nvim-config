return {
  'github/copilot.vim',
  config = function()
    if vim.env.COPILOT_DISABLED == '1' then
      vim.cmd ':Copilot disable'
    end
  end,
}
