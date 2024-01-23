return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require("nvim-tree.api")
    local keymap = require("utils.keymap")

    local function on_attach(buf)
      api.config.mappings.default_on_attach(buf)
      keymap.map("n", "<C-e>", api.tree.toggle, "Toggle explorer", { buffer = buf })
      keymap.map("n", "<leader>ee", api.tree.toggle, "Toggle explorer", { buffer = buf })
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_open = "",
              arrow_closed = "",
            },
          },
        },
      },
      filters = {
        git_ignored = false,
        custom = { "\\.git" },
      },
      -- disable window_picker for explorer to work well with window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
    })

    keymap.map("n", "<C-e>", api.tree.toggle, "Toggle explorer")
    keymap.map("n", "<leader>ee", api.tree.toggle, "Toggle explorer")
    keymap.map("n", "<leader>er", api.tree.reload, "Refresh explorer")
  end,
}
