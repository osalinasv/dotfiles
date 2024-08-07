return {
  {
    "hrsh7th/nvim-cmp",
    keys = {
      { "<Tab>", mode = { "i", "s" }, false },
      { "<S-Tab>", mode = { "i", "s" }, false },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-h>"] = cmp.mapping.scroll_docs(-4),
        ["<C-l>"] = cmp.mapping.scroll_docs(4),
        ["<C-q>"] = cmp.mapping.abort(),
      })

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      opts.experimental.ghost_text = false
      return opts
    end,
  },
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      {
        "<C-M-j>",
        "<Cmd>MultipleCursorsAddDown<CR>",
        mode = { "n", "x" },
        desc = "Add cursor below",
      },
      {
        "<C-M-k>",
        "<Cmd>MultipleCursorsAddUp<CR>",
        mode = { "n", "x" },
        desc = "Add cursor above",
      },
      {
        "<C-M-h>",
        "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Add cursor next match",
      },
      {
        "<C-LeftMouse>",
        "<Cmd>MultipleCursorsMouseAddDelete<CR>",
        mode = { "n", "i" },
        desc = "Add or remove cursor",
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
