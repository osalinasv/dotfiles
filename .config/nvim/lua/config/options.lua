-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- global
opt.title = true
-- encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
-- plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- clipboard
opt.clipboard = "unnamed,unnamedplus"
-- backspace
opt.backspace = { "start", "eol", "indent" }
-- tabs
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.breakindent = true
opt.smartindent = true
-- editor
opt.wrap = false
opt.cursorline = true
opt.colorcolumn = "80"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.listchars:append({ lead = "·" })
-- mouse support
opt.mouse = "a"
-- shell
opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
opt.shellquote = ""
opt.shellxquote = ""
