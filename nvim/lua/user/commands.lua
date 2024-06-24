--  Fix issue with ColorScheme
vim.api.nvim_create_augroup('OneDarkHighlightGroup', { clear = true })

-- Create an autocommand to set the highlight when Vim enters
vim.api.nvim_create_autocmd('VimEnter', {
  group = 'OneDarkHighlightGroup',
  callback = function()
    vim.cmd('hi Comment guibg=#5c6370 guifg=#292c34')
  end,
})

-- strip trailing whitespace on save
--
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         vim.cmd("hi Normal guibg=none ctermbg=none")
--     end
-- })

-- vim.cmd([[
-- augroup MyColors
-- autocmd!
-- autocmd ColorScheme * highlight BufferLineFill guibg=#191724
-- autocmd ColorScheme * highlight BufferLineSeparator guifg=#191724
-- autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=#191724
-- augroup END

-- ]])
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
