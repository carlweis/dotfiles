local actions = require('telescope.actions')

vim.api.nvim_set_hl(0, "TelescopeNormal", {bg="#1d232a"})
vim.api.nvim_set_hl(0, "TelescopeBorder", {bg="#1d232a", fg="#1d232a"})
vim.api.nvim_set_hl(0, "TelescopeTitle", {bg="#1d232a", fg="#1d232a"})
vim.api.nvim_set_hl(0, "TelescopePromptTitle", {bg="#1d232a", fg="#ffffff"})
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {bg="#1d232a", fg="#1d232a"})
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {bg="#1d232a", fg="#1d232a"})
vim.api.nvim_set_hl(0, "FloatBorder", {bg="#1d232a", fg="#1d232a"})

vim.cmd([[
  highlight link TelescopePromptTitle PMenuSel
  highlight link TelescopePreviewTitle PMenuSel
  highlight link TelescopePromptNormal NormalFloat
  highlight link TelescopePromptBorder FloatBorder
  highlight link TelescopeNormal CursorLine
  highlight link TelescopeBorder CursorLineBg
]])

require('telescope').setup({
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
      },
    },
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      previewer = false,
      hidden = true,
      theme = 'dropdown',
    },
    buffers = {
      previewer = false,
      theme = 'dropdown',
      layout_config = {
        width = 120,
      },
    },
    oldfiles = {
      previewer = false,
      theme = 'dropdown',
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
      theme = 'dropdown',
    },
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')

vim.keymap.set('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]])
vim.keymap.set('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<leader>g', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<leader>h', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
vim.keymap.set('n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
vim.keymap.set('n', '<leader>o', [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]])
vim.keymap.set('n', '<leader>l', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]])
