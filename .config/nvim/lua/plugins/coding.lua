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
        "<M-J>",
        "<Cmd>MultipleCursorsAddDown<CR>",
        mode = { "n", "x" },
        desc = "Add cursor below",
      },
      {
        "<M-K>",
        "<Cmd>MultipleCursorsAddUp<CR>",
        mode = { "n", "x" },
        desc = "Add cursor above",
      },
      {
        "<M-N>",
        "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Add cursor next match",
      },
    },
  },
}
