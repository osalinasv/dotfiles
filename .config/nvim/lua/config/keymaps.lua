-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- LAZYVIM RESETS
-- buffers
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")
-- terminal
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<C-/>")
vim.keymap.del("n", "<C-_>")
vim.keymap.del("t", "<C-/>")
vim.keymap.del("t", "<C-_>")
-- others
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>L")
-- tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")
-- lazygit
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")

-- CUSTOM MAPS
local keymap = require("utils.keymap")
local Util = require("lazyvim.util")

-- ide-like
keymap.map("n", "<C-a>", "gg<S-v>G", "Select all")
keymap.map("n", "<C-q>", "<cmd>bd<CR>", "Close buffer")
keymap.map("n", "<C-n>", "<cmd>enew<CR>", "Open new buffer")
keymap.map("i", "<S-Tab>", "<C-d>", "De-tab")
-- buffers
keymap.map("n", "<S-Tab>", "<cmd>bprevious<cr>", "Prev buffer")
keymap.map("n", "<Tab>", "<cmd>bnext<cr>", "Next buffer")
-- terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
keymap.map("n", "<C-t>", lazyterm, "Terminal (root dir)")
keymap.map("t", "<C-t>", "<cmd>close<cr>", "Hide Terminal")
