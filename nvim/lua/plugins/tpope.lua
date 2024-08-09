return {
  { "tpope/vim-repeat" },      -- Enhances the '.' command to repeat the last change made by a plugin command.
  { "tpope/vim-sleuth" },      -- Automatically adjusts 'shiftwidth' and 'expandtab' based on the current file's indentation.
  { "tpope/vim-unimpaired", event = "VeryLazy" },  -- Provides handy bracket mappings for common tasks like toggling options and navigating buffers.
  { "tpope/vim-eunuch" },      -- Adds UNIX shell commands like :Delete, :Move, :Chmod, :Mkdir, etc., to Vim.
  { "tpope/vim-surround" },    -- Facilitates easy manipulation of surrounding characters like parentheses, quotes, etc.
  { "tpope/vim-commentary" },  -- Simplifies the process of commenting out code by providing the 'gc' mapping.
  { "tpope/vim-rails" },       -- Enhances Vim's support for Ruby on Rails development with additional commands and syntax highlighting.
  { "tpope/vim-projectionist" }, -- Manages project file layouts and alternative files, making it easier to switch between related files.
  {
    "tpope/vim-fugitive",      -- A Git wrapper that provides an extensive suite of Git commands within Vim.
    dependencies = {
      "tpope/vim-rhubarb",     -- Extends vim-fugitive with GitHub integration, providing commands to browse GitHub repositories.
    },
  },
  config = function()
    -- Maintain cursor position after commenting a paragraph
    vim.keymap.set("n", "gcap", "my<cmd>norm vip<bar>gc<cr>`y")
  end,
}

