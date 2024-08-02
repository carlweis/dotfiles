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
    })
    vim.cmd("colorscheme catppuccin")
  end,
}
