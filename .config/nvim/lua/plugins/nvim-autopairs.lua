return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    -- Maybe remove this if it keeps adding parens after JSX component
    -- https://github.com/LunarVim/LunarVim/pull/2083/files
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
