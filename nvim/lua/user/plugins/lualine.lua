local separator = { '"▏"', color = 'StatusLineNonText' }
local colors = {
    darkgray = "#262626",
    gray = "#262626",
    innerbg = "#262626",
    outerbg = "#262626",
    outerbg = "#262626",
    outerbg = "#262626",
    normal = "#9cdcfe",
    insert = "#4ec9b0",
    visual = "#c486c0",
    replace = "#e46876",
    command = "#e6c384",
}

require('lualine').setup({
  options = {
    section_separators = '',
    component_separators = '',
    globalstatus = true,
    theme = {
      normal = {
        a = 'Normal',
        b = 'Normal',
        c = 'Normal',
      },
    },
  },
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      'branch',
      'diff',
      '"🖧  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
      { 'diagnostics', sources = { 'nvim_diagnostic' } },
    },
    lualine_c = {
      'filename'
    },
    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
      '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
    },
    lualine_z = {
      'location',
      'progress',
    },
  },
})
