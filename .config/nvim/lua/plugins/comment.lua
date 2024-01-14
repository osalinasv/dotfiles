return {
  "numToStr/Comment.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })

    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })

    local keymap = require("utils.keymap")
    keymap.map("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", "Toggle comment")
    keymap.map("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", "Toggle comment")
  end,
}
