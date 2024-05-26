return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettier" },
        cs = { "csharpier" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { { "prettier", "biome" } },
        javascriptreact = { { "prettier", "biome" } },
        json = { "prettier" },
        jsonc = { "prettier" },
        less = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        scss = { "prettier" },
        sh = { "shfmt" },
        typescript = { { "prettier", "biome" } },
        typescriptreact = { { "prettier", "biome" } },
        yaml = { "prettier" },
      },
    },
  },
}
