-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- tabs/spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- line numers
vim.cmd("set number")

-- NEED TO ORGANIZE
vim.opt.backup = true -- automatically save a backup file
vim.opt.backupdir:remove('.') -- keep backups out of the current directory
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.completeopt = 'menuone,longest,preview'
vim.opt.confirm = true -- ask for confirmation instead of erroring
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
vim.opt.ignorecase = true
vim.opt.list = true -- enable the below listchars
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.mouse = 'a' -- enable mouse for all modes
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes:2'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.spell = false -- spelling
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.undofile = true -- persistent undo
vim.opt.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.wrap = true