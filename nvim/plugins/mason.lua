return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    dofile(vim.g.base46_cache .. "mason")

    require("mason").setup({
      PATH = "skip",
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },
        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
          cancel_installation = "<C-c>",
        },
      },
      max_concurrent_installers = 10,
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
