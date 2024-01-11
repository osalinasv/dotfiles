return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]],
      direction = "horizontal",
      close_on_exit = true,
    })

    local keymap = vim.keymap
    local opts = { buffer = 0 }

    keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  end,
}
