return {
  "kdheepak/lazygit.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local keymap = vim.keymap
    local function opts(desc)
      return { desc = desc, noremap = true }
    end

    keymap.set("n", "<C-g>", ":LazyGit<CR>", opts("Open LazyGit"))
    keymap.set("n", "<leader>gg", ":LazyGit<CR>", opts("Open LazyGit"))
  end,
}
