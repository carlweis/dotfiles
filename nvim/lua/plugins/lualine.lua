-- Define a global variable to store the command message
local last_command_message = ""

-- Function to return the last command message
local function get_last_command_message()
  return last_command_message
end

-- Autocommand to capture command messages and update the last command message
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    last_command_message = vim.fn.getcmdline()
    vim.defer_fn(function()
      last_command_message = ""  -- Clear the message after a few seconds
    end, 5000) -- Message will disappear after 5 seconds
  end,
})

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = {
    "arkav/lualine-lsp-progress",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      section_separators = "",
      component_separators = "",
      globalstatus = true,
      theme = {
        normal = {
          a = { fg = "none", bg = "#252526" },
          b = { fg = "none", bg = "#252526" },
          c = { fg = "none", bg = "#252526" },
        },
        insert = {
          a = { fg = "none", bg = "#252526" },
          b = { fg = "none", bg = "#252526" },
          c = { fg = "none", bg = "#252526" },
        },
        visual = {
          a = { fg = "none", bg = "#252526" },
          b = { fg = "none", bg = "#252526" },
          c = { fg = "none", bg = "#252526" },
        },
        replace = {
          a = { fg = "none", bg = "#252526" },
          b = { fg = "none", bg = "#252526" },
          c = { fg = "none", bg = "#252526" },
        },
        command = {
          a = { fg = "none", bg = "#252526" },
          b = { fg = "none", bg = "#252526" },
          c = { fg = "none", bg = "#252526" },
        },
        inactive = {
          a = { fg = "none", bg = "#252526" },
          b = { fg = "none", bg = "#252526" },
          c = { fg = "none", bg = "#252526" },
        },
      },
    },
    sections = {
      lualine_a = {
        "mode",
      },
      lualine_b = {
        "branch",
        {
          "diff",
          symbols = { added = " ", modified = " ", removed = " " },
        },
        function()
          return "󰅭 " .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) or "")
        end,
        { "diagnostics", sources = { "nvim_diagnostic" } },
      },
      lualine_c = {
        "filename",
      },
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
        get_last_command_message,
      },
      lualine_y = {
        "filetype",
        "encoding",
        "fileformat",
      },
      lualine_z = {
        "searchcount",
        "selectioncount",
        "location",
        "progress",
      },
    },
  },
}
