return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { { "prettier", "biome" } },
        javascriptreact = { { "prettier", "biome" } },
        json = { "prettier" },
        jsonc = { "prettier" },
        less = { "prettier" },
        markdown = { "prettier" },
        scss = { "prettier" },
        typescript = { { "prettier", "biome" } },
        typescriptreact = { { "prettier", "biome" } },
        yaml = { "prettier" },
      },
    },
  },
}
