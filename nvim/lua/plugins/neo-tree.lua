return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    -- Automatically open Neo-tree on startup
    vim.cmd([[autocmd VimEnter * Neotree position=current]])

    -- Toggle tree view at the current file's position
    -- NOT WORKING / MUST BE A PLUGIN/CONFIG CONFLICT
    -- vim.keymap.set("n", "<c-b>", ":Neotree toggle left<CR>")

    -- Open Neo-tree in fullscreen at the current file's location
    vim.keymap.set("n", "-", ":Neotree reveal position=current<CR>")

    -- Close/toggle the full view of Neo-tree
    vim.keymap.set("n", "_", ":Neotree close<CR>")
  end,
}
