return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "astro",
      "c",
      "c_sharp",
      "cpp",
      "css",
      "diff",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "typescript",
      "xml",
    },
    sync_install = false,
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "syntax")

    opts.autotag = { enable = true }
    require("nvim-treesitter.configs").setup(opts)
  end,
}
