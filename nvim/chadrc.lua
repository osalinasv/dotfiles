---@type ChadrcConfig
local M = {
  ui = { theme = "catppuccin" },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  plugins = "custom.plugins",
  mappings = require("custom.mappings"),
}

return M
