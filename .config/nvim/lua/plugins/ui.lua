return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.section_separators = ""
      opts.options.component_separators = ""

      opts.sections.lualine_z = { "encoding", "fileformat" }
    end,
  },
}
