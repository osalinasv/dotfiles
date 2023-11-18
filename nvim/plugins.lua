---@type NvPluginSpec[]
local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
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
      "xml"
    },
    sync_install = false
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "eslint-lsp",
        "astro-language-server",
        "typescript-language-server"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.formatter"
  --   end
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function()
  --     require "custom.configs.lint"
  --   end
  -- }
}

return plugins
