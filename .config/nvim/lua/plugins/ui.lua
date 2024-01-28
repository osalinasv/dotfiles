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
    end,
  },
}
