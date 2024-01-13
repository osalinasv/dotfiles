return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      on_attach = function(buf)
        local gs = package.loaded.gitsigns
        local keymap = require("utils.keymap")

        keymap.map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, "Next git hunk", { expr = true, buffer = buf })

        keymap.map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, "Prev git hunk", { expr = true, buffer = buf })

        keymap.map("n", "<leader>hs", gs.stage_hunk, "Stage git hunk", { buffer = buf })
        keymap.map("n", "<leader>hr", gs.reset_hunk, "Reset git hunk", { buffer = buf })
        keymap.map("n", "<leader>hu", gs.undo_stage_hunk, "Unstage git hunk", { buffer = buf })
        keymap.map("n", "<leader>hp", gs.preview_hunk, "Preview git hunk", { buffer = buf })
        keymap.map("n", "<leader>hS", gs.stage_buffer, "Git stage buffer", { buffer = buf })
        keymap.map("n", "<leader>hR", gs.reset_buffer, "Git reset buffer", { buffer = buf })
        keymap.map("n", "<leader>hd", gs.diffthis, "Split view git diff", { buffer = buf })
      end,
    })
  end,
}
