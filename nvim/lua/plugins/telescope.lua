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
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg="#1a1a1a", fg="#1a1a1a" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg="#1a1a1a", fg="#1a1a1a" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg="#1a1a1a", fg="#1a1a1a" })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg="#1a1a1a", fg="#767676" })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg="#1a1a1a", fg="#1a1a1a" })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg="#1a1a1a", fg="#585858" })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { bg="#303030", fg="#afaf87" })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg="#1a1a1a", fg="#1a1a1a" })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg="#1a1a1a", fg="#1a1a1a" })
      vim.api.nvim_set_hl(0, "TelescopeMatching", { fg="#87af87" })

      -- Keymaps
      vim.keymap.set("n", "<leader>f", builtin.find_files, {})
      vim.keymap.set('n', '<leader>g', telescope.extensions.live_grep_args.live_grep_args, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})

      -- Telescope setup
      require("telescope").setup({
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
              ['<esc>'] = require('telescope.actions').close,
              ['<C-Down>'] = require('telescope.actions').cycle_history_next,
              ['<C-Up>'] = require('telescope.actions').cycle_history_prev,
            },
          },
          file_ignore_patterns = { '.git/' },
        },
        pickers = {
          find_files = require("telescope.themes").get_dropdown({
            previewer = false,
            hidden = true,
          }),
          buffers = require("telescope.themes").get_dropdown({
            previewer = false,
            layout_config = {
              width = 120,
            },
          }),
          oldfiles = require("telescope.themes").get_dropdown({
            previewer = false,
            prompt_title = 'History',
          }),
          lsp_references = require("telescope.themes").get_dropdown({
            previewer = false,
          }),
        },
      })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
