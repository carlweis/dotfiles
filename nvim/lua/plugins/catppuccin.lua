return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      color_overrides = {
        all = {
          base = "#212121",
          mantle = "#282828",
          crust = "#292929",
        },
      },

      custom_highlights = function(colors)
        return {
          CursorLine = { bg = "#252526" },
          Comment = { fg = '#6C7086' },
          TabLine = { bg = '#252526' },
          TabLineSel = { bg = '#212122', fg = '#87afaf' },
          Pmenu = { bg = '#252526' },
          PmenuSel = { bg = '#212122', fg = '#e5c890' },
        }
      end,
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
