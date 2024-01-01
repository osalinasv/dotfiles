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
      sync_install = false,
      indent = { enable = true },
      autotag = { enable = true },
      highlight = { enable = true },
      ensure_installed = {
        "astro",
        "c_sharp",
        "c",
        "cpp",
        "css",
        "diff",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown_inline",
        "markdown",
        "tsx",
        "typescript",
        "vim",
        "xml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })

    require("ts_context_commentstring").setup({
      enable_autocmd = true,
    })
  end,
}
