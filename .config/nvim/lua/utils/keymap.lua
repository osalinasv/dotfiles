local M = {}

local function merge(first_table, second_table)
  for k, v in pairs(second_table) do
    first_table[k] = v
  end

  return first_table
end

function M.map(mode, left, right, desc, options)
  local config = merge({ desc = desc, noremap = true }, options or {})
  vim.keymap.set(mode, left, right, config)
end

return M
