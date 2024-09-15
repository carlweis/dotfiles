return {
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim" ,
      build = "make",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      telescope.load_extension('live_grep_args')

      -- Styles
      vim.api.nvim_set_hl(0, "TelescopeNormal", {bg="#212122", fg="#212122"})
      vim.api.nvim_set_hl(0, "TelescopeBorder", {bg="#212122", fg="#212122"})
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", {bg="#212122", fg="#212122"})
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", {bg="#212122", fg="#bcbcbc"})
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", {bg="#212122", fg="#212122"})
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", {bg="#212122", fg="#6c7086"})
      vim.api.nvim_set_hl(0, "TelescopeSelection", {bg="#2C2C2C", fg="#cdd6f5"})
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {bg="#212122", fg="#212122"})
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {bg="#212122", fg="#212122"})
      -- vim.api.nvim_set_hl(0, "TelescopeMatching", {fg="#d7d787"})
      vim.api.nvim_set_hl(0, "TelescopeMatching", {fg="#a6e3a2"})

      -- Keymaps
      vim.keymap.set("n", "<leader>f", builtin.find_files, {})
      vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})

      -- vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      -- vim.keymap.set('n', '<leader>F', builtin.find_files, { no_ignore = true, prompt_title = 'All Files' })
      -- vim.keymap.set('n', '<leader>g', telescope.extensions.live_grep_args.live_grep_args, {})
      -- vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {})
      -- vim.keymap.set('n', '<leader>o', builtin.lsp_document_diagnostics, {})
      -- vim.keymap.set('n', '<leader>l', builtin.lsp_references, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local actions = require('telescope.actions')
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        },
         defaults = {
          path_display = { truncate = 1 },
          prompt_prefix = '  ',
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
      require("telescope").load_extension("ui-select")
    end
  }
}
