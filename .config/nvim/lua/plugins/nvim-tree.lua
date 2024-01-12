return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require("nvim-tree.api")

    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = desc, buffer = bufnr, noremap = true }
      end

      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "<C-t>", "", opts(""))
      vim.keymap.set("n", "<C-e>", api.tree.toggle, opts("Toggle file explorer"))
      vim.keymap.set("n", "<leader>ee", api.tree.toggle, opts("Toggle file explorer"))
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

    local keymap = vim.keymap
    local function opts(desc)
      return { desc = desc, noremap = true }
    end

    keymap.set("n", "<C-e>", api.tree.toggle, opts("Toggle file explorer"))
    keymap.set("n", "<leader>ee", api.tree.toggle, opts("Toggle file explorer"))
    keymap.set("n", "<leader>er", api.tree.reload, opts("Refresh file explorer"))
  end,
}