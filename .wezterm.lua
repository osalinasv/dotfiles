local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 12

config.color_scheme = "Tokyo Night"

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_and_split_indices_are_zero_based = true
config.tab_bar_at_bottom = true

config.default_prog = { "pwsh.exe", "-NoLogo" }

wezterm.on("gui-startup", function()
	mux.spawn_window({ width = 120, height = 40 })
end)

return config
