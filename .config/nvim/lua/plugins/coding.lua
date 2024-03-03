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
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
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
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      {
        "<C-A-j>",
        "<Cmd>MultipleCursorsAddDown<CR>",
        mode = { "n", "i" },
        desc = "Add cursor below",
      },
      {
        "<C-A-k>",
        "<Cmd>MultipleCursorsAddUp<CR>",
        mode = { "n", "i" },
        desc = "Add cursor above",
      },
      {
        "<C-A-n>",
        "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
        mode = { "n", "i" },
        desc = "Add cursor next match",
      },
      {
        "<Leader>cs",
        "<Cmd>MultipleCursorsAddMatches<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to current word",
      },
    },
  },
}
