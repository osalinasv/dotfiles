return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.section_separators = ""
      opts.options.component_separators = ""

      -- Remove mode section
      opts.sections.lualine_a = {}

      -- Remove root_dir from lazyvim
      table.remove(opts.sections.lualine_c, 1)

      opts.sections.lualine_y = {
        { "progress", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      }

      -- Remove time section
      opts.sections.lualine_z = {}
    end,
  },
}
