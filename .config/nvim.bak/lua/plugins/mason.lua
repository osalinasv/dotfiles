return {
  "williamboman/mason.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_pending = "󰻃 ",
          package_installed = "󰗠 ",
          package_uninstalled = "󰝦 ",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "astro",
        "biome",
        "cssls",
        "html",
        "lua_ls",
        "omnisharp",
        "tailwindcss",
        "tsserver",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "eslint_d",
        "prettier",
        "stylua",
      },
    })
  end,
}
