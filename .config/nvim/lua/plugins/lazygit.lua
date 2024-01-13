return {
  "kdheepak/lazygit.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local keymap = vim.keymap
    local function opts(desc)
      return { desc = desc, noremap = true }
    end

    keymap.set("n", "<C-g>", "<cmd>LazyGit<CR>", opts("Open LazyGit"))
    keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", opts("Open LazyGit"))
  end,
}
