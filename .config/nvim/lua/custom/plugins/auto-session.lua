return {
  "rmagatti/auto-session",
  event = "VeryLazy",
  enabled = false,
  config = function()
    local function change_nvim_tree_dir()
      local api = require("nvim-tree.api")
      api.tree.change_root(vim.fn.getcwd())
      api.tree.open({ find_file = true })
    end

    require("auto-session").setup({
      log_level = "error",
      post_restore_cmds = { change_nvim_tree_dir },
      pre_save_cmds = { "NvimTreeClose" },
      post_save_cmds = { "NvimTreeOpen" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for cwd" })
  end,
}
