local wezterm = require("wezterm")
local config = {}

-- Use default shell (PowerShell on Windows)
-- config.default_prog = { "pwsh.exe", "-NoLogo" }

-- Window
config.window_decorations = "RESIZE"
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }
config.initial_cols = 120
config.initial_rows = 32

-- Appearance - 中國高雅色係 (Chinese Elegant Palette)
-- Custom color scheme: 墨韻明 (Ink Rhythm - Bright)
config.colors = {
	foreground = "#f5f0e6",        -- 宣紙白 (Rice Paper White) - brighter
	background = "#1c1c1c",        -- 徽墨黑 (Ink Black)
	cursor_bg = "#e06050",         -- 朱砂紅 (Cinnabar) - vivid
	cursor_border = "#e06050",
	cursor_fg = "#1c1c1c",
	selection_fg = "#1c1c1c",
	selection_bg = "#a0b0af",      -- 青石灰亮 (Light Stone Grey)
	scrollbar_thumb = "#5a5a5a",
	split = "#5a8a9a",             -- 青花藍亮 (Bright Porcelain Blue)
	ansi = {
		"#3a3a3a", -- Black: 淡墨
		"#d06050", -- Red: 朱紅亮
		"#7a9a6a", -- Green: 竹青亮
		"#e4c470", -- Yellow: 藤黃亮
		"#5a8a9a", -- Blue: 靛青亮
		"#b08090", -- Magenta: 藕荷亮
		"#7ab0a0", -- Cyan: 青碧亮
		"#e8e0d0", -- White: 米白亮
	},
	brights = {
		"#5a5a5a", -- Bright Black
		"#f07060", -- Bright Red: 胭脂亮
		"#9aba8a", -- Bright Green: 碧綠亮
		"#f4d880", -- Bright Yellow: 秋香亮
		"#7aacbc", -- Bright Blue: 天青亮
		"#d0a0b0", -- Bright Magenta: 紫羅蘭亮
		"#a0d0c0", -- Bright Cyan: 湖水亮
		"#fff8f0", -- Bright White: 象牙白
	},
}
config.window_background_opacity = 0.95

-- Tab bar colors matching the theme
config.colors.tab_bar = {
	background = "#1c1c1c",
	active_tab = {
		bg_color = "#5a8a9a",
		fg_color = "#f5f0e6",
		intensity = "Bold",
	},
	inactive_tab = {
		bg_color = "#3a3a3a",
		fg_color = "#a0b0af",
	},
	inactive_tab_hover = {
		bg_color = "#4a6a7a",
		fg_color = "#f5f0e6",
	},
	new_tab = {
		bg_color = "#3a3a3a",
		fg_color = "#a0b0af",
	},
	new_tab_hover = {
		bg_color = "#5a8a9a",
		fg_color = "#f5f0e6",
	},
}
-- Font
config.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono", weight = "Medium" },
	"Consolas",
	"Courier New",
})
config.font_size = 12.0
config.line_height = 1.1

-- Scrollback
config.scrollback_lines = 10000

-- Performance (RTX 3090)
config.front_end = "WebGpu"
config.webgpu_preferred_adapter = nil -- Auto-select best GPU
config.max_fps = 120

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500

-- Keys
config.keys = {
	-- Pane splitting
	{ mods = "CTRL|SHIFT", key = "|", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "CTRL|SHIFT", key = "_", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- Pane navigation
	{ mods = "CTRL|SHIFT", key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
	{ mods = "CTRL|SHIFT", key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
	{ mods = "CTRL|SHIFT", key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
	{ mods = "CTRL|SHIFT", key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
	-- Pane resizing
	{ mods = "CTRL|SHIFT|ALT", key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	{ mods = "CTRL|SHIFT|ALT", key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	{ mods = "CTRL|SHIFT|ALT", key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	{ mods = "CTRL|SHIFT|ALT", key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
	-- Close pane
	{ mods = "CTRL|SHIFT", key = "w", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	-- New tab
	{ mods = "CTRL|SHIFT", key = "t", action = wezterm.action.SpawnTab("DefaultDomain") },
	-- Tab navigation
	{ mods = "CTRL|SHIFT", key = "Tab", action = wezterm.action.ActivateTabRelative(1) },
	{ mods = "CTRL|SHIFT|ALT", key = "Tab", action = wezterm.action.ActivateTabRelative(-1) },
	-- Font size
	{ mods = "CTRL", key = "=", action = wezterm.action.IncreaseFontSize },
	{ mods = "CTRL", key = "-", action = wezterm.action.DecreaseFontSize },
	{ mods = "CTRL", key = "0", action = wezterm.action.ResetFontSize },
	-- Reload config
	{ mods = "CTRL|SHIFT", key = "r", action = wezterm.action.ReloadConfiguration },
}

-- Copy/paste with mouse selection
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

-- Bell
config.audible_bell = "Disabled"
config.visual_bell = {
	target = "CursorColor",
	fade_in_duration_ms = 75,
	fade_out_duration_ms = 75,
}

-- Clean up
config.window_close_confirmation = "AlwaysPrompt"
config.switch_to_last_active_tab_when_closing_tab = true

return config
