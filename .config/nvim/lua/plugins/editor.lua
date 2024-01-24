return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-h>"] = actions.preview_scrolling_up,
            ["<C-l>"] = actions.preview_scrolling_down,
          },
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            width = function(_, cols, _)
              return math.min(160, math.floor(cols * 0.9))
            end,
            preview_width = function(_, cols, _)
              return math.min(80, math.floor(cols * 0.6))
            end,
            preview_cutoff = 80,
          },
        },
      })
    end,
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
        width = 35,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {
            ".git",
          },
        },
      },
    },
  },
}
