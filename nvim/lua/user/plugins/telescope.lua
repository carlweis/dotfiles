local actions = require('telescope.actions')
-- vim.api.nvim_set_hl(0, "TelescopeNormal", {bg="#212121", fg="#212121"})
-- vim.api.nvim_set_hl(0, "TelescopeBorder", {bg="#212121", fg="#212121"})
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", {bg="#212121", fg="#212121"})
-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", {bg="#212121", fg="#adbac7"})
-- vim.api.nvim_set_hl(0, "TelescopePromptTitle", {bg="#212121", fg="#adbac7"})
-- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", {bg="#212121", fg="#adbac7"})
-- vim.api.nvim_set_hl(0, "TelescopeSelection", {bg="#303030", fg="#adbac7"})
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {bg="#212121", fg="#212121"})
-- vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {bg="#212121", fg="#212121"})


-- Transparency
-- vim.api.nvim_set_hl(0, "TelescopeNormal", {bg="none", fg="#212121"})
-- vim.api.nvim_set_hl(0, "TelescopeBorder", {bg="none", fg="#212121"})
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", {bg="none", fg="#212121"})
-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", {bg="none", fg="#adbac7"})
-- vim.api.nvim_set_hl(0, "TelescopePromptTitle", {bg="none", fg="#adbac7"})
-- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", {bg="none", fg="#adbac7"})
-- vim.api.nvim_set_hl(0, "TelescopeSelection", {bg="#303030", fg="#adbac7", blend=60})
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {bg="none", fg="#212121"})
-- vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {bg="none", fg="#212121"})

require('telescope').setup({
defaults = {
  path_display = { truncate = 1 },
  prompt_prefix = '   ',
  selection_caret = '  ',
  layout_config = {
    prompt_position = 'top',
  },
  preview = false,
  -- preview = {
  --   timeout = 200,
  -- },
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
extensions = {
  live_grep_args = {
    mappings = {
      i = {
        ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
        ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
      },
    },
  },
},
pickers = {
  find_files = {
    hidden = true,
  },
  buffers = {
    previewer = false,
    layout_config = {
      width = 80,
    },
  },
  oldfiles = {
    prompt_title = 'History',
  },
  lsp_references = {
    previewer = false,
  },
  lsp_definitions = {
    previewer = false,
  },
  lsp_document_symbols = {
    symbol_width = 55,
  },
},
})

require('telescope').load_extension('fzf')

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
