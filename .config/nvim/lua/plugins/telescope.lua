return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local config = require("telescope.config")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    local vimgrep_arguments = { table.unpack(config.values.vimgrep_arguments) }
    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.setup({
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
        file_ignore_patterns = { "node_modules" },
        mappings = {
          i = {
            ["<C-h>"] = actions.which_key,
            ["<Esc>"] = actions.close,
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
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = require("utils.keymap")
    keymap.map("n", "<leader>ff", builtin.find_files, "Find files")
    keymap.map("n", "<leader>fs", builtin.live_grep, "Find string")
    keymap.map("n", "<leader>fb", builtin.buffers, "Find opened buffers")
    keymap.map("n", "<leader>fc", builtin.grep_string, "Find string under cursor")
  end,
}
