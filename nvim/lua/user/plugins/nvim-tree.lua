require('nvim-tree').setup({
  respect_buf_cwd = true,
  git = {
    ignore = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})
vim.g.nvim_tree_respect_buf_cwd = 1
vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>')
