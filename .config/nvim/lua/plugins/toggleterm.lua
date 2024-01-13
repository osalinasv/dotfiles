return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      open_mapping = "<C-t>",
      direction = "horizontal",
      close_on_exit = true,
    })
  end,
}
