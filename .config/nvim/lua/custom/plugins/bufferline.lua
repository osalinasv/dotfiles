return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup()

    local keymap = vim.keymap

    keymap.set("n", "<Tab>", ":BufferLineCycleNext<cr>", { desc = "Go to next buffer" })
    keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { desc = "Go to previous buffer" })
    keymap.set("n", "<leader>x", ":enew<bar>bd #<CR>", { desc = "Close current buffer" })
  end,
}
