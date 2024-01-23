return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  config = function()
    local pid = vim.fn.getpid()
    local lspconfig = require("lspconfig")

    local keymap = require("utils.keymap")
    keymap.map("n", "<leader>ld", vim.diagnostic.open_float, "Show line diagnostics")
    keymap.map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
    keymap.map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local buf = ev.buf
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        keymap.map("n", "gr", "<cmd>Telescope lsp_references<CR>", "Show references", { buffer = buf })
        keymap.map("n", "gD", vim.lsp.buf.declaration, "Go to declaration", { buffer = buf })
        keymap.map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show definitions", { buffer = buf })
        keymap.map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show implementations", { buffer = buf })
        keymap.map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show type definitions", { buffer = buf })

        keymap.map("n", "<leader>ca", vim.lsp.buf.code_action, "Show code actions", { buffer = buf })
        keymap.map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename", { buffer = buf })
        keymap.map("n", "<F2>", vim.lsp.buf.rename, "Smart rename", { buffer = buf })

        keymap.map(
          "n",
          "<leader>bd",
          "<cmd>Telescope diagnostics bufnr=0<CR>",
          "Show buffer diagnostics",
          { buffer = buf }
        )

        keymap.map("n", "K", vim.lsp.buf.hover, "Show documentation", { buffer = buf })
        keymap.map("n", "<leader>lr", "<cmd>LspRestart<CR>", "Restart LSP", { buffer = buf })
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = "󰅙 ", Warn = "󰀨 ", Hint = "󰓏 ", Info = "󰠠 " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig.html.setup({
      capabilities = capabilities,
    })

    -- lspconfig.biome.setup({
    --   capabilities = capabilities,
    -- })

    lspconfig.tsserver.setup({
      capabilities = capabilities,
    })

    lspconfig.astro.setup({
      capabilities = capabilities,
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })

    lspconfig.omnisharp.setup({
      capabilities = capabilities,
      cmd = { "OmniSharp.exe", "--languageserver", "--hostPID", tostring(pid) },
      enable_import_completion = true,
      organize_imports_on_format = true,
      handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
      },
    })

    lspconfig.lua_ls.setup({
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
