return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Next git hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Prev git hunk" })

        map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage git hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset git hunk" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Unstage git hunk" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview git hunk" })

        map("n", "<leader>hS", gs.stage_buffer, { desc = "Git stage buffer" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Git reset buffer" })

        map("n", "<leader>hd", gs.diffthis, { desc = "Split view git diff" })
      end,
    })
  end,
}
