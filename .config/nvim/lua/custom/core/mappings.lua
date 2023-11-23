vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap.set("n", "<A-j>", ":m+<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-down>", ":m+<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m-2<CR>==", { desc = "Move line up" })
keymap.set("n", "<A-up>", ":m-2<CR>==", { desc = "Move line up" })

keymap.set("v", "<A-j>", "<Esc>:m+<CR>==gi", { desc = "Move line down" })
keymap.set("v", "<A-down>", "<Esc>:m+<CR>==gi", { desc = "Move line down" })
keymap.set("v", "<A-k>", "<Esc>:m-2<CR>==gi", { desc = "Move line up" })
keymap.set("v", "<A-up>", "<Esc>:m-2<CR>==gi", { desc = "Move line up" })
