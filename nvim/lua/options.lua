-- Leader Key
vim.g.mapleader = " "               -- Set leader key to space
vim.g.maplocalleader = " "          -- Set local leader key to space

-- Tabs/Spaces
vim.opt.expandtab = true            -- Use spaces instead of tabs
vim.opt.tabstop = 2                 -- Number of spaces a tab counts for
vim.opt.softtabstop = 2             -- Number of spaces for a soft tab
vim.opt.shiftwidth = 2              -- Number of spaces to use for autoindent
vim.opt.smartindent = true          -- Smart autoindenting

-- Line Numbers
vim.opt.number = true               -- Show line numbers
vim.opt.relativenumber = true       -- Show relative line numbers

-- Backup
vim.opt.backup = true               -- Enable backup files
vim.opt.backupdir:remove('.')       -- Exclude current directory from backups
vim.opt.undofile = true             -- Enable persistent undo

-- Interface
vim.opt.cursorline = true           -- Highlight the current line
vim.opt.fillchars:append({ eob = ' ' }) -- Remove the ~ from the end of buffer
vim.opt.mouse = 'a'                 -- Enable mouse for all modes
vim.opt.scrolloff = 8               -- Minimum lines to keep above and below the cursor
vim.opt.sidescrolloff = 8           -- Minimum columns to keep to the left and right of the cursor
vim.opt.signcolumn = 'yes:2'        -- Always show the sign column with 2 columns width
vim.opt.splitbelow = true           -- Horizontal splits open below the current window
vim.opt.splitright = true           -- Vertical splits open to the right of the current window
vim.opt.termguicolors = true        -- Enable true color support
vim.opt.title = true                -- Set the terminal title
vim.opt.wrap = false                -- Disable line wrapping
vim.opt.list = true                 -- Show whitespace characters
vim.opt.listchars = { tab = '▸ ', trail = '·' } -- Characters to use for displaying whitespace
vim.opt.cmdheight = 0               -- Makes the command line appear and disappear faster

-- Clipboard
vim.opt.clipboard = 'unnamedplus'   -- Use system clipboard

-- Completion
vim.opt.completeopt = 'menuone,longest,preview' -- Completion options
vim.opt.wildmode = 'longest:full,full' -- Command-line completion mode

-- Search
vim.opt.ignorecase = true           -- Ignore case in search patterns
vim.opt.smartcase = true            -- Override ignorecase if search pattern contains uppercase letters

-- Miscellaneous
vim.opt.confirm = true              -- Ask for confirmation instead of erroring
vim.opt.showmode = false            -- Don't show mode (e.g., -- INSERT --)
vim.opt.showtabline = 1             -- Always show tabline with one tab
vim.opt.spell = false               -- Disable spell checking
