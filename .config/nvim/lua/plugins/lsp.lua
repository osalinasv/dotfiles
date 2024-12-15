return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "css-lsp",
        "html-lsp",
        "zls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        biome = {},
        cssls = {},
        html = {},
        zls = {},
      },
    },
  },
}
