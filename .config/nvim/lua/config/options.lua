-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.backspace = { "start", "eol", "indent" }
opt.breakindent = true
opt.colorcolumn = "80"
opt.conceallevel = 0
opt.cursorline = true
opt.expandtab = true
opt.listchars:append({ lead = "·" })
opt.mouse = "a"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartindent = true
opt.softtabstop = 2
opt.tabstop = 2
opt.wrap = false

opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
opt.shellquote = ""
opt.shellxquote = ""
