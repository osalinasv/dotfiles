return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "Hoffs/omnisharp-extended-lsp.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local pid = vim.fn.getpid()

    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local on_attach = function(_, bufnr)
      local keymap = vim.keymap
      local function opts(desc)
        return { buffer = bufnr, desc = desc, noremap = true }
      end

      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts("Show LSP references"))
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts("Show LSP definitions"))
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts("Show LSP implementations"))
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts("Show LSP type definitions"))

      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions"))
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename"))
      keymap.set("n", "<F2>", vim.lsp.buf.rename, opts("Smart rename"))

      keymap.set("n", "<leader>bd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts("Show buffer diagnostics"))
      keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts("Show line diagnostics"))

      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Go to previous diagnostic"))
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Go to next diagnostic"))

      keymap.set("n", "K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor"))
      keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts("Restart LSP"))
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = "󰅙 ", Warn = "󰀨 ", Hint = "󰓏 ", Info = "󰠠 " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

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

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    })
  end,
}
