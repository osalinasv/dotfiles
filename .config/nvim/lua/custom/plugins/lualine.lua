return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local mocha = require("catppuccin.palettes").get_palette("mocha")

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local theme = {
      normal = {
        a = { fg = mocha.crust, bg = mocha.blue },
        b = { fg = mocha.text, bg = mocha.mantle },
        c = { fg = mocha.text, bg = mocha.crust },
      },

      insert = { a = { fg = mocha.crust, bg = mocha.green } },
      visual = { a = { fg = mocha.crust, bg = mocha.mauve } },
      replace = { a = { fg = mocha.crust, bg = mocha.red } },
      command = { a = { fg = mocha.crust, bg = mocha.peach } },

      inactive = {
        a = { fg = mocha.text, bg = mocha.crust },
        b = { fg = mocha.text, bg = mocha.crust },
        c = { fg = mocha.text, bg = mocha.crust },
      },
    }

    local sections = {
      lualine_a = {
        { "mode", separator = { left = "" }, right_padding = 2 },
      },
      lualine_b = {
        "filename",
        {
          "branch",
          icon = "",
          color = { fg = mocha.mauve, gui = "bold" },
        },
        {
          "diff",
          -- Is it me or the symbol for modified us really weird
          symbols = { added = " ", modified = " ", removed = " " },
          diff_color = {
            added = { fg = mocha.green },
            modified = { fg = mocha.peach },
            removed = { fg = mocha.red },
          },
          cond = conditions.hide_in_width,
        },
      },
      lualine_c = {
        {
          function()
            return "%="
          end,
        },
        {
          function()
            local msg = "No Active LSP"
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = " LSP:",
          color = { fg = mocha.blue, gui = "bold" },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " " },
          diagnostics_color = {
            color_error = { fg = mocha.red },
            color_warn = { fg = mocha.yellow },
            color_info = { fg = mocha.mauve },
          },
        },
      },
      lualine_y = { "filetype", "encoding", "progress" },
      lualine_z = {
        {
          "location",
          separator = { right = "" },
          left_padding = 2,
        },
      },
    }

    require("lualine").setup({
      options = {
        theme = theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = sections,
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "filetype", "encoding" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
