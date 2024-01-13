return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "Hoffs/omnisharp-extended-lsp.nvim",
    "antosha417/nvim-lsp-file-operations",
  },
  config = function()
    local pid = vim.fn.getpid()
    local lspconfig = require("lspconfig")

    local keymap = vim.keymap
    local function opts(desc, buf)
      return { buffer = buf, desc = desc, noremap = true }
    end

    keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts("Show line diagnostics"))
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Prev diagnostic"))
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local buf = ev.buf
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts("Show references", buf))
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration", buf))
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts("Show definitions", buf))
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts("Show implementations", buf))
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts("Show type definitions", buf))

        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Show code actions", buf))
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename", buf))
        keymap.set("n", "<F2>", vim.lsp.buf.rename, opts("Smart rename", buf))

        keymap.set("n", "<leader>bd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts("Show buffer diagnostics", buf))

        keymap.set("n", "K", vim.lsp.buf.hover, opts("Show documentation", buf))
        keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", opts("Restart LSP", buf))
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
