return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
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
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-h>"] = "which_key",
            ["<Esc>"] = actions.close,
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
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find string in buffers" })
    keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })

    -- keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
    -- keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
  end,
}
