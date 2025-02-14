return {
  "snacks.nvim",
  ---@type snacks.Config
  opts = {
    indent = { enabled = false },
    picker = {
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
      sources = {
        buffers = {
          hidden = true,
        },
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
        explorer = {
          hidden = true,
          jump = { close = true },
          layout = { layout = { position = "right" } },
        },
      },
    },
  },
}
