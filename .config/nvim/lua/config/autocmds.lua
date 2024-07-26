-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local Path = require("plenary.path")

vim.api.nvim_create_autocmd("InsertLeavePre", {
  callback = function()
    if vim.snippet.active() then
      vim.snippet.stop()
    end
  end,
})

vim.api.nvim_create_user_command("CopyFilePathToClipboard", function()
  local file_path = vim.api.nvim_buf_get_name(0)
  local current_dir = vim.fn.getcwd()

  local project_root = Path:new(current_dir):parent():absolute()
  local path_obj = Path:new(file_path)

  local relative_path = path_obj:make_relative(project_root)

  vim.fn.setreg("+", relative_path)
end, {})
