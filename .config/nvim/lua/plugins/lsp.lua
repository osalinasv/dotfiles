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
    dependencies = {
      { "Decodetalkers/csharpls-extended-lsp.nvim", lazy = true },
    },
    ---@class PluginLspOpts
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        astro = {},
        cssls = {},
        html = {},
        tailwindcss = {},
        tsserver = {},
        csharp_ls = {
          handlers = {
            ["textDocument/definition"] = require("csharpls_extended").handler,
            ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
          },
        },
      })
    end,
  },
}
