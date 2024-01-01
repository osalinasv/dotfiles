return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "VeryLazy",
  ft = { "gitcommit", "diff" },
  init = function()
    -- load gitsigns only when a git file is opened
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
      callback = function()
        vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
        if vim.v.shell_error == 0 then
          vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
          vim.schedule(function()
            require("lazy").load({ plugins = { "gitsigns.nvim" } })
          end)
        end
      end,
    })
  end,
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
        end, { expr = true, desc = "Go to next git hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Go to previous git hunk" })

        map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage git hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset git hunk" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Unstage git hunk" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview git hunk" })

        map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage current buffer" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset current buffer" })

        map("n", "<leader>hd", gs.diffthis, { desc = "Split view git diff buffer" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle git deleted" })
      end,
    })
  end,
}
