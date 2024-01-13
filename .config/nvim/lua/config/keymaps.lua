local keymap = vim.keymap
local function opts(desc)
  return { desc = desc, noremap = true }
end

-- Search
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", opts("Clear highlights"))

-- Override copy on delete
keymap.set("n", "d", '"_d')
keymap.set("n", "D", '"_D')
keymap.set("v", "d", '"_d')

-- IDE-like
keymap.set("n", "<C-s>", "<cmd>w<CR>", opts("Save buffer"))
keymap.set("n", "<C-a>", "gg<S-v>G", opts("Select all"))
keymap.set("n", "<C-q>", "<cmd>bd<CR>", opts("Close buffer"))
keymap.set("n", "<C-n>", "<cmd>enew<CR>", opts("Open new buffer"))
keymap.set({ "n", "v" }, "<M-up>", "<cmd>m-2<CR>==", opts("Move line up"))
keymap.set({ "n", "v" }, "<M-down>", "<cmd>m+<CR>==", opts("Move line down"))

-- Split windows
keymap.set("n", "<leader>sv", "<C-w>v", opts("Split vertically"))
keymap.set("n", "<leader>sh", "<C-w>s", opts("Split horizontally"))
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts("Close split"))
keymap.set("n", "<leader>se", "<C-w>=", opts("Equal width splits"))

-- Move windows
keymap.set("n", "<C-S-left>", "<C-w>h", opts("Window left"))
keymap.set("n", "<C-S-right>", "<C-w>l", opts("Window right"))
keymap.set("n", "<C-S-up>", "<C-w>k", opts("Window up"))
keymap.set("n", "<C-S-down>", "<C-w>j", opts("Window down"))

-- Resize windows
keymap.set("n", "<C-w><left>", "<C-w><", opts("Dec window width"))
keymap.set("n", "<C-w><right>", "<C-w>>", opts("Inc window width"))
keymap.set("n", "<C-w><up>", "<C-w>+", opts("Inc window height"))
keymap.set("n", "<C-w><down>", "<C-w>-", opts("Dec window height"))

-- Navigation
keymap.set("n", "[b", "<cmd>bp<CR>", opts("Prev buffer"))
keymap.set("n", "]b", "<cmd>bn<CR>", opts("Next buffer"))
keymap.set("n", "[q", "<cmd>cp<CR>zz", opts("Prev in quickfix"))
keymap.set("n", "]q", "<cmd>cn<CR>zz", opts("Next in quickfix"))

keymap.set("n", "<C-down>", "<C-d>", opts("Move down 1/2 screen"))
keymap.set("n", "<C-up>", "<C-u>", opts("Move up 1/2 screen"))
