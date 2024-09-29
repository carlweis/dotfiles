-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- File tree sidebar
return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  keys = {
    { '<leader>n', ':Neotree reveal toggle<CR>' },  -- Toggle Neo-tree with <leader>n
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    {
      's1n7ax/nvim-window-picker',
      opts = {
        filter_rules = {
          autoselect_one = true,
          include_current_win = true,  -- Allow the current window to be selected
          bo = {
            filetype = { 'neo-tree', "neo-tree-popup", "notify" },
            buftype = { 'terminal', "quickfix" },
          },
        },
      },
    },
  },
  opts = {
    close_if_last_window = true,
    hide_root_node = true,
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    source_selector = {
      winbar = false,
      statusline = false,
      separator = { left = " ", right= " " },
      show_separator_on_edge = true,
      highlight_tab = "SidebarTabInactive",
      highlight_tab_active = "SidebarTabActive",
      highlight_background = "StatusLine",
      highlight_separator = "SidebarTabInactiveSeparator",
      highlight_separator_active = "SidebarTabActiveSeparator",
    },
    default_component_configs = {
      indent = {
        padding = 0,
      },
      name = {
        use_git_status_colors = false,
        highlight_opened_files = true,
      },
    },
    window = {
      mappings = {
        ["<cr>"] = "open",  -- Open file directly without window picker
      },
    },
    filesystem = {
      hijack_netrw_behavior = "open_current",
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
        },
      },
      follow_current_file = {
        enabled = true,
      },
      group_empty_dirs = false
    },
  },
  config = function(_, opts)
    -- Apply options to Neo-tree
    require("neo-tree").setup(opts)

    -- Open Neo-tree in fullscreen at the current file's location
    vim.keymap.set("n", "-", ":Neotree reveal position=current<CR>")

    -- Close/toggle the full view of Neo-tree
    vim.keymap.set("n", "_", ":Neotree close<CR>")
  end
}
