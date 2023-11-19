local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local pid = vim.fn.getpid()

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
})

lspconfig.astro.setup({
  on_attach = on_attach,
  capabilities = capabilities,
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
