local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.eslint,
  null_ls.builtins.formatting.prettier.with({
    extra_filetypes = { "astro" },
  }),
}

local opts = {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- vim.lsp.buf.format({ bufnr = bufnr })
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
}

return opts
