return {
  "rmagatti/auto-session",
  event = "VeryLazy",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Code", "~/Downloads", "~/Documents", "~/Desktop" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
  end,
}
