return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme vscode")

    -- color overrides
    -- vim.api.nvim_set_hl(0, "VertSplit",    { fg = "#252526", bg = "none" })      -- Vertical split line color
    -- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#252526", bg = "none" })      -- Window separator for newer Neovim versions
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#252526", bg = "#252526" })                   -- Change current line number color
    -- vim.api.nvim_set_hl(0, "SignColumn",   { bg = "#252526", fg = "#252526" })   -- Gutter background and foreground
    -- vim.api.nvim_set_hl(0, "Normal",       { bg = "#252526" })                   -- Background color for the editor
    -- vim.api.nvim_set_hl(0, "TabLine",      { fg = "#a0a0a0", bg = "#212121" })   -- Unselected tab color
    -- vim.api.nvim_set_hl(0, "TabLineSel",   { fg = "#87afaf", bg = "#252526" })   -- Selected tab color
    -- vim.api.nvim_set_hl(0, "TabLineFill",  { bg = "#252526" })                   -- Background behind tabs
    -- vim.api.nvim_set_hl(0, "QuickFix", { bg = "#212121" })
    -- vim.api.nvim_set_hl(0, "QuickFixLine", { bg = "#212121" })
  end,
}
