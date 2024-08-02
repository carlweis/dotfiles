return {
  "folke/zen-mode.nvim",
  config = function()
    vim.keymap.set('n', '<Leader>z', ':ZenMode<CR>')
  end
}
