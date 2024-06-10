local actions = require('telescope.actions')

require('telescope').setup({
    defaults = {
      path_display = { truncate = 1 },
      prompt_prefix = '   ',
      selection_caret = '  ',
      layout_config = {
        prompt_position = 'top',
      },
      theme = 'dropdown',
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
        theme = 'dropdown',
      },
      buffers = {
        previewer = false,
        layout_config = {
          width = 80,
        },
        theme = 'dropdown',
      },
      oldfiles = {
        previewer = false,
        prompt_title = 'History',
        theme = 'dropdown'
      },
      lsp_references = {
        previewer = false,
        theme = 'dropdown',
      },
      lsp_definitions = {
        previewer = false,
        theme = 'dropdown'
      },
      lsp_document_symbols = {
        symbol_width = 55,
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
