-- Tanks to Josean Martinez

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.initial_rows = 42
config.initial_cols = 125

-- Color scheme
-- config.color_scheme = 'AdventureTime'
config.color_scheme = "Catppuccin Macchiato" -- or Mocha, Frappe, Latte
config.font = wezterm.font("JetBrains Mono")
--config.font = wezterm.font("Hack Nerd Font Mono")
-- config.font = wezterm.font("Hack Nerd Font Mono")
--config.font = wezterm.font("Lato")
--config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 10

config.enable_tab_bar = false

-- Window decoration NONE|RESIZE|FULL
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 9

config.window_frame = {
	inactive_titlebar_bg = "#353535",
	active_titlebar_bg = "#2b2042",
	inactive_titlebar_fg = "#cccccc",
	active_titlebar_fg = "#ffffff",
	inactive_titlebar_border_bottom = "#2b2042",
	active_titlebar_border_bottom = "#2b2042",
	button_fg = "#cccccc",
	button_bg = "#2b2042",
	button_hover_fg = "#ffffff",
	button_hover_bg = "#3b3052",
}

-- and finally, return the configuration to wezterm
return config
