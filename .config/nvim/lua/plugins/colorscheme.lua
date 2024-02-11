return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
