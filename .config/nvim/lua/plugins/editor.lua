return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-q>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-h>"] = actions.preview_scrolling_up,
            ["<C-l>"] = actions.preview_scrolling_down,
          },
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            height = 0.8,
            width = function(_, cols, _)
              return math.min(160, math.floor(cols * 0.8))
            end,
            preview_width = function(_, cols, _)
              return math.min(75, math.floor(cols * 0.6))
            end,
            preview_cutoff = 75,
          },
        },
      })
    end,
  },
  {
    "folke/flash.nvim",
    opts = {
      label = {
        after = false,
        before = true,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
      return {
        {
          "<C-e>",
          function()
            require("neo-tree.command").execute({
              toggle = true,
            })
          end,
          desc = "Toggle explorer",
        },
      }
    end,
    opts = {
      window = {
        position = "right",
        width = 35,
        mappings = {
          ["<Tab>"] = "toggle_node",
          ["<C-g>"] = "none",
        },
      },
      filesystem = {
        use_libuv_file_watcher = false,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
          },
          never_show = {
            ".git",
          },
        },
      },
    },
  },
}
