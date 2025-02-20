local wezterm = require("wezterm")
local config = wezterm.config_builder()

local font = wezterm.font("MonoLisa Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" })
local font_size = 9

config.font = font
config.font_size = font_size

config.colors = {
  foreground = "#c0caf5",
  background = "#1a1b26",
  cursor_bg = "#c0caf5",
  cursor_border = "#c0caf5",
  cursor_fg = "#1a1b26",
  selection_bg = "#2e3c64",
  selection_fg = "#c0caf5",
  split = "#7aa2f7",
  compose_cursor = "#ff9e64",
  scrollbar_thumb = "#292e42",

  ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
  brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },

  -- tab_bar = {
  --   inactive_tab_edge = "#16161e",
  --   background = "#1a1b26",
  --
  --   active_tab = {
  --     fg_color = "#16161e",
  --     bg_color = "#7aa2f7",
  --   },
  --
  --   inactive_tab = {
  --     fg_color = "#545c7e",
  --     bg_color = "#292e42",
  --   },
  --
  --   inactive_tab_hover = {
  --     fg_color = "#7aa2f7",
  --     bg_color = "#292e42",
  --     -- intensity = "Bold",
  --   },
  --
  --   new_tab_hover = {
  --     fg_color = "#7aa2f7",
  --     bg_color = "#24283b",
  --     intensity = "Bold",
  --   },
  --
  --   new_tab = {
  --     fg_color = "#7aa2f7",
  --     bg_color = "#24283b",
  --   },
  -- },
}

config.keys = {
  { key = "y", mods = "ALT",       action = wezterm.action.ScrollByLine(-1) },
  { key = "e", mods = "ALT",       action = wezterm.action.ScrollByLine(1) },
  { key = "u", mods = "ALT",       action = wezterm.action.ScrollByPage(-1) },
  { key = "d", mods = "ALT",       action = wezterm.action.ScrollByPage(1) },

  { key = "n", mods = "ALT",       action = wezterm.action.SpawnCommandInNewTab({ cwd = wezterm.home_dir }) },
  { key = "n", mods = "ALT|SHIFT", action = wezterm.action.SpawnTab("DefaultDomain") },
  { key = "h", mods = "ALT",       action = wezterm.action.ActivateTabRelative(-1) },
  { key = "l", mods = "ALT",       action = wezterm.action.ActivateTabRelative(1) },
  { key = ",", mods = "ALT",       action = wezterm.action.MoveTabRelative(-1) },
  { key = ".", mods = "ALT",       action = wezterm.action.MoveTabRelative(1) },

  -- { key = "ENTER", mods = "ALT",       action = wezterm.action.SpawnWindow },
  { key = "w", mods = "ALT",       action = wezterm.action.CloseCurrentPane({ confirm = true }) },
}

-- config.tab_bar_at_bottom = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_frame = {
  font = font,
  font_size = 6,
  active_titlebar_bg = "#1a1b26",
  inactive_titlebar_bg = "#1a1b26",
}
config.window_decorations = "RESIZE"

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
