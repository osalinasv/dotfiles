return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint_d",
        "prettier",
        "shellcheck",
        "stylua",
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
        cssls = {},
        html = {},
        tailwindcss = {},
        tsserver = {},
      },
    },
  },
}
