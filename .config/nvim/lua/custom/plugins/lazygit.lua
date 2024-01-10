return {
  "kdheepak/lazygit.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<C-g>", ":LazyGit<CR>", { desc = "Open LazyGit" })
    keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })
  end,
}
