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
