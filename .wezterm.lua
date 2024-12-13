local wezterm = require("wezterm")
local mux = wezterm.mux

local IS_WINDOWS = wezterm.target_triple:find("windows") ~= nil
local IS_DARWIN = wezterm.target_triple:find("darwin") ~= nil

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = IS_DARWIN and 15 or 12

config.color_scheme = "Tokyo Night"

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_and_split_indices_are_zero_based = true
config.tab_bar_at_bottom = true

config.use_dead_keys = false
config.disable_default_key_bindings = true

if IS_WINDOWS then
	config.default_prog = { "pwsh.exe", "-NoLogo", "-NoProfileLoadTime" }
end

config.keys = {
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "q",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "Tab",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "Tab",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "_",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
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
	local height = IS_DARWIN and 40 or 50
	mux.spawn_window({ width = 120, height = height })
end)

return config
