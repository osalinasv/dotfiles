return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
    opts = {
      region_check_events = "CursorHold,InsertLeave",
      delete_check_events = "TextChanged,InsertEnter",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<C-k>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<C-h>"] = cmp.mapping.scroll_docs(-4),
        ["<C-l>"] = cmp.mapping.scroll_docs(4),
        ["<C-q>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<S-Tab>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }
    end,
  },
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment_line = "gl",
        comment_visual = "gl",
      },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
}
