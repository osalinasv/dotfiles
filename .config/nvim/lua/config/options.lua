local opt = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.title = true
opt.ignorecase = true

-- Encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.skip_ts_context_commentstring_module = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.softtabstop = 2
opt.tabstop = 2
opt.breakindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.completeopt = { "menuone", "noselect" }
opt.updatetime = 100

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Editor
opt.colorcolumn = "80"
opt.conceallevel = 0
opt.cmdheight = 1
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = false
opt.showtabline = 0
opt.undofile = true
opt.list = true
opt.listchars:append({ lead = "·" })

-- Shell
opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
opt.shellquote = ""
opt.shellxquote = ""

-- Backspace
opt.backspace = { "start", "eol", "indent" }

-- Clipboard
opt.clipboard = "unnamedplus"

-- Search files
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

-- Split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Turn off swapfile
opt.swapfile = false
