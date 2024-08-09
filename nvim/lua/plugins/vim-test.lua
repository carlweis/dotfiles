-- Configure vim testing

-- workflow: open tmux pane, leader + ap (attach pane), then run tests
return {
  "vim-test/vim-test",
  config = function()
    vim.keymap.set("n", "<Leader>t", ":TestNearest<CR>")
    vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>")
    vim.keymap.set("n", "<Leader>ts", ":TestSuite<CR>")
    vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>")
    vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>")
    vim.keymap.set("n", "<Leader>ap", ":VtrAttachToPane<CR>")

    vim.cmd([[
      let g:test#strategy = 'vtr'
    ]])
  end,
}
