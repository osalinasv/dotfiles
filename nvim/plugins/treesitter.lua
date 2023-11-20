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
    autotag = { enable = true },
  },
}
