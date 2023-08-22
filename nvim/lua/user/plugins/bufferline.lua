require('bufferline').setup({
  options = {
    indicator = {
      icon = ' ',
    },
    show_close_icon = false,
    tab_size = 0,
    max_name_length = 25,
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  Files',
        highlight = '',
        text_align = 'left',
      },
    },
    separator_style = {'', ''},
    modified_icon = '',
    custom_areas = {
      left = function()
        return {
          { text = '    ', fg = '#8fff6d' },
        }
      end,
    },
  },
  highlights = {
    fill = {
      bg = { attribute = 'bg', highlight = '#1d232a' },
    },
    background = {
      bg = { attribute = 'bg', highlight = '#1e2328' },
    },
    tab = {
      bg = { attribute = 'bg', highlight = '#1e2329' },
    },
    tab_close = {
      bg = { attribute = 'bg', highlight = '#1e2329' },
    },
    close_button = {
      bg = { attribute = 'bg', highlight = '#1e2329' },
      fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    close_button_visible = {
      bg = { attribute = 'bg', highlight = 'StatusLine' },
      fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    close_button_selected = {
      fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    buffer_visible = {
      bg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    modified = {
      bg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    modified_visible = {
      bg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    duplicate = {
      bg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    duplicate_visible = {
      bg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    separator = {
      fg = { attribute = 'bg', highlight = 'StatusLine' },
      bg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    separator_selected = {
      fg = { attribute = 'bg', highlight = '#1e2329' },
      bg = { attribute = 'bg', highlight = '#1e2329' }
    },
    separator_visible = {
      fg = { attribute = 'bg', highlight = '#1e2329' },
      bg = { attribute = 'bg', highlight = '#1e2329' },
    },
  },
})
