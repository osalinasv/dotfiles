-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.lazyvim_prettier_needs_config = false

opt.backspace = { "start", "eol", "indent" }
opt.breakindent = true
opt.colorcolumn = "80"
opt.conceallevel = 0
opt.cursorline = true
opt.expandtab = true
opt.listchars:append({ lead = "·", trail = "·", nbsp = "+" })
opt.mouse = "a"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartindent = true
opt.softtabstop = 2
opt.tabstop = 2
opt.wrap = false

if vim.uv.os_uname().sysname:find("Windows") then
  opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
  opt.shellcmdflag = table.concat({
    "-NoLogo",
    "-NoProfile",
    "-NoProfileLoadTime",
    "-ExecutionPolicy RemoteSigned",
    "-Command ",
  }, " ")
  opt.shellredir = "| Out-File -Encoding UTF8"
  opt.shellpipe = "| Out-File -Encoding UTF8"
  opt.shellquote = ""
  opt.shellxquote = ""
end
