local M = {}

M.disabled = {
  n = {
    ["<leader>/"] = "",
  },
  v = {
    ["<leader>/"] = "",
  },
}

M.abc = {
  n = {
    ["<A-j>"] = { ":m+<CR>==", "Move line down" },
    ["<A-down>"] = { ":m+<CR>==", "Move line down" },
    ["<A-k>"] = { ":m-2<CR>==", "Move line up" },
    ["<A-up>"] = { ":m-2<CR>==", "Move line up" },
  },
  i = {
    ["<A-j>"] = { "<Esc>:m+<CR>==gi", "Move line down" },
    ["<A-down>"] = { "<Esc>:m+<CR>==gi", "Move line down" },
    ["<A-k>"] = { "<Esc>:m-2<CR>==gi", "Move line up" },
    ["<A-up>"] = { "<Esc>:m-2<CR>==gi", "Move line up" },
  },
}

M.comment = {
  plugin = true,

  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },
  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<F2>"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
  },
}

return M
