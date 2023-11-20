return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "VeryLazy",
  opts = function()
    return require("custom.configs.null-ls")
  end,
}
