return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options, {
        section_separators = "",
        component_separators = "",
      })

      opts.sections.lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
        },
      }

      -- Remove Util.lualine.root_dir()
      table.remove(opts.sections.lualine_c, 1)

      -- Move location section to end
      opts.sections.lualine_y = {
        { "progress", padding = { left = 1, right = 1 } },
      }
      opts.sections.lualine_z = {
        { "location", padding = { left = 0, right = 1 } },
      }
    end,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
      mappings = {
        object_scope = "",
        object_scope_with_border = "",
        goto_top = "",
        goto_bottom = "",
      },
    },
  },
}
