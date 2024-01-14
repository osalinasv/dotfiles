return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = false,
      sync_install = false,
      indent = { enable = true },
      autotag = { enable = true },
      highlight = { enable = true },
      incremental_selection = { enable = false },
      ensure_installed = {
        "astro",
        "c",
        "c_sharp",
        "cpp",
        "css",
        "diff",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "vim",
        "xml",
        "yaml",
      },
    })

    require("ts_context_commentstring").setup({
      enable_autocmd = true,
    })
  end,
}
