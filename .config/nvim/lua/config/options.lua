-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- global
opt.title = true
-- encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
-- plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- tabs
opt.softtabstop = 2
opt.breakindent = true
-- editor
opt.colorcolumn = "80"
opt.listchars:append({ lead = "·" })
-- shell
opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
opt.shellquote = ""
opt.shellxquote = ""
-- backspace
opt.backspace = { "start", "eol", "indent" }
