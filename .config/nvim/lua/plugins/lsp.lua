return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "csharpier",
        "eslint_d",
        "prettier",
        "shellcheck",
        "stylua",
      },
      ui = {
        border = "rounded",
        width = 0.8,
        height = 0.8,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        astro = {},
        biome = {},
        cssls = {},
        html = {},
        tailwindcss = {},
      },
    },
  },
}
