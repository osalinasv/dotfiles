local M = {}

function M.map(mode, left, right, desc, options)
  local config =
    vim.tbl_extend("force", { desc = desc, noremap = true }, options or {})
  vim.keymap.set(mode, left, right, config)
end

return M
