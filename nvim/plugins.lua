--@type NvPluginSpec[]
local plugins = {
  {
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
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "omnisharp",
        "eslint-lsp",
        "lua-language-server",
        "astro-language-server",
        "typescript-language-server",
      },
    },
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    event = "VeryLazy",
    lazy = true
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
      },
      automatic_installation = false,
      handlers = {},
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
}

return plugins
