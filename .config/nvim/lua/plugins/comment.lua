return {
  "numToStr/Comment.nvim",
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

    local keymap = vim.keymap
    local function opts(desc)
      return { desc = desc, noremap = true }
    end

    keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", opts("Toggle comment"))
    keymap.set("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", opts("Toggle comment"))
  end,
}
