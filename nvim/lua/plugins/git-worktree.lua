return {
  -- "ThePrimeagen/git-worktree.nvim",
  -- config = function()
  --   -- Ensure Telescope is set up properly
  --   local telescope = require("telescope")
  --   telescope.load_extension("git_worktree")

  --   -- Set up git-worktree.nvim configuration
  --   require("git-worktree").setup({
  --     change_directory_command = "cd",
  --     update_on_change = true,
  --     update_on_change_command = "e .",
  --     clearjumps_on_change = true,
  --     autopush = false
  --   })

  --   -- Keybindings for managing worktrees
  --   local map = vim.api.nvim_set_keymap
  --   local opts = { noremap = true, silent = true }

  --   -- List worktrees and switch between them
  --   map("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)

  --   -- Create a new worktree
  --   map("n", "<leader>ga", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", opts)

  --   -- Remove a worktree by selecting it and pressing <C-d> in the Telescope prompt
  --   map("n", "<leader>gr", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
  -- end,
}
