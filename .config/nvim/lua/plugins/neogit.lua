return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("neogit").setup({
      kind = "auto",
      graph_style = "unicode",
    })

    local keymap = vim.keymap
    local function opts(desc)
      return { desc = desc, noremap = true }
    end

    keymap.set("n", "<C-g>", "<cmd>Neogit<CR>", opts("Open Neogit"))
    keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", opts("Open Neogit"))
  end,
}
