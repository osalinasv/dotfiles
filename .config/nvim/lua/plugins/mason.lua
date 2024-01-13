return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      max_concurrent_installers = 10,
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
        "html",
        "cssls",
        "lua_ls",
        "tsserver",
        "astro",
        "omnisharp",
        "tailwindcss",
      },
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
      },
    })
  end,
}
