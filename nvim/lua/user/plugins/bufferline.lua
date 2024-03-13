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
        highlight = 'Normal',
        text_align = 'left',
      },
    },
    separator_style = '',
    modified_icon = '*',
    custom_areas = {
      left = function()
        return {
          { text = '', fg = '#8fff6d' },
        }
      end,
    },
  },
  highlights = {
    fill = {
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    background = {
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    tab = {
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    tab_close = {
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    close_button = {
      bg = { attribute = 'bg', highlight = 'Normal' },
      fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    close_button_visible = {
      bg = { attribute = 'bg', highlight = 'Normal' },
      fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    close_button_selected = {
      fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    buffer_visible = {
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    modified = {
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    modified_visible = {
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    duplicate = {
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    duplicate_visible = {
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    separator = {
      fg = { attribute = 'bg', highlight = 'Normal' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
    separator_selected = {
      fg = { attribute = 'bg', highlight = 'Normal' },
      bg = { attribute = 'bg', highlight = 'Normal' }
    },
    separator_visible = {
      fg = { attribute = 'bg', highlight = 'StatusLine' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
  },
})
