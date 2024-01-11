local keymap = vim.keymap
local function opts(desc)
  return { desc = desc, noremap = true }
end

-- Search
keymap.set("n", "<leader>nh", ":nohl<CR>", opts("Clear highlights"))

-- Override copy on delete
keymap.set("n", "d", '"_d')
keymap.set("n", "D", '"_D')
keymap.set("v", "d", '"_d')

-- IDE-like
keymap.set("n", "<C-s>", ":w<CR>", opts("Save current buffer"))
keymap.set("n", "<C-a>", "gg<S-v>G", opts("Select all"))
keymap.set("n", "<C-q>", ":bd<CR>", opts("Close current buffer"))
keymap.set("n", "<C-n>", ":enew<CR>", opts("Open new buffer"))
keymap.set({ "n", "v" }, "<A-up>", ":m-2<CR>==", opts("Move line up"))
keymap.set({ "n", "v" }, "<A-down>", ":m+<CR>==", opts("Move line down"))

-- Split windows
keymap.set("n", "<leader>sv", "<C-w>v", opts("Split window vertically"))
keymap.set("n", "<leader>sh", "<C-w>s", opts("Split window horizontally"))
keymap.set("n", "<leader>sx", ":close<CR>", opts("Close current split"))

-- Move windows
keymap.set("n", "<C-S-left>", "<C-w>h", opts("Window left"))
keymap.set("n", "<C-S-right>", "<C-w>l", opts("Window right"))
keymap.set("n", "<C-S-up>", "<C-w>k", opts("Window up"))
keymap.set("n", "<C-S-down>", "<C-w>j", opts("Window down"))

-- Resize windows
keymap.set("n", "<C-w><left>", "<C-w><", opts("Resize window on left"))
keymap.set("n", "<C-w><right>", "<C-w>>", opts("Resize window on right"))
keymap.set("n", "<C-w><up>", "<C-w>+", opts("Resize window on top"))
keymap.set("n", "<C-w><down>", "<C-w>-", opts("Resize window on bottom"))

-- Navigation
keymap.set("n", "[b", ":bp<CR>", opts("Previous buffer"))
keymap.set("n", "]b", ":bn<CR>", opts("Next buffer"))

keymap.set("n", "<C-down>", "<C-d>", opts("Move down 1/2 screen"))
keymap.set("n", "<C-up>", "<C-u>", opts("Move up 1/2 screen"))
