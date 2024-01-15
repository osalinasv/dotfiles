local keymap = require("utils.keymap")

-- Search
keymap.map("n", "<leader>nh", "<cmd>nohl<CR>", "Clear highlights")

-- Override copy on delete
keymap.map("n", "d", '"_d')
keymap.map("n", "D", '"_D')
keymap.map("v", "d", '"_d')

-- IDE-like
keymap.map("n", "<C-s>", "<cmd>w<CR>", "Save buffer")
keymap.map("n", "<C-a>", "gg<S-v>G", "Select all")
keymap.map("n", "<C-q>", "<cmd>bd<CR>", "Close buffer")
keymap.map("n", "<C-n>", "<cmd>enew<CR>", "Open new buffer")
keymap.map({ "n", "v" }, "<M-up>", "<cmd>m-2<CR>==", "Move line up")
keymap.map({ "n", "v" }, "<M-down>", "<cmd>m+<CR>==", "Move line down")
keymap.map("i", "<S-Tab>", "<C-d>", "De-tab")

-- Split windows
keymap.map("n", "<leader>sv", "<C-w>v", "Split vertically")
keymap.map("n", "<leader>sh", "<C-w>s", "Split horizontally")
keymap.map("n", "<leader>sx", "<cmd>close<CR>", "Close split")
keymap.map("n", "<leader>se", "<C-w>=", "Equal width splits")

-- Move windows
keymap.map("n", "<C-S-left>", "<C-w>h", "Window left")
keymap.map("n", "<C-S-right>", "<C-w>l", "Window right")
keymap.map("n", "<C-S-up>", "<C-w>k", "Window up")
keymap.map("n", "<C-S-down>", "<C-w>j", "Window down")

-- Resize windows
keymap.map("n", "<C-w><left>", "<C-w><", "Dec window width")
keymap.map("n", "<C-w><right>", "<C-w>>", "Inc window width")
keymap.map("n", "<C-w><up>", "<C-w>+", "Inc window height")
keymap.map("n", "<C-w><down>", "<C-w>-", "Dec window height")

-- Navigation
keymap.map("n", "[b", "<cmd>bp<CR>", "Prev buffer")
keymap.map("n", "]b", "<cmd>bn<CR>", "Next buffer")
keymap.map("n", "[q", "<cmd>cp<CR>zz", "Prev in quickfix")
keymap.map("n", "]q", "<cmd>cn<CR>zz", "Next in quickfix")

keymap.map({ "n", "v" }, "<C-down>", "<C-d>", "Move down 1/2 screen")
keymap.map({ "n", "v" }, "<C-up>", "<C-u>", "Move up 1/2 screen")
