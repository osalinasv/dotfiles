return {
  "NeogitOrg/neogit",
  event = "VeryLazy",
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

    local keymap = require("utils.keymap")
    keymap.map("n", "<C-g>", "<cmd>Neogit<CR>", "Open Neogit")
    keymap.map("n", "<leader>gg", "<cmd>Neogit<CR>", "Open Neogit")
  end,
}
