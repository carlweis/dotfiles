-- auto reload kitty config on save
vim.api.nvim_create_autocmd("BufWritePost", {
  -- pattern = "~/.config/kitty/kitty.conf",
  pattern = "./terminals/kitty/kitty.conf",
  command = [[silent !kill -SIGUSR1 $(pgrep kitty)]],
})

-- strip trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- automatically rebalance windows on vim resize
vim.api.nvim_create_autocmd({ "VimResized" }, {
  pattern = { "*" },
  command = [[wincmd =]],
})

-- convert tabs to spaces
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  command = [[retab]],
})

-- markdown
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*.md" },
  command = [[set filetype=markdown]],
})

-- wrap the quickfix window
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf" },
  command = [[setlocal wrap linebreak]],
})

-- don't automatically continue comments after newline
-- vim.api.nvim_create_autocmd({ "BufNewFile,BufRead" }, {
--   pattern = { "*" },
--   command = [[setlocal formatoptions-=cro]],
-- })

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#45475b", fg = "none" }) -- Set your desired background and foreground colors

vim.api.nvim_create_autocmd("textyankpost", {
  desc = "highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'YankHighlight', timeout = 200 })
  end,
})
