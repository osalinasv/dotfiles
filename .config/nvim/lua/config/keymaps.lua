-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- LAZYVIM RESETS
-- buffers
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

-- CUSTOM MAPS
local keymap = require("utils.keymap")
-- ide-like
keymap.inoremap("<S-Tab>", "<C-d>", { desc = "De-tab" })
-- neovim extensions
keymap.nnoremap("<C-q>", "<leader>bd", { remap = true, desc = "Delete Buffer" })
keymap.nnoremap(
  "<C-e>",
  "<leader>e",
  { remap = true, desc = "Explorer (Root Dir)" }
)
-- vim extensions
keymap.nnoremap("U", "<C-r>")
-- movement
keymap.nmap("<S-h>", "^")
keymap.nmap("<S-l>", "$")
keymap.nnoremap("<C-u>", "<C-u>zz")
keymap.nnoremap("<C-d>", "<C-d>zz")
keymap.nnoremap("{", "{zz")
keymap.nnoremap("}", "}zz")
keymap.nnoremap("N", "Nzz")
keymap.nnoremap("n", "nzz")
keymap.nnoremap("G", "Gzz")
keymap.nnoremap("gg", "ggzz")
-- buffers
keymap.nnoremap("<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap.nnoremap("<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- terminal
keymap.nnoremap(
  "<C-t>",
  "<leader>fT",
  { remap = true, desc = "Terminal (cwd)" }
)
keymap.tnoremap("<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
