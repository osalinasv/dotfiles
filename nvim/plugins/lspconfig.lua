return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  config = function()
    local config = require("plugins.configs.lspconfig")
    local on_attach = config.on_attach
    local capabilities = config.capabilities

    local lspconfig = require("lspconfig")
    local pid = vim.fn.getpid()

    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.tsserver.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.astro.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.omnisharp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "OmniSharp.exe", "--languageserver", "--hostPID", tostring(pid) },
      enable_import_completion = true,
      organize_imports_on_format = true,
      handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
      },
    })
  end,
}
