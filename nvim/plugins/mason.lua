return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    ensure_installed = {
      "omnisharp",
      "eslint-lsp",
      "lua-language-server",
      "astro-language-server",
      "typescript-language-server",
    },
  },
}
