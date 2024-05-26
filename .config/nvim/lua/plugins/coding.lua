return {
  {
    "hrsh7th/nvim-cmp",
    keys = {
      { "<S-Tab>", mode = { "i", "s" }, false },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api
              .nvim_buf_get_lines(0, line - 1, line, true)[1]
              :sub(col, col)
              :match("%s")
            == nil
      end

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
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }
    end,
  },
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      -- TODO: Find a better key combination for these
      -- {
      --   "<C-Space-j>",
      --   "<Cmd>MultipleCursorsAddDown<CR>",
      --   mode = { "n", "x" },
      --   desc = "Add cursor below",
      -- },
      -- {
      --   "<C-Space-k>",
      --   "<Cmd>MultipleCursorsAddUp<CR>",
      --   mode = { "n", "x" },
      --   desc = "Add cursor above",
      -- },
      -- {
      --   "<C-Space-d>",
      --   "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
      --   mode = { "n", "x" },
      --   desc = "Add cursor next match",
      -- },
      {
        "<Leader>cs",
        "<Cmd>MultipleCursorsAddMatches<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to current word",
      },
    },
  },
}
