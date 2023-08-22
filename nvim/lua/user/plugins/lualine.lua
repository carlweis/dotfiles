local separator = { '"▏"', color = '#21272e' }

require('lualine').setup({
  options = {
    section_separators = '',
    component_separators = '',
    globalstatus = true,
    theme = {
      -- normal = {
      --   a = 'StatusLine',
      --   b = 'StatusLine',
      --   c = 'StatusLine',
      -- },
      normal = {
        a = { fg='#adbac7', bg='#1e2329', gui='' },
        b = { fg='#adbac7', bg='#1e2329', gui='' },
        c = { fg='#adbac7', bg='#1e2329', gui='' },
      },
      insert = {
        a = { fg='#1e2329', bg='#57ab5a', gui='' },
        b = { fg='#adbac7', bg='#1e2329', gui='' },
        c = { fg='#adbac7', bg='#1e2329', gui='' },
      },
      visual = {
        a = { fg='#1e2329', bg='#4378b8', gui='' },
        b = { fg='#adbac7', bg='#1e2329', gui='' },
        c = { fg='#adbac7', bg='#1e2329', gui='' },
      },
      command = {
        a = { fg='#1e2329', bg='#c59126', gui='' },
        b = { fg='#adbac7', bg='#1e2329', gui='' },
        c = { fg='#adbac7', bg='#1e2329', gui='' },
      },
    },
  },
  sections = {
    lualine_a = {
      'mode',
      separator = nil,
    },
    lualine_b = {
      'branch',
      'diff',
      separator = nil,
      '" " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
      { 'diagnostics', sources = { 'nvim_diagnostic' } },
      separator = nil,
    },
    lualine_c = {
      separator = nil,
      'filename'
    },
    lualine_x = {
      separator = nil,
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
      separator = nil,
      '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
      separator = nil,
    },
    lualine_z = {
      'location',
      'progress',
      separator = nil,
    },
  },
})
