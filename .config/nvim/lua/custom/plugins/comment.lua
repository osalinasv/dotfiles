return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    vim.g.skip_ts_context_commentstring_module = true

    local comment = require("Comment")
    local ts_context = require("ts_context_commentstring")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    ts_context.setup({
      enable_autocmd = false,
    })

    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<C-_>",
      "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
      { desc = "Toggle comment" }
    )
    keymap.set(
      "v",
      "<C-_>",
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Toggle comment" }
    )
  end,
}
