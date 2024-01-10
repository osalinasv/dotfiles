return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<leader>g", ":LazyGit<CR>", { desc = "Open LazyGit" })
  end,
}
