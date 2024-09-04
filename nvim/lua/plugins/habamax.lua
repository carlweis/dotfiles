return {
  "ntk148v/habamax.nvim",
  lazy = false,
  name = "habamax",
  priority = 1000,
  dependencies = {
    "rktjmp/lush.nvim"
  },
  config = function()
    -- Set the colorscheme
    vim.cmd("colorscheme habamax")

    -- Color overrides
    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#252526", bg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#252526", bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#252526" })   -- Change current line number
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1c1c1c", fg = "#1c1c1c" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1c1c1c" })
  end,
}
