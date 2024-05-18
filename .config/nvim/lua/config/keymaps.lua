-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- LAZYVIM RESETS
-- buffers
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
-- terminal
vim.keymap.del("n", "<C-/>")
vim.keymap.del("n", "<C-_>")
vim.keymap.del("t", "<C-/>")
vim.keymap.del("t", "<C-_>")
-- tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

-- CUSTOM MAPS
local keymap = require("utils.keymap")

-- ide-like
keymap.nnoremap("<C-a>", "gg<S-v>G", { desc = "Select all" })
keymap.nnoremap("<C-q>", LazyVim.ui.bufremove, { desc = "Close buffer" })
keymap.nnoremap("<C-n>", "<cmd>enew<CR>", { desc = "Open new buffer" })
keymap.inoremap("<S-Tab>", "<C-d>", { desc = "De-tab" }) -- TODO: Fix in neovim 0.10.0
-- vim extensions
keymap.nnoremap("U", "<C-r>")
-- movement
keymap.map("H", "^")
keymap.map("L", "$")
keymap.nnoremap("<C-u>", "<C-u>zz")
keymap.nnoremap("<C-d>", "<C-d>zz")
keymap.nnoremap("{", "{zz")
keymap.nnoremap("}", "}zz")
keymap.nnoremap("N", "Nzz")
keymap.nnoremap("n", "nzz")
keymap.nnoremap("G", "Gzz")
keymap.nnoremap("gg", "ggzz")
keymap.inoremap("<C-h>", "<Left>")
keymap.inoremap("<C-l>", "<Right>")
-- buffers
keymap.nnoremap("<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap.nnoremap("<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- terminal
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end

keymap.nnoremap("<C-t>", lazyterm, { desc = "Terminal (Root Dir)" })
keymap.tnoremap("<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- windows
keymap.nnoremap("<leader>wq", "<C-W>c", { desc = "Close window" })
