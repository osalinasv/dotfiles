return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "css-lsp",
        "html-lsp",
        "prettier",
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
      inlay_hints = {
        enabled = false,
      },
      servers = {
        biome = {},
        cssls = {},
        html = {},
      },
    },
  },
}
