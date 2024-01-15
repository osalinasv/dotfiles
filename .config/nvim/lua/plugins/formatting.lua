return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        astro = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
    })

    local keymap = require("utils.keymap")
    keymap.map({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      })
    end, "Format file or range")
  end,
}
