return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-h>"] = { "scroll_documentation_up", "fallback" },
        ["<C-l>"] = { "scroll_documentation_down", "fallback" },
        ["<C-q>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
    },
  },
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      {
        "<C-c-j>",
        "<Cmd>MultipleCursorsAddDown<CR>",
        mode = { "n", "x" },
        desc = "Add cursor below",
      },
      {
        "<C-c-k>",
        "<Cmd>MultipleCursorsAddUp<CR>",
        mode = { "n", "x" },
        desc = "Add cursor above",
      },
      {
        "<C-c-n>",
        "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Add cursor next match",
      },
      {
        "<C-c-w>",
        "<Cmd>MultipleCursorsAddMatches<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to current word",
      },
    },
  },
}
