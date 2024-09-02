local wezterm = require("wezterm")
local mux = wezterm.mux

local is_windows = function()
	return wezterm.target_triple:find("windows") ~= nil
end

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = is_darwin() and 15 or 12

config.color_scheme = "Tokyo Night"

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_and_split_indices_are_zero_based = true
config.tab_bar_at_bottom = true

if is_windows() then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
end

config.keys = {
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
}

wezterm.on("gui-startup", function()
	mux.spawn_window({ width = 120, height = 40 })
end)

return config
